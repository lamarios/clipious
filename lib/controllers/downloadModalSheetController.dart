import 'package:get/get.dart';

class DownloadModalSheetController extends GetxController {
  bool audioOnly = false;
  String quality = '720p';

  setAudioOnly(bool value) {
    audioOnly = value;
    update();
  }

  setQuality(String quality) {
    this.quality = quality;
    update();
  }
}
