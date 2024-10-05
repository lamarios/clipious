import 'package:bloc/bloc.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/downloads/models/downloaded_video.dart';

import '../../globals.dart';

part 'video_in_list.freezed.dart';

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
      emit(state.copyWith(progress: progress));
    }
  }

  void showVideoDetails() {
    if (state.video != null) {
      var video = state.video?.copyWith(filtered: false);
      emit(state.copyWith(video: video));
    }
  }
}

@freezed
class VideoInListState with _$VideoInListState {
  @Assert('video == null || offlineVideo == null',
      'cannot provide both video and offline video')
  const factory VideoInListState(
      {@Default(0) double progress,
      Video? video,
      DownloadedVideo? offlineVideo}) = _VideoInListState;
}
