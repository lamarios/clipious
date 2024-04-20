import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/models/image_object.dart';
import 'package:invidious/videos/models/format_stream.dart';
import 'package:logging/logging.dart';
import 'package:shared_storage/shared_storage.dart';
import 'package:shared_storage/shared_storage.dart' as saf;

import '../../player/states/player.dart';
import '../../settings/states/settings.dart';
import '../../videos/models/adaptive_format.dart';
import '../../videos/models/video.dart';

part 'download_manager.freezed.dart';

final Logger _log = Logger('DownloadState');

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
  final PlayerCubit player;
  final SettingsCubit settings;

  DownloadManagerCubit(super.initialState, this.player, this.settings) {
    onReady();
  }

  onReady() {
    setVideos();
  }

  setVideos() async {
    var vids = db.getAllDownloads();

    List<DownloadedVideo> available = [];

    // checking if we have any video that are not fail, not completed and not currently downloading
    for (var v in vids) {
      // if we're downloading the video we consider available
      if (!v.downloadComplete) {
        available.add(v);
      } else {
        // if it should be finished we check its state
        if (!v.downloadComplete &&
            !v.downloadFailed &&
            !state.downloadProgresses.containsKey(v.videoId)) {
          // this download was interrupted by app restart or crash or something else, we set it as errored
          v.downloadFailed = true;
          await db.upsertDownload(v);
          available.add(v);
        } else if (await v.filesExists) {
          available.add(v);
        }
      }
    }

    emit(state.copyWith(videos: available));
  }

  void playAll() {
    setVideos();
    player.playOfflineVideos(state.videos
        .where((element) => element.downloadComplete && !element.downloadFailed)
        .toList());
  }

  Future<void> _moveFilesToSharedStorage(DownloadedVideo video) async {
    _log.fine(
        'Moving ${await video.tempThumbnailPath} to ${await video.thumbnailPath}');

    File tempThumbnail = File(await video.tempThumbnailPath);
    File tempMedia = File(await video.tempMediaPath);
    try {
      final downloadPath = settings.state.videoDownloadLocation;
      if (downloadPath != null) {
        final DocumentFile? downloadFolder =
            await Uri.parse(downloadPath).toDocumentFile();

        if (await downloadFolder?.child(video.thumbnailFileName) == null &&
            await downloadFolder?.child(video.mediaFileName) == null) {
          await downloadFolder?.createFileAsBytes(
              mimeType: 'image/jpeg',
              displayName: video.thumbnailFileName,
              bytes: await tempThumbnail.readAsBytes());
          await downloadFolder?.createFileAsBytes(
              mimeType: video.mediaMimeType,
              displayName: video.mediaFileName,
              bytes: await tempMedia.readAsBytes());
        }
      }
    } finally {
      await tempMedia.delete();
      await tempThumbnail.delete();
    }
  }

  onProgress(int count, int total, DownloadedVideo video) async {
    if (count == total) {
      var progresses =
          Map<String, DownloadProgress>.from(state.downloadProgresses);
      var downloadProgress = progresses[video.videoId];
      progresses.remove(video.videoId);
      video.downloadComplete = true;
      await db.upsertDownload(video);
      emit(state.copyWith(downloadProgresses: progresses));
      setVideos();
      for (var f in downloadProgress?.listeners ?? []) {
        f(count / total);
      }
    } else {
      EasyThrottle.throttle(
          'download-${video.videoId}', const Duration(milliseconds: 500), () {
        _log.fine(
            'Download of video ${video.videoId}, $count / $total =  ${count / total}, Total: ${state.totalProgress}');
        var progresses =
            Map<String, DownloadProgress>.from(state.downloadProgresses);
        var downloadProgress = progresses[video.videoId];
        downloadProgress?.count = count;
        downloadProgress?.total = total;
        emit(state.copyWith(downloadProgresses: progresses));
        setVideos();
        for (var f in downloadProgress?.listeners ?? []) {
          f(count / total);
        }
      });
    }
  }

  Future<bool> addDownload(String videoId,
      {String quality = '720p', bool audioOnly = false}) async {
    if (state.videos.any((element) => element.videoId == videoId)) {
      return false;
    } else {
      Video vid = await service.getVideo(videoId);
      var downloadedVideo = DownloadedVideo(
          videoId: vid.videoId,
          title: vid.title,
          author: vid.author,
          authorUrl: vid.authorUrl,
          audioOnly: audioOnly,
          lengthSeconds: vid.lengthSeconds,
          folder: settings.state.customDownloadedVideoLocation
              ? settings.state.videoDownloadLocation
              : null,
          quality: quality);
      await db.upsertDownload(downloadedVideo);

      String contentUrl;

      if (!audioOnly) {
        FormatStream stream = vid.formatStreams
            .firstWhere((element) => element.resolution == quality);
        contentUrl = stream.url;
      } else {
        AdaptiveFormat audio = vid.adaptiveFormats
            .sortByReversed((e) => int.parse(e.bitrate ?? "0"))
            .firstWhere((element) => element.type.contains("audio"));
        contentUrl = audio.url;
      }

      Dio dio = Dio();
      CancelToken cancelToken = CancelToken();

      var progresses =
          Map<String, DownloadProgress>.from(state.downloadProgresses);
      progresses[downloadedVideo.videoId] = DownloadProgress(cancelToken);
      emit(state.copyWith(downloadProgresses: progresses));

      setVideos();
      // download thumbnail
      String? thumbUrl = ImageObject.getBestThumbnail(vid.videoThumbnails)?.url;
      _log.fine(thumbUrl);
      if (thumbUrl != null) {
        //download thumbnail
        var thumbnailPath = await downloadedVideo.tempThumbnailPath;
        _log.fine("Downloading thumbnail to: $thumbnailPath");
        await dio.download(thumbUrl, thumbnailPath, cancelToken: cancelToken);
      }

      // download video
      var videoPath = await downloadedVideo.tempMediaPath;
      _log.info(
          "Downloading video ${vid.title}, audioOnly ? $audioOnly, quality: $quality (if not only audio) to path: $videoPath");
      dio
          .download(contentUrl, videoPath,
              onReceiveProgress: (count, total) =>
                  onProgress(count, total, downloadedVideo),
              cancelToken: cancelToken,
              deleteOnError: true)
          .catchError((err) {
        onDownloadError(err, downloadedVideo);
        return Response<void>(requestOptions: RequestOptions());
      }).then((value) async {
        if (settings.state.customDownloadedVideoLocation &&
            settings.state.videoDownloadLocation != null) {
          await _moveFilesToSharedStorage(downloadedVideo);
        }
      });

      return true;
    }
  }

  Future<void> deleteVideo(DownloadedVideo vid) async {
    var progresses =
        Map<String, DownloadProgress>.from(state.downloadProgresses);
    var downloadProgress = progresses[vid.videoId];
    _log.fine(
        'cancelling download for video ${vid.videoId}, present ? : ${downloadProgress != null}');
    downloadProgress?.cancelToken.cancel();

    progresses.remove(vid.videoId);

    try {
      String path = await vid.mediaPath;
      await File(path).delete();
    } catch (e) {
      _log.fine('File might not be available, that\'s ok');
    }

    try {
      String path = await vid.thumbnailPath;
      await File(path).delete();
    } catch (e) {
      _log.fine('File might not be available, that\'s ok');
    }

    await db.deleteDownload(vid);
    emit(state.copyWith(downloadProgresses: progresses));

    setVideos();
  }

  FutureOr<void> onDownloadError(DioException err, DownloadedVideo vid) async {
    if (err.type == DioExceptionType.cancel) {
      _log.fine("video cancelled, nothing to do");
      return;
    }
    _log.severe(
        "Failed to download video ${vid.title}, removing it", err.stackTrace);
    vid.downloadFailed = true;
    vid.downloadComplete = false;
    onProgress(1, 1, vid);
    var progresses =
        Map<String, DownloadProgress>.from(state.downloadProgresses);
    progresses.remove(vid.videoId);
    await db.upsertDownload(vid);
    setVideos();
    emit(state.copyWith(downloadProgresses: progresses));
    return;
  }

  Future<void> retryDownload(DownloadedVideo vid) async {
    await deleteVideo(vid);
    await addDownload(vid.videoId,
        quality: vid.quality, audioOnly: vid.audioOnly);
  }

  void addListener(
      String? videoId, void Function(double progress) setProgress) {
    var progresses =
        Map<String, DownloadProgress>.from(state.downloadProgresses);
    progresses[videoId]?.addListener(setProgress);
    emit(state.copyWith(downloadProgresses: progresses));
  }

  void removeListener(
      String? videoId, void Function(double progress) setProgress) {
    var progresses =
        Map<String, DownloadProgress>.from(state.downloadProgresses);

    progresses[videoId]?.removeListener(setProgress);
    emit(state.copyWith(downloadProgresses: progresses));
  }

  bool canPlayAll() =>
      state.videos.where((element) => element.downloadComplete).isNotEmpty;
}

@freezed
class DownloadManagerState with _$DownloadManagerState {
  const factory DownloadManagerState(
          {@Default([]) List<DownloadedVideo> videos,
          @Default({}) Map<String, DownloadProgress> downloadProgresses}) =
      _DownloadManagerState;

  const DownloadManagerState._();

  double get totalProgress {
    int downloaded = 0;
    int total = 0;

    for (var element in downloadProgresses.values) {
      downloaded += element.count;
      total += element.total;
    }

    return downloaded / total;
  }
}
