import 'package:get/get.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/utils.dart';

import '../globals.dart';

class VideoInListController extends GetxController {
  static VideoInListController? to(String? tags) => safeGet(tag: tags);
  late double progress;
  BaseVideo video;

  VideoInListController(this.video) {
    progress = _getProgress();
  }

  double _getProgress() {
    return db.getVideoProgress(video.videoId);
  }

  @override
  onReady() {
    super.onReady();
    updateProgress();
  }

  updateProgress() {
    progress = db.getVideoProgress(video.videoId);
    update();
  }

  void showVideoDetails() {
    video.filtered = false;
    update();
  }
}
