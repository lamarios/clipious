import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:invidious/videos/models/base_video.dart';

import '../../globals.dart';

part 'video_in_list.g.dart';

class VideoInListCubit extends Cubit<VideoInListState> {
  VideoInListCubit(super.initialState) {
    onReady();
  }

  double setProgress() {
    return db.getVideoProgress(state.video.videoId);
  }

  onReady() {
    updateProgress();
  }

  updateProgress() {
    var state = this.state.copyWith();
    state.progress = db.getVideoProgress(state.video.videoId);
    emit(state);
  }

  void showVideoDetails() {
    var state = this.state.copyWith();
    state.video.filtered = false;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class VideoInListState {
  double progress = 0;
  BaseVideo video;

  VideoInListState(this.video);

  VideoInListState._(this.progress, this.video);
}
