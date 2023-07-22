import 'dart:io';

import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/utils.dart';

class DownloadedVideoController extends GetxController {
  static DownloadedVideoController? to({required String tag}) => safeGet(tag: tag);

  DownloadedVideo video;
  String? thumbnailPath;

  DownloadedVideoController(this.video);

  @override
  void onReady() async {
    super.onReady();
    await setThumbnail();
    update();
  }

  Future<void> setThumbnail() async {
    String path = await video.thumbnailPath;
    var file = File(path);
    var fileExists = await file.exists();
    log.fine('file $path exist: $fileExists');
    if (fileExists) {
      thumbnailPath = path;
    }
  }

  void refreshVideo() async {
    video = db.getDownloadById(video.id)!;
    setThumbnail();
    update();
  }
}
