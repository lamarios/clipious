import 'package:animate_to/animate_to.dart';
import 'package:get/get.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/utils.dart';

class DownloadController extends GetxController {
  static DownloadController? to() => safeGet(tag: 'dl');
  final animateToController = AnimateToController();

  int downloads = 0;

  @override
  onInit() {
    super.onInit();
  }

  addDownload(BaseVideo video) {
    downloads++;
    update();
  }
}
