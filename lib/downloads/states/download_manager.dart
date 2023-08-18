import 'dart:async';
import 'dart:io';

import 'package:animate_to/animate_to.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/models/image_object.dart';
import 'package:invidious/videos/models/format_stream.dart';
import 'package:logging/logging.dart';

import '../../controllers/miniPayerController.dart';
import '../../videos/models/adaptive_format.dart';
import '../../videos/models/video.dart';

part 'download_manager.g.dart';

final Logger log = Logger('DownloadState');

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

class DownloadManagerCubit extends Cubit<DownloadManagerState> {
  final MiniPlayerCubit player;
  DownloadManagerCubit(super.initialState, this.player) {
    onReady();
  }

  @override
  close() async {
    var state = this.state.copyWith();
    state.animateToController.dispose();
    super.close();
  }

  onReady() {
    setVideos();
  }

  setVideos() {
    var state = this.state.copyWith();
    var vids = db.getAllDownloads();
    // checking if we have any video that are not fail, not completed and not currently downloading
    for (var v in vids) {
      if (!v.downloadComplete && !v.downloadFailed && !state.downloadProgresses.containsKey(v.videoId)) {
        // this download was interrupted by app restart or crash or something else, we set it as errored
        v.downloadFailed = true;
        db.upsertDownload(v);
      }
    }

    state.videos = vids;
    emit(state);
  }

  void playAll() {
    setVideos();
    player.playOfflineVideos(state.videos.where((element) => element.downloadComplete && !element.downloadFailed).toList());
  }

  onProgress(int count, int total, DownloadedVideo video) {
    var state = this.state.copyWith();
    // log.fine('Download of video $videoId}, $count / $total =  ${count / total}');
    var downloadProgress = state.downloadProgresses[video.videoId];
    downloadProgress?.count = count;
    downloadProgress?.total = total;

    if (count == total) {
      state.downloadProgresses.remove(video.videoId);
      video.downloadComplete = true;
      db.upsertDownload(video);
      emit(state);
      setVideos();
    }

    for (var f in downloadProgress?.listeners ?? []) {
      f(count / total);
    }
  }

  Future<bool> addDownload(String videoId, {String quality = '720p', bool audioOnly = false}) async {
    if (state.videos.any((element) => element.videoId == videoId)) {
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

      var state = this.state.copyWith();
      state.downloadProgresses[downloadedVideo.videoId] = DownloadProgress(cancelToken);
      emit(state);

      setVideos();
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
    var state = this.state.copyWith();
    var downloadProgress = state.downloadProgresses[vid.videoId];
    log.fine('cancelling download for video ${vid.videoId}, present ? : ${downloadProgress != null}');
    downloadProgress?.cancelToken.cancel();

    state.downloadProgresses.remove(vid.videoId);

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
    emit(state);

    setVideos();
  }

  Future<void> onDownloadError(DioException err, DownloadedVideo vid) async {
    var state = this.state.copyWith();
    if (err.type == DioExceptionType.cancel) {
      log.fine("video cancelled, nothing to do");
      return;
    }
    log.severe("Failed to download video ${vid.title}, removing it", err.stackTrace);
    vid.downloadFailed = true;
    vid.downloadComplete = false;
    onProgress(1, 1, vid);
    state.downloadProgresses.remove(vid.videoId);
    db.upsertDownload(vid);
    setVideos();
    emit(state);
    return;
  }

  Future<void> retryDownload(DownloadedVideo vid) async {
    await deleteVideo(vid);
    await addDownload(vid.videoId, quality: vid.quality, audioOnly: vid.audioOnly);
  }

  void addListener(String? videoId, void Function(double progress) setProgress) {
    var state = this.state.copyWith();
    state.downloadProgresses[videoId]?.addListener(setProgress);
    emit(state);
  }

  void removeListener(String? videoId, void Function(double progress) setProgress) {
    var state = this.state.copyWith();
    state.downloadProgresses[videoId]?.removeListener(setProgress);
    emit(state);
  }

  bool canPlayAll() => state.videos.where((element) => element.downloadComplete).isNotEmpty;
}

@CopyWith(constructor: "_")
class DownloadManagerState {
  DownloadManagerState();

  AnimateToController animateToController = AnimateToController();
  List<DownloadedVideo> videos = [];

  Map<String, DownloadProgress> downloadProgresses = {};

  double get totalProgress {
    int downloaded = 0;
    int total = 0;

    for (var element in downloadProgresses.values) {
      downloaded += element.count;
      total += element.total;
    }

    return downloaded / total;
  }

  DownloadManagerState._(this.animateToController, this.videos, this.downloadProgresses);
}
