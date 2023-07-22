import 'package:get/get.dart';
import 'package:invidious/controllers/videoInnerViewController.dart';
import 'package:invidious/database.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/models/dislike.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/errors/invidiousServiceError.dart';
import '../models/video.dart';
import 'downloadController.dart';
import 'miniPayerController.dart';

const String coulnotLoadVideos = 'cannot-load-videos';

class VideoController extends GetxController {
  final log = Logger('Video');
  Video? video;
  int dislikes = 0;
  bool loadingVideo = true;
  bool autoplayOnLoad = db.getSettings(PLAYER_AUTOPLAY_ON_LOAD)?.value == 'true';
  bool playRecommendedNext = db.getSettings(PLAY_RECOMMENDED_NEXT)?.value == 'true';
  bool getDislikes = db.getSettings(USE_RETURN_YOUTUBE_DISLIKE)?.value == 'true';

  int selectedIndex = 0;
  String videoId;
  bool isLoggedIn = service.isLoggedIn();
  bool downloading = false;

  double opacity = 1;

  String error = '';

  VideoController({required this.videoId});

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      Video video = await service.getVideo(videoId);
      this.video = video;
      loadingVideo = false;

      if (getDislikes) {
        Dislike dislike = await service.getDislikes(videoId);
        dislikes = dislike.dislikes;
      }

      update();

      if (autoplayOnLoad) {
        playVideo();
      }
    } catch (err) {
      if (err is InvidiousServiceError) {
        error = (err).message;
      } else {
        error = coulnotLoadVideos;
      }
      loadingVideo = false;
      update();
      rethrow;
    }
  }

  togglePlayRecommendedNext(bool? value) {
    db.saveSetting(SettingsValue(PLAY_RECOMMENDED_NEXT, value.toString()));
    playRecommendedNext = value ?? false;
    update();
  }

  selectIndex(int index) {
    selectedIndex = index;
    update();
    VideoInnerViewController.to(tag: VideoInnerViewController.getControllerTags(video?.videoId ?? ''))?.scrollUp();
  }

  void playVideo() {
    if (video != null) {
      List<BaseVideo> videos = [video!];
      if (playRecommendedNext) {
        videos.addAll(video?.recommendedVideos ?? []);
      }
      MiniPlayerController.to()?.playVideo(videos, goBack: true);
    }
  }

  bool get isDownloaded {
    if (video != null) {
      return db.getDownloadByVideoId(videoId) != null;
    } else {
      return false;
    }
  }

  Future<bool> downloadVideo() async {
    if (video != null) {
      downloading = true;
      update();
      var bool = await DownloadController.to()?.addDownload(video!) ?? false;
      downloading = false;
      update();
      return bool;
    } else {
      return false;
    }
  }
}
