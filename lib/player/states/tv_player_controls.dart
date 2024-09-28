import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/player/states/player.dart';
import 'package:logging/logging.dart';

import '../../utils.dart';
import '../../videos/models/video_in_list.dart';
import '../models/media_event.dart';

part 'tv_player_controls.freezed.dart';

const Duration controlFadeOut = Duration(seconds: 4);
const Duration throttleDuration = Duration(milliseconds: 250);

final log = Logger('TvPlayerController');

class TvPlayerControlsCubit extends Cubit<TvPlayerControlsState> {
  final PlayerCubit player;

  TvPlayerControlsCubit(super.initialState, this.player);

  fastForward() {
    player.fastForward();
  }

  fastRewind() {
    player.rewind();
  }

  displaySettings() {
    emit(state.copyWith(showSettings: true, displayControls: false));
  }

  showUi() {
    emit(state.copyWith(controlsOpacity: 1));
    hideControls();
  }

  KeyEventResult handleRemoteEvents(FocusNode node, KeyEvent event) {
    bool timeLineControl =
        !state.showQueue && !state.showSettings && !state.displayControls;
    log.fine(
        'Key: ${event.logicalKey}, Timeline control: $timeLineControl, showQueue: ${state.showQueue}, showSettings: ${state.showSettings}, showControls: ${state.displayControls}');
    showUi();

    // looks like back is activate on pressdown and not press up
    if (event is KeyUpEvent &&
        !timeLineControl &&
        event.logicalKey == LogicalKeyboardKey.goBack) {
      emit(state.copyWith(
          showQueue: false,
          showSettings: false,
          displayControls: state.showQueue || state.showSettings));
      return KeyEventResult.handled;
    } else if (event is KeyUpEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.mediaPlay:
          player.play();
          break;
        case LogicalKeyboardKey.mediaPause:
          player.pause();
          break;
        case LogicalKeyboardKey.mediaPlayPause:
          player.togglePlaying();
          break;

        case LogicalKeyboardKey.mediaFastForward:
        case LogicalKeyboardKey.mediaStepForward:
        case LogicalKeyboardKey.mediaSkipForward:
          fastForward();
          break;
        case LogicalKeyboardKey.mediaRewind:
        case LogicalKeyboardKey.mediaStepBackward:
        case LogicalKeyboardKey.mediaSkipBackward:
          fastRewind();
          break;
        case LogicalKeyboardKey.mediaTrackNext:
          player.playNext();
          break;
        case LogicalKeyboardKey.mediaTrackPrevious:
          player.playPrevious();
          break;
      }

      if (timeLineControl) {
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          fastForward();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          fastRewind();
        } else if (isOk(event.logicalKey)) {
          emit(state.copyWith(displayControls: true));
        }
      } else {}
    }
    if (event is KeyRepeatEvent) {
      if (timeLineControl) {
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          EasyThrottle.throttle(
              'hold-seek-forward', throttleDuration, fastForward);
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          EasyThrottle.throttle(
              'hold-seek-backward', throttleDuration, fastRewind);
        }
      }
    }
    return KeyEventResult.ignored;
  }

  hideSettings() {
    emit(state.copyWith(
        controlsOpacity: 0,
        showSettings: false,
        showQueue: false,
        displayControls: false));
  }

  hideControls() {
    EasyDebounce.debounce('tv-controls', controlFadeOut, () {
      if (!isClosed) {
        emit(state.copyWith(
            controlsOpacity: 0,
            showSettings: false,
            showQueue: false,
            displayControls: false));
      }
    });
  }

  displayQueue() {
    emit(state.copyWith(showQueue: true, displayControls: false));
  }

  Future<void> playFromQueue(VideoInList video) async {
    emit(state.copyWith(showQueue: false, loading: true));
    player.switchToVideo(video);
    emit(state.copyWith(loading: false));
  }

  onStreamEvent(MediaEvent event) {
    log.fine('Event: ${event.state}, ${event.type}');
    switch (event.state) {
      case MediaState.buffering:
        // showControls();
        break;
      case MediaState.loading:
      case MediaState.ready:
        showUi();
        break;
      default:
        break;
    }
  }
}

@freezed
class TvPlayerControlsState with _$TvPlayerControlsState {
  const factory TvPlayerControlsState({
    @Default(0) double controlsOpacity,
    @Default(false) bool showSettings,
    @Default(false) bool showQueue,
    @Default(false) bool loading,
    @Default(false) bool displayControls,
  }) = _TvPlayerControlsState;

  bool get isShowUi => controlsOpacity == 1;

  const TvPlayerControlsState._();
}
