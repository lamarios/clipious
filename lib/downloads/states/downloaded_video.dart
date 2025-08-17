import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/downloads/models/downloaded_video.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/player/states/player.dart';
import 'package:logging/logging.dart';

import 'download_manager.dart';

part 'downloaded_video.freezed.dart';

Logger log = Logger('DownloadedVideoController');

class DownloadedVideoCubit extends Cubit<DownloadedVideoState> {
  final DownloadManagerCubit downloadManager;
  final PlayerCubit player;

  DownloadedVideoCubit(this.downloadManager, super.initialState, this.player) {
    onReady();
  }

  void onReady() async {
    await setThumbnail();

    var state = this.state.copyWith();
    downloadManager.addListener(state.video?.videoId, setProgress);
    emit(state);
  }

  @override
  close() async {
    downloadManager.removeListener(state.video?.videoId, setProgress);
    super.close();
  }

  Future<void> setThumbnail() async {
    if (state.video != null || state.thumbnailPath == null) {
      String path = await state.video!.thumbnailPath;
      var file = File(path);
      var fileExists = await file.exists();
      log.fine('file $path exist: $fileExists');
      if (fileExists) {
        emit(state.copyWith(thumbnailPath: path));
      }
    }
  }

  void refreshVideo() async {
    emit(state.copyWith(
        video: db.getDownloadByVideoId(state.video?.videoId ?? '')!));

    setThumbnail();
  }

  void setProgress(double progress) async {
    if (progress == 0) {
      await setThumbnail();
    }
    if (progress == 1) {
      await setComplete();
    }
    emit(state.copyWith(progress: progress));
  }

  void playVideo() async {
    refreshVideo();
    if (state.video != null && state.video!.downloadComplete) {
      player.playOfflineVideos([state.video!]);
    }
  }

  void retryDownload() {
    if (state.video != null && state.video!.downloadFailed) {
      downloadManager.retryDownload(state.video!);
    }
  }

  setComplete() {
    log.fine("Video ${state.video!.videoId} download complete");
    var downloadById = db.getDownloadByVideoId(state.video!.videoId);
    emit(state.copyWith(progress: 1, video: downloadById));
  }
}

@freezed
sealed class DownloadedVideoState with _$DownloadedVideoState {
  const factory DownloadedVideoState(
      {DownloadedVideo? video,
      String? thumbnailPath,
      @Default(0) double progress}) = _DownloadedVideoState;

  static DownloadedVideoState init(String videoId) {
    DownloadedVideo? video;
    var downloadById = db.getDownloadByVideoId(videoId);
    if (downloadById != null) {
      video = downloadById;
    }

    return DownloadedVideoState(video: video);
  }
}
