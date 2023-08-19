import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/database.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:invidious/videos/models/dislike.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:logging/logging.dart';

import '../../downloads/states/download_manager.dart';
import '../../globals.dart';
import '../../settings/models/errors/invidiousServiceError.dart';
import '../models/video.dart';
import '../../player/states/player.dart';

part 'video.g.dart';

const String coulnotLoadVideos = 'cannot-load-videos';
final log = Logger('Video');

class VideoCubit extends Cubit<VideoState> {
  final DownloadManagerCubit downloadManager;
  final PlayerCubit player;

  VideoCubit(super.initialState, this.downloadManager, this.player) {
    onReady();
  }

  Future<void> onReady() async {
    try {
      var state = this.state.copyWith();
      Video video = await service.getVideo(state.videoId);
      state.video = video;
      state.loadingVideo = false;

      if (state.getDislikes) {
        Dislike dislike = await service.getDislikes(state.videoId);
        state.dislikes = dislike.dislikes;
      }

      emit(state);

      getDownloadStatus();

      if (state.autoplayOnLoad) {
        playVideo(false);
      }
    } catch (err) {
      var state = this.state.copyWith();
      if (err is InvidiousServiceError) {
        state.error = (err).message;
      } else {
        state.error = coulnotLoadVideos;
      }
      state.loadingVideo = false;
      emit(state);
      rethrow;
    }
  }

  getDownloadStatus() {
    var state = this.state.copyWith();
    state.downloadedVideo = db.getDownloadByVideoId(state.videoId);

    initStreamListener();
    emit(state);
  }

  @override
  close() async {
    var state = this.state.copyWith();
    state.scrollController.dispose();
    if (downloadManager.state.downloadProgresses.containsKey(state.videoId)) {
      downloadManager.removeListener(state.videoId, onDownloadProgress);
    }
    super.close();
  }

  onDownload() {
    var state = this.state.copyWith();
    state.downloading = true;
    state.downloadProgress = 0;
    emit(state);
  }

  onDownloadProgress(double progress) {
    var state = this.state.copyWith();
    if (state.video != null) {
      state.downloadProgress = progress;
      if (progress < 1) {
        state.downloading = true;
      } else {
        getDownloadStatus();
        state = this.state.copyWith();
        state.downloading = false;
      }
      emit(state);
    }
  }

  initStreamListener() {
    if (downloadManager.state.downloadProgresses.containsKey(state.videoId)) {
      downloadManager.addListener(state.videoId, onDownloadProgress);
    }
  }

  togglePlayRecommendedNext(bool? value) {
    var state = this.state.copyWith();
    db.saveSetting(SettingsValue(PLAY_RECOMMENDED_NEXT, value.toString()));
    state.playRecommendedNext = value ?? false;
    emit(state);
  }

  selectIndex(int index) {
    var state = this.state.copyWith();
    state.selectedIndex = index;
    emit(state);
    scrollUp();
  }

  void playVideo(bool? audio) {
    if (state.video != null) {
      List<BaseVideo> videos = [state.video!];
      if (state.playRecommendedNext) {
        videos.addAll(state.video?.recommendedVideos ?? []);
      }
      player.playVideo(videos, goBack: true, audio: audio);
    }
  }

  scrollUp() {
    state.scrollController.animateTo(0, duration: animationDuration, curve: Curves.easeInOutQuad);
  }
}

@CopyWith(constructor: "_")
class VideoState {
  Video? video;
  int? dislikes;
  bool loadingVideo = true;
  bool autoplayOnLoad = db.getSettings(PLAYER_AUTOPLAY_ON_LOAD)?.value == 'true';
  bool playRecommendedNext = db.getSettings(PLAY_RECOMMENDED_NEXT)?.value == 'true';
  bool getDislikes = db.getSettings(USE_RETURN_YOUTUBE_DISLIKE)?.value == 'true';

  int selectedIndex = 0;
  String videoId;
  bool isLoggedIn = service.isLoggedIn();
  bool downloading = false;
  double downloadProgress = 0;
  DownloadedVideo? downloadedVideo;
  ScrollController scrollController = ScrollController();

  double opacity = 1;

  String error = '';

  VideoState({required this.videoId});

  bool get downloadFailed => downloadedVideo?.downloadFailed ?? false;

  bool get isDownloaded {
    if (video != null) {
      return downloadedVideo != null;
    } else {
      return false;
    }
  }

  VideoState._(this.scrollController, this.video, this.dislikes, this.loadingVideo, this.autoplayOnLoad, this.playRecommendedNext, this.getDislikes, this.selectedIndex, this.videoId, this.isLoggedIn,
      this.downloading, this.downloadProgress, this.downloadedVideo, this.opacity, this.error);
}
