import 'dart:io';

import 'package:get/get.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

class OfflineVideoThumbnailController extends GetxController {
  String? path;
  int tries = 0;
  final DownloadedVideo video;

  OfflineVideoThumbnailController(this.video);

  @override
  void onReady() async {
    getThumb();
  }

  getThumb() async {
    if (tries < 20) {
      tries++;
      var expectedPath = await video.thumbnailPath;
      var exists = await File(expectedPath).exists();
      if (exists) {
        path = expectedPath;
        update();
      } else {
        Future.delayed(const Duration(seconds: 1), getThumb);
      }
    }
  }
}
