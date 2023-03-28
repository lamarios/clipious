import 'package:get/get.dart';
import 'package:invidious/utils.dart';

import '../globals.dart';

class VideoInListController extends GetxController {
  static VideoInListController? to(String? tags) => safeGet(tag: tags);
  late double progress;
  late String videoId;

  VideoInListController(this.videoId) {
    progress = _getProgress();
  }

  double _getProgress() {
    return db.getVideoProgress(videoId);
  }

  @override
  onReady() {
    super.onReady();
    updateProgress();
  }

  updateProgress() {
    progress = db.getVideoProgress(videoId);
    update();
  }
}
