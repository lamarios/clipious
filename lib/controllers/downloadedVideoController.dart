import 'dart:io';

import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:logging/logging.dart';

import 'downloadController.dart';

class DownloadedVideoController extends GetxController {
  Logger log = Logger('DownloadedVideoController');

  DownloadedVideo? video;
  String? thumbnailPath;
  double progress = 0;

  DownloadedVideoController(int videoId) {
    var downloadById = db.getDownloadById(videoId);
    if (downloadById != null) {
      video = downloadById;
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await setThumbnail();
    DownloadController.to()?.addProgressListener(setProgress);
    DownloadController.to()?.addCompletionListener(setComplete);
    update();
  }

  @override
  onClose() {
    DownloadController.to()?.removeProgressListener(setProgress);
    DownloadController.to()?.removeCompletionListener(setComplete);
  }

  Future<void> setThumbnail() async {
    if (video != null) {
      String path = await video!.thumbnailPath;
      var file = File(path);
      var fileExists = await file.exists();
      log.fine('file $path exist: $fileExists');
      if (fileExists) {
        thumbnailPath = path;
      }
    }
  }

  void refreshVideo() async {
    video = db.getDownloadById(video?.id ?? -1)!;
    setThumbnail();
    update();
  }

  void setProgress(String videoId, double progress) {
    if (videoId == video?.videoId) {
      if (progress == 0) {
        setThumbnail();
      }
      this.progress = progress;
      update();
    }
  }

  void playVideo() async {
    if (video != null) {
      MiniPlayerController.to()?.playOfflineVideos([video!]);
    }
  }

  setComplete(String videoId) {
    if (videoId == video?.videoId) {
      progress = 1;
      var downloadById = db.getDownloadById(video!.id);
      if (downloadById != null) {
        video = downloadById;
      }
      update();
    }
  }
}
