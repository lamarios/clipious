import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/videos/models/base_video.dart';

import '../../globals.dart';

part 'video_in_list.g.dart';

class VideoInListCubit extends Cubit<VideoInListState> {
  VideoInListCubit(super.initialState) {
    onReady();
  }

  onReady() {
    updateProgress();
  }

  updateProgress() {
    if (state.video != null) {
      setProgress(db.getVideoProgress(state.video!.videoId));
    }
  }

  setProgress(double progress) {
    if (state.video != null) {
      var state = this.state.copyWith();
      state.progress = progress;
      emit(state);
    }
  }

  void showVideoDetails() {
    if (state.video != null) {
      var state = this.state.copyWith();
      state.video!.filtered = false;
      emit(state);
    }
  }
}

@CopyWith(constructor: "_")
class VideoInListState {
  double progress = 0;
  BaseVideo? video;
  DownloadedVideo? offlineVideo;

  VideoInListState({this.video, this.offlineVideo}) : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  VideoInListState._(this.progress, this.video, this.offlineVideo);
}
