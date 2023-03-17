import 'package:get/get.dart';

import '../globals.dart';

class VideoInListController extends GetxController {
  static VideoInListController to(String? tags) => Get.find(tag: tags);
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
