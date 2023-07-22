import 'dart:io';

import 'package:animate_to/animate_to.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/formatStream.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../models/video.dart';
import 'downloadedVideoController.dart';

class DownloadController extends GetxController {
  final Logger log = Logger('DownloadController');

  static DownloadController? to() => safeGet(tag: 'dl');
  final animateToController = AnimateToController();
  List<DownloadedVideo> videos = db.getAllDownloads();

  final Map<String, double> downloadProgresses = {};

  double get totalProgress {
    if (downloadProgresses.isEmpty) {
      return 0;
    }
    var total = (downloadProgresses.values.reduce((value, element) => value + element) / downloadProgresses.length);
    // log.fine('total progress: $total');
    return total;
  }

  @override
  onClose() {
    animateToController.dispose();
    super.onClose();
  }

  onProgress(int count, int total, DownloadedVideo video) {
    // log.fine('Download of video $videoId}, $count / $total =  ${count / total}');
    if (count == total) {
      downloadProgresses.remove(video.videoId);
      video.downloadComplete = true;
      db.upsertDownload(video);
      DownloadedVideoController.to(tag: video.id.toString())?.refreshVideo();
    } else {
      downloadProgresses[video.videoId] = count / total;
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
      // download thumbnail
      String? thumbUrl = ImageObject.getBestThumbnail(vid.videoThumbnails)?.url;
      log.fine(thumbUrl);
      if (thumbUrl != null) {
        //download thumbnail
        var thumbnailPath = await downloadedVideo.thumbnailPath;
        log.fine("Downloading thumbnail to: $thumbnailPath");
        await dio.download(
          thumbUrl,
          thumbnailPath,
        );
      }

      DownloadedVideoController.to(tag: downloadedVideo.id.toString())?.refreshVideo();

      // download video
      var videoPath = await downloadedVideo.videoPath;
      await dio.download(
        stream.url,
        videoPath,
        onReceiveProgress: (count, total) => onProgress(count, total, downloadedVideo),
      );

      return true;
    }
  }

  void deleteVideo(CompletionHandler handler, DownloadedVideo vid) async {
    await handler(true);

    String path = await vid.videoPath;
    await File(path).delete();
    path = await vid.thumbnailPath;
    await File(path).delete();
    db.deleteDownload(vid);
    videos = db.getAllDownloads();
    update();
  }
}
