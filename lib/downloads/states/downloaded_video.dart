import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/globals.dart';
import 'package:logging/logging.dart';

import 'download_manager.dart';

part 'downloaded_video.g.dart';

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
    var state = this.state.copyWith();
    if (state.video != null || state.thumbnailPath == null) {
      String path = await state.video!.thumbnailPath;
      var file = File(path);
      var fileExists = await file.exists();
      log.fine('file $path exist: $fileExists');
      if (fileExists) {
        state.thumbnailPath = path;
      }
    }
    emit(state);
  }

  void refreshVideo() async {
    state.video = db.getDownloadById(state.video?.id ?? -1)!;
    emit(state);

    setThumbnail();
  }

  void setProgress(double progress) async {
    if (progress == 0) {
      await setThumbnail();
    }
    if (progress == 1) {
      await setComplete();
    }
    var state = this.state.copyWith();
    state.progress = progress;
    emit(state);
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
    var state = this.state.copyWith();
    log.fine("Video ${state.video!.videoId} download complete");
    state.progress = 1;
    var downloadById = db.getDownloadById(state.video!.id);
    if (downloadById != null) {
      state.video = downloadById;
    }
    emit(state);
  }
}

@CopyWith(constructor: "_")
class DownloadedVideoState {
  DownloadedVideo? video;
  String? thumbnailPath;
  double progress = 0;

  DownloadedVideoState(int videoId) {
    var downloadById = db.getDownloadById(videoId);
    if (downloadById != null) {
      video = downloadById;
    }
  }

  DownloadedVideoState._(this.video, this.thumbnailPath, this.progress);
}
