import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:ffmpeg_kit_flutter_full/ffmpeg_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/downloads/models/downloaded_video.dart';
import 'package:clipious/extensions.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/utils/models/image_object.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../player/states/player.dart';
import '../../videos/models/adaptive_format.dart';
import '../../videos/models/video.dart';

part 'download_manager.freezed.dart';

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
  final PlayerCubit player;

  DownloadManagerCubit(super.initialState, this.player) {
    onReady();
  }

  onReady() {
    setVideos();
  }

  setVideos() async {
    var vids = db.getAllDownloads();
    // checking if we have any video that are not fail, not completed and not currently downloading
    for (var v in vids) {
      if (!v.downloadComplete &&
          !v.downloadFailed &&
          !state.downloadProgresses.containsKey(v.videoId)) {
        // this download was interrupted by app restart or crash or something else, we set it as errored
        v.downloadFailed = true;
        await db.upsertDownload(v);
      }
    }

    emit(state.copyWith(videos: vids));
  }

  void playAll() {
    setVideos();
    player.playOfflineVideos(state.videos
        .where((element) => element.downloadComplete && !element.downloadFailed)
        .toList());
  }

  onProgress(int count, int total, DownloadedVideo video,
      {required int step, required int totalSteps}) async {
    if (count == total && step == totalSteps) {
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
        log.fine(
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

      final server = await db.getCurrentlySelectedServer();

      var downloadedVideo = DownloadedVideo(
          videoId: vid.videoId,
          title: vid.title,
          author: vid.author,
          authorUrl: vid.authorUrl,
          audioOnly: audioOnly,
          lengthSeconds: vid.lengthSeconds,
          quality: quality);
      await db.upsertDownload(downloadedVideo);

      String? videoUrl;

      if (!audioOnly) {
        // FormatStream stream = vid.formatStreams
        //     .firstWhere((element) => element.resolution == quality);

        final stream = vid.adaptiveFormats.firstWhere((element) =>
            element.encoding == 'vp9' &&
            element.qualityLabel == quality &&
            element.type.contains('video/webm'));

        videoUrl = stream.url;
      }
      AdaptiveFormat audio = vid.adaptiveFormats
          .sortByReversed((e) => int.parse(e.bitrate ?? "0"))
          .firstWhere((element) => element.type.contains("audio/webm"));
      String audioUrl = audio.url;

      Dio dio = Dio();
      CancelToken cancelToken = CancelToken();

      var progresses =
          Map<String, DownloadProgress>.from(state.downloadProgresses);
      progresses[downloadedVideo.videoId] = DownloadProgress(cancelToken);
      emit(state.copyWith(downloadProgresses: progresses));

      setVideos();
      // download thumbnail
      String? thumbUrl = ImageObject.getBestThumbnail(vid.videoThumbnails)?.url;
      log.fine(thumbUrl);
      if (thumbUrl != null) {
        //download thumbnail
        var thumbnailPath = await downloadedVideo.thumbnailPath;
        log.fine("Downloading thumbnail to: $thumbnailPath");
        await dio.download(thumbUrl, thumbnailPath,
            cancelToken: cancelToken,
            options: Options(headers: server.headersForUrl(thumbUrl)));
      }

      // download video
      var mediaPath = await downloadedVideo.downloadPath;

      final tempDir = await getTemporaryDirectory();
      final audioPath = '${tempDir.path}/${videoId}_audio.webm';
      final videoPath = '${tempDir.path}/${videoId}_video.webm';

      log.info(
          "Downloading video ${vid.title}, audioOnly ? $audioOnly, quality: $quality  to path: $tempDir");
      try {
        await dio
            .download(audioUrl, audioPath,
                onReceiveProgress: (count, total) => onProgress(
                    count, total, downloadedVideo,
                    step: 1, totalSteps: audioOnly ? 2 : 3),
                cancelToken: cancelToken,
                deleteOnError: true,
                options: Options(headers: server.headersForUrl(audioUrl)))
            .catchError((err) {
          onDownloadError(err, downloadedVideo);
          return Response<void>(requestOptions: RequestOptions());
        });

        if (videoUrl != null) {
          await dio
              .download(videoUrl, videoPath,
                  onReceiveProgress: (count, total) => onProgress(
                        count,
                        total,
                        downloadedVideo,
                        step: 2,
                        totalSteps: 3,
                      ),
                  cancelToken: cancelToken,
                  options: Options(headers: server.headersForUrl(videoUrl)),
                  deleteOnError: true)
              .catchError((err) {
            onDownloadError(err, downloadedVideo);
            return Response<void>(requestOptions: RequestOptions());
          });
        }

        if (audioOnly) {
          final audio = File(audioPath);
          await audio.copy(mediaPath);
          onProgress(1, 1, downloadedVideo, step: 2, totalSteps: 2);
          return true;
        } else {
          onProgress(0, 1, downloadedVideo, step: 3, totalSteps: 3);
          final session = await FFmpegKit.execute(
              '-y -i $videoPath -i $audioPath -c:v copy -c:a copy $mediaPath');

          final returnCode = await session.getReturnCode();

          var success = returnCode?.isValueSuccess() ?? false;
          if (success) {
            onProgress(1, 1, downloadedVideo, step: 3, totalSteps: 3);
          } else {
            final logs = await session.getLogs();

            onDownloadError("Couldn't merge audio and video ${logs.join("\n")}",
                downloadedVideo);
          }
          return success;
        }
      } catch (e) {
        rethrow;
      } finally {
        final audio = File(audioPath);
        final video = File(videoPath);

        if (await audio.exists()) {
          await audio.delete();
        }

        if (await video.exists()) {
          await video.delete();
        }
      }
    }
  }

  Future<void> deleteVideo(DownloadedVideo vid) async {
    var progresses =
        Map<String, DownloadProgress>.from(state.downloadProgresses);
    var downloadProgress = progresses[vid.videoId];
    log.fine(
        'cancelling download for video ${vid.videoId}, present ? : ${downloadProgress != null}');
    downloadProgress?.cancelToken.cancel();

    progresses.remove(vid.videoId);

    try {
      String path = await vid.effectivePath;
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

    await db.deleteDownload(vid);
    emit(state.copyWith(downloadProgresses: progresses));

    setVideos();
  }

  FutureOr<void> onDownloadError(dynamic err, DownloadedVideo vid) async {
    if (err is DioException) {
      if (err.type == DioExceptionType.cancel) {
        log.fine("video cancelled, nothing to do");
        return;
      }
    }
    if (err is Error) {
      log.severe(
          "Failed to download video ${vid.title}, removing it", err.stackTrace);
    } else {
      log.severe("Failed to download video ${vid.title}, removing it", err);
    }
    vid.downloadFailed = true;
    vid.downloadComplete = false;
    onProgress(1, 1, vid, step: 1, totalSteps: 1);
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

  Future<void> copyToDownloadFolder(DownloadedVideo v) async {
    final downloads = await getDownloadsDirectory();
    if (downloads != null) {
      if (!await downloads.exists()) {
        downloads.create(recursive: true);
      }
      final file = File(await v.effectivePath);
      if (await file.exists()) {
        final fileName =
            '${v.title.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').replaceAll(RegExp(r'_{2,}'), '')}_${v.videoId}${p.extension(file.path)}';

        bool? success = await copyFileIntoDownloadFolder(file.path, fileName);
        log.info(
            "file ${file.path} copied to download folder as $fileName (success ?$success)");
      }
    }
  }
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
