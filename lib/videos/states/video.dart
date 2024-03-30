import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:invidious/videos/models/dislike.dart';
import 'package:logging/logging.dart';

import '../../downloads/states/download_manager.dart';
import '../../globals.dart';
import '../../player/states/player.dart';
import '../../settings/models/errors/invidious_service_error.dart';
import '../../settings/states/settings.dart';
import '../models/video.dart';

part 'video.freezed.dart';

const String coulnotLoadVideos = 'cannot-load-videos';
final log = Logger('Video');

class VideoCubit extends Cubit<VideoState> {
  final DownloadManagerCubit downloadManager;
  final PlayerCubit player;
  final SettingsCubit settings;

  VideoCubit(
      super.initialState, this.downloadManager, this.player, this.settings) {
    onReady();
  }

  Future<void> onReady() async {
    try {
      Video video = await service.getVideo(state.videoId);
      var dislikes = state.dislikes;

      try {
        if (settings.state.useReturnYoutubeDislike) {
          Dislike dislike = await service.getDislikes(state.videoId);
          dislikes = dislike.dislikes;
        }
      } catch (e) {
        log.info("Failed to get dislikes for video ${state.videoId}");
      }

      emit(state.copyWith(
          loadingVideo: false,
          video: video,
          dislikes: dislikes,
          isLoggedIn: await service.isLoggedIn()));

      getDownloadStatus();
    } catch (err) {
      late String error;
      if (err is InvidiousServiceError) {
        error = (err).message;
      } else {
        error = coulnotLoadVideos;
      }
      emit(state.copyWith(error: error, loadingVideo: false));
      rethrow;
    }
  }

  getDownloadStatus() {
    var downloadedVideo = db.getDownloadByVideoId(state.videoId);
    initStreamListener();
    if (!isClosed) emit(state.copyWith(downloadedVideo: downloadedVideo));
  }

  @override
  close() async {
    var state = this.state.copyWith();
    if (downloadManager.state.downloadProgresses.containsKey(state.videoId)) {
      downloadManager.removeListener(state.videoId, onDownloadProgress);
    }
    super.close();
  }

  onDownload() {
    emit(state.copyWith(downloading: true, downloadProgress: 0));
  }

  onDownloadProgress(double progress) {
    if (state.video != null) {
      late bool downloading;
      if (progress < 1) {
        downloading = true;
      } else {
        getDownloadStatus();
        downloading = false;
      }
      emit(
          state.copyWith(downloadProgress: progress, downloading: downloading));
    }
  }

  initStreamListener() {
    if (downloadManager.state.downloadProgresses.containsKey(state.videoId)) {
      downloadManager.addListener(state.videoId, onDownloadProgress);
    }
  }

  togglePlayRecommendedNext(bool? value) {
    settings.setPlayRecommendedNext(value ?? false);
  }

  void restartVideo(bool? audio) {
    if (state.video != null) {
      player.showBigPlayer();
      player.seek(Duration.zero);
    }
  }

  void playVideo(bool? audio) {
    if (state.video != null) {
      List<BaseVideo> videos = [state.video!];
      if (!settings.state.distractionFreeMode &&
          settings.state.playRecommendedNext) {
        videos.addAll(state.video?.recommendedVideos ?? []);
      }
      player.playVideo(videos, audio: audio);
    }
  }
}

@freezed
class VideoState with _$VideoState {
  const factory VideoState(
      {Video? video,
      int? dislikes,
      @Default(true) loadingVideo,
      required String videoId,
      required bool isLoggedIn,
      @Default(false) bool downloading,
      @Default(0) double downloadProgress,
      DownloadedVideo? downloadedVideo,
      @Default(1) double opacity,
      @Default('') String error}) = _VideoState;

  const VideoState._();

  static VideoState init({required String videoId}) {
    return VideoState(videoId: videoId, isLoggedIn: false);
  }

  bool get downloadFailed => downloadedVideo?.downloadFailed ?? false;

  bool get isDownloaded {
    if (video != null) {
      return downloadedVideo != null;
    } else {
      return false;
    }
  }
}
