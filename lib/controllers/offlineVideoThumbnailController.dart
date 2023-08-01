import 'dart:io';

import 'package:get/get.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:logging/logging.dart';

class OfflineVideoThumbnailController extends GetxController {
  final log = Logger('OfflineVideoThumbnailController');
  String? path;
  int tries = 0;
  final DownloadedVideo video;

  OfflineVideoThumbnailController(this.video) {
    log.fine('New thumbnail');
  }

  @override
  void onReady() async {
    log.fine('Thumbnail ready');
    await getThumb();
  }

  getThumb() async {
    if (tries < 20) {
      tries++;
      var expectedPath = await video.thumbnailPath;
      var exists = await File(expectedPath).exists();
      log.fine('Do we have a thumbnail ? $exists');
      if (exists) {
        path = expectedPath;
        update();
      } else {
        Future.delayed(const Duration(seconds: 1), getThumb);
      }
    }
  }
}
