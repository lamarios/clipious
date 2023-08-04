import 'dart:async';
import 'dart:io';

import 'package:animate_to/animate_to.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/formatStream.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../models/adaptiveFormat.dart';
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
  List<DownloadedVideo> videos = [];

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

  @override
  onReady() {
    super.onReady();
    setVideos();
    update();
  }

  setVideos() {
    var vids = db.getAllDownloads();
    // checking if we have any video that are not fail, not completed and not currently downloading
    for (var v in vids) {
      if (!v.downloadComplete && !v.downloadFailed && !downloadProgresses.containsKey(v.videoId)) {
        // this download was interrupted by app restart or crash or something else, we set it as errored
        v.downloadFailed = true;
        db.upsertDownload(v);
      }
    }

    videos = vids;
  }

  void playAll() {
    setVideos();
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
      setVideos();
    }

    for (var f in downloadProgress?.listeners ?? []) {
      f(count / total);
    }
    update();
  }

  Future<bool> addDownload(String videoId, {String quality = '720p', bool audioOnly = false}) async {
    if (videos.any((element) => element.videoId == videoId)) {
      return false;
    } else {
      Video vid = await service.getVideo(videoId);
      var downloadedVideo =
          DownloadedVideo(videoId: vid.videoId, title: vid.title, author: vid.author, authorUrl: vid.authorUrl, audioOnly: audioOnly, lengthSeconds: vid.lengthSeconds, quality: quality);
      db.upsertDownload(downloadedVideo);

      String contentUrl;

      if (!audioOnly) {
        FormatStream stream = vid.formatStreams.firstWhere((element) => element.resolution == quality);
        contentUrl = stream.url;
      } else {
        AdaptiveFormat audio = vid.adaptiveFormats.sortByReversed((e) => int.parse(e.bitrate ?? "0")).firstWhere((element) => element.type.contains("audio"));
        contentUrl = audio.url;
      }

      Dio dio = Dio();
      CancelToken cancelToken = CancelToken();

      downloadProgresses[downloadedVideo.videoId] = DownloadProgress(cancelToken);

      setVideos();
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

      log.info("Downloading video ${vid.title}, audioOnly ? $audioOnly, quality: $quality (if not only audio) to path: $videoPath");
      dio
          .download(contentUrl, videoPath, onReceiveProgress: (count, total) => onProgress(count, total, downloadedVideo), cancelToken: cancelToken)
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
    setVideos();
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
    setVideos();
    update();
    return;
  }

  Future<void> retryDownload(DownloadedVideo vid) async {
    await deleteVideo(vid);
    await addDownload(vid.videoId, quality: vid.quality, audioOnly: vid.audioOnly);
  }
}
