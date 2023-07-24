import 'dart:io';

import 'package:animate_to/animate_to.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/formatStream.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../models/video.dart';
import 'miniPayerController.dart';

class DownloadProgress {
  double progress;
  CancelToken cancelToken;

  DownloadProgress(this.progress, this.cancelToken);
}

class DownloadController extends GetxController {
  final Logger log = Logger('DownloadController');

  static DownloadController? to() => safeGet(tag: 'dl');
  final animateToController = AnimateToController();
  List<DownloadedVideo> videos = db.getAllDownloads();

  List<Function(String videoId, double progress)> progressListeners = [];

  List<Function(String videoId)> completionListeners = [];

  final Map<String, DownloadProgress> downloadProgresses = {};

  bool get canPlayAll => videos.where((element) => element.downloadComplete).isNotEmpty;

  double get totalProgress {
    if (downloadProgresses.isEmpty) {
      return 0;
    }
    var total = (downloadProgresses.values.map((e) => e.progress).reduce((value, element) => value + element) / downloadProgresses.length);
    // log.fine('total progress: $total');
    return total;
  }

  @override
  onClose() {
    animateToController.dispose();
    super.onClose();
  }

  void playAll() {
    videos = db.getAllDownloads();
    update();
    MiniPlayerController.to()?.playOfflineVideos(videos.where((element) => element.downloadComplete).toList());
  }

  addProgressListener(Function(String videoId, double progress) func) {
    progressListeners.add(func);
  }

  removeProgressListener(Function(String videoId, double progress) func) {
    progressListeners.remove(func);
  }

  addCompletionListener(Function(String videoId) func) {
    completionListeners.add(func);
  }

  removeCompletionListener(Function(String videoId) func) {
    completionListeners.remove(func);
  }

  onProgress(int count, int total, DownloadedVideo video) {
    // log.fine('Download of video $videoId}, $count / $total =  ${count / total}');
    if (count == total) {
      downloadProgresses.remove(video.videoId);
      video.downloadComplete = true;
      db.upsertDownload(video);
      videos = db.getAllDownloads();
      for (var f in completionListeners) {
        f(video.videoId);
      }
    } else {
      var progress = count / total;
      downloadProgresses[video.videoId]?.progress = progress;
      for (var f in progressListeners) {
        f(video.videoId, progress);
      }
    }
    update();
  }

  Future<bool> addDownload(BaseVideo video) async {
    if (videos.any((element) => element.videoId == video.videoId)) {
      return false;
    } else {
      Video vid = await service.getVideo(video.videoId);
      var downloadedVideo = DownloadedVideo(videoId: video.videoId, title: video.title, author: video.author, authorUrl: video.authorUrl);
      db.upsertDownload(downloadedVideo);
      videos = db.getAllDownloads();
      update();

      FormatStream stream = vid.formatStreams.firstWhere((element) => element.resolution == '720p');

      Dio dio = Dio();
      CancelToken cancelToken = CancelToken();

      // download thumbnail
      String? thumbUrl = ImageObject.getBestThumbnail(vid.videoThumbnails)?.url;
      log.fine(thumbUrl);
      if (thumbUrl != null) {
        //download thumbnail
        var thumbnailPath = await downloadedVideo.thumbnailPath;
        log.fine("Downloading thumbnail to: $thumbnailPath");
        await dio.download(thumbUrl, thumbnailPath, cancelToken: cancelToken);
      }

      downloadProgresses[downloadedVideo.videoId] = DownloadProgress(0, cancelToken);

      for (var f in progressListeners) {
        f(downloadedVideo.videoId, 0);
      }

      // download video
      var videoPath = await downloadedVideo.videoPath;
      await dio.download(stream.url, videoPath, onReceiveProgress: (count, total) => onProgress(count, total, downloadedVideo), cancelToken: cancelToken);

      return true;
    }
  }

  void deleteVideo(CompletionHandler handler, DownloadedVideo vid) async {
    await handler(true);

    var downloadProgress = downloadProgresses[vid.videoId];
    log.fine('cancelling download for video ${vid.videoId}, present ? : ${downloadProgress != null}');
    downloadProgress?.cancelToken.cancel();

    downloadProgresses.remove(vid.videoId);

    try {
      String path = await vid.videoPath;
      await File(path).delete();
    } catch (e) {
      log.fine('File might not be available, that\'s ok');
    }

    try {
      String path = await vid.thumbnailPath;
      await File(path).delete();
    } catch (e) {
      log.fine('File might not be available, that\'s ok');
    }

    db.deleteDownload(vid);
    videos = db.getAllDownloads();
    update();
  }
}
