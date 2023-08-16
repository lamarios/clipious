import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:logging/logging.dart';

import 'download_manager.dart';

part 'downloaded_video.g.dart';

Logger log = Logger('DownloadedVideoController');

class DownloadedVideoCubit extends Cubit<DownloadedVideoState> {
  final DownloadManagerCubit downloadManager;

  DownloadedVideoCubit(this.downloadManager, super.initialState) {
    onReady();
  }

  @override
  emit(DownloadedVideoState state) {
    super.emit(state.copyWith());
  }

  void onReady() async {
    await setThumbnail();
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
        state.thumbnailPath = path;
      }
    }
  }

  void refreshVideo() async {
    state.video = db.getDownloadById(state.video?.id ?? -1)!;
    setThumbnail();
    emit(state);
  }

  void setProgress(double progress) {
    if (progress == 0) {
      setThumbnail();
    }
    if (progress == 1) {
      setComplete();
    }
    state.progress = progress;
    emit(state);
  }

  void playVideo() async {
    refreshVideo();
    if (state.video != null && state.video!.downloadComplete) {
      MiniPlayerController.to()?.playOfflineVideos([state.video!]);
    }
  }

  void retryDownload() {
    if (state.video != null && state.video!.downloadFailed) {
      downloadManager.retryDownload(state.video!);
    }
  }

  setComplete() {
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
class DownloadedVideoState extends GetxController {
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
