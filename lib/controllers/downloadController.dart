import 'package:animate_to/animate_to.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/utils.dart';

class DownloadController extends GetxController {
  static DownloadController? to() => safeGet(tag: 'dl');
  final animateToController = AnimateToController();
  List<DownloadedVideo> videos = db.getAllDownloads();

  int downloads = 0;

  @override
  onClose() {
    animateToController.dispose();
    super.onClose();
  }

  addDownload(BaseVideo video) {
    downloads++;
    update();
  }
}
