import 'dart:io';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:get/get.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

class CompactVideoController extends GetxController {
  final DownloadedVideo? offlineVideo;
  String? offlineVideoThumbnailPath;

  CompactVideoController({this.offlineVideo});

  @override
  void onReady() {
    super.onReady();
    getThumbnail();
  }

  getThumbnail() async {
    if (offlineVideo != null) {
      try {
        var path = await offlineVideo?.thumbnailPath;
        var file = File(path ?? 'abc');
        var exists = await file.exists();
        var hasSize = await file.length() > 0;
        if (exists && hasSize) {
          offlineVideoThumbnailPath = path;
          update();
        } else {
          EasyDebounce.debounce('${offlineVideo?.videoId}-compact-view-thumbnail', const Duration(seconds: 1), getThumbnail);
        }
      } catch (e) {
        EasyDebounce.debounce('${offlineVideo?.videoId}-compact-view-thumbnail', const Duration(seconds: 1), getThumbnail);
      }
    }
  }
}
