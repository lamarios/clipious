import 'dart:async';
import 'dart:io';

import 'package:animate_to/animate_to.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/formatStream.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../models/video.dart';
import 'miniPayerController.dart';

class DownloadProgress {
  CancelToken cancelToken;
  int count = 0, total = 1;

  List<Function(double progress)> listeners = [];

  DownloadProgress(this.cancelToken);

  addListener(Function(double progress) f) {
    listeners.add(f);
  }

  removeListener(Function(double progress) f) {
    listeners.remove(f);
  }
}

class DownloadController extends GetxController {
  final Logger log = Logger('DownloadController');

  static DownloadController? to() => safeGet(tag: 'dl');
  final animateToController = AnimateToController();
  List<DownloadedVideo> videos = db.getAllDownloads();

  final Map<String, DownloadProgress> downloadProgresses = {};

  bool get canPlayAll => videos.where((element) => element.downloadComplete).isNotEmpty;

  double get totalProgress {
    int downloaded = 0;
    int total = 0;

    for (var element in downloadProgresses.values) {
      downloaded += element.count;
      total += element.total;
    }

    return downloaded / total;
  }

  @override
  onClose() {
    animateToController.dispose();
    super.onClose();
  }

  void playAll() {
    videos = db.getAllDownloads();
    update();
    MiniPlayerController.to()?.playOfflineVideos(videos.where((element) => element.downloadComplete && !element.downloadFailed).toList());
  }

  onProgress(int count, int total, DownloadedVideo video) {
    // log.fine('Download of video $videoId}, $count / $total =  ${count / total}');
    var downloadProgress = downloadProgresses[video.videoId];
    downloadProgress?.count = count;
    downloadProgress?.total = total;

    if (count == total) {
      downloadProgresses.remove(video.videoId);
      video.downloadComplete = true;
      db.upsertDownload(video);
      videos = db.getAllDownloads();
    }

    for (var f in downloadProgress?.listeners ?? []) {
      f(count / total);
    }
    update();
  }

  Future<bool> addDownload(String videoId) async {
    if (videos.any((element) => element.videoId == videoId)) {
      return false;
    } else {
      Video vid = await service.getVideo(videoId);
      var downloadedVideo = DownloadedVideo(videoId: vid.videoId, title: vid.title, author: vid.author, authorUrl: vid.authorUrl);
      db.upsertDownload(downloadedVideo);
      videos = db.getAllDownloads();
      update();

      FormatStream stream = vid.formatStreams.firstWhere((element) => element.resolution == '720p');

      Dio dio = Dio();
      CancelToken cancelToken = CancelToken();

      downloadProgresses[downloadedVideo.videoId] = DownloadProgress(cancelToken);
      update();
      // download thumbnail
      String? thumbUrl = ImageObject.getBestThumbnail(vid.videoThumbnails)?.url;
      log.fine(thumbUrl);
      if (thumbUrl != null) {
        //download thumbnail
        var thumbnailPath = await downloadedVideo.thumbnailPath;
        log.fine("Downloading thumbnail to: $thumbnailPath");
        await dio.download(thumbUrl, thumbnailPath, cancelToken: cancelToken);
      }

      // download video
      var videoPath = await downloadedVideo.mediaPath;
      dio
          .download(stream.url, videoPath, onReceiveProgress: (count, total) => onProgress(count, total, downloadedVideo), cancelToken: cancelToken)
          .catchError((err) => onDownloadError(err, downloadedVideo));

      return true;
    }
  }

  Future<void> deleteVideo(DownloadedVideo vid) async {
    var downloadProgress = downloadProgresses[vid.videoId];
    log.fine('cancelling download for video ${vid.videoId}, present ? : ${downloadProgress != null}');
    downloadProgress?.cancelToken.cancel();

    downloadProgresses.remove(vid.videoId);

    try {
      String path = await vid.mediaPath;
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

  Future<void> onDownloadError(DioException err, DownloadedVideo vid) async {
    if (err.type == DioExceptionType.cancel) {
      log.fine("video cancelled, nothing to do");
      return;
    }
    log.severe("Failed to download video ${vid.title}, removing it", err.stackTrace);
    vid.downloadFailed = true;
    vid.downloadComplete = false;
    onProgress(1, 1, vid);
    downloadProgresses.remove(vid.videoId);
    db.upsertDownload(vid);
    videos = db.getAllDownloads();
    update();
    return;
  }

  Future<void> retryDownload(DownloadedVideo vid) async {
    await deleteVideo(vid);
    await addDownload(vid.videoId);
  }
}
