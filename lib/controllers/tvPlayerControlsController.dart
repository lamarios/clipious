import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/playerControlController.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../videos/models/video_in_list.dart';
import 'interfaces/playerController.dart';

part 'tvPlayerControlsController.g.dart';

const Duration controlFadeOut = Duration(seconds: 4);
const Duration throttleDuration = Duration(milliseconds: 250);

const defaultStep = 10;
const stepMultiplier = 0.2;

final log = Logger('TvPlayerController');

class TvPlayerControlsCubit extends Cubit<TvPlayerControlsController> {
  final MiniPlayerCubit player;
  TvPlayerControlsCubit(super.initialState, this.player);

  fastForward() {
    player.seek(player.state.position + Duration(seconds: state.forwardStep));
    state.forwardStep += (state.forwardStep * stepMultiplier).floor();
    EasyDebounce.debounce('fast-forward-step', const Duration(seconds: 1), () {
      state.forwardStep = defaultStep;
    });
  }

  fastRewind() {
    player.seek(player.state.position - Duration(seconds: state.forwardStep));
    state.rewindStep += (state.rewindStep * stepMultiplier).floor();
    EasyDebounce.debounce('fast-rewind-step', const Duration(seconds: 1), () {
      state.rewindStep = defaultStep;
    });
  }

  displaySettings() {
    var state = this.state.copyWith();
    state.showSettings = true;
    state.displayControls = false;
    emit(state);
  }

  showUi() {
    var state = this.state.copyWith();
    state.controlsOpacity = 1;
    emit(state);
    hideControls();
  }

  KeyEventResult handleRemoteEvents(FocusNode node, KeyEvent event) {
    bool timeLineControl = !state.showQueue && !state.showSettings && !state.displayControls;
    log.fine('Key: ${event.logicalKey}, Timeline control: $timeLineControl, showQueue: ${state.showQueue}, showSettings: ${state.showSettings}, showControls: ${state.displayControls}');
    showUi();

    // looks like back is activate on pressdown and not press up
    if (event is KeyUpEvent && !timeLineControl && event.logicalKey == LogicalKeyboardKey.goBack) {
      var state = this.state.copyWith();
      if (state.showQueue || state.showSettings) {
        state.showQueue = false;
        state.showSettings = false;
        state.displayControls = true;
      } else {
        state.showQueue = false;
        state.showSettings = false;
        state.displayControls = false;
      }
      emit(state);
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
        } else if (event.logicalKey == LogicalKeyboardKey.select) {
          var state = this.state.copyWith();
          state.displayControls = true;
          emit(state);
        }
      } else {}
    }
    if (event is KeyRepeatEvent) {
      if (timeLineControl) {
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          EasyThrottle.throttle('hold-seek-forward', throttleDuration, fastForward);
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          EasyThrottle.throttle('hold-seek-backward', throttleDuration, fastRewind);
        }
      }
    }
    return KeyEventResult.ignored;
  }

  hideControls() {
    EasyDebounce.debounce('tv-controls', controlFadeOut, () {
      var state = this.state.copyWith();
      state.controlsOpacity = 0;
      state.showSettings = false;
      state.showQueue = false;
      state.displayControls = false;
      emit(state);
    });
  }

  displayQueue() {
    var state = this.state.copyWith();
    state.showQueue = true;
    state.displayControls = false;
    emit(state);
  }

  Future<void> playFromQueue(VideoInList video) async {
    var state = this.state.copyWith();
    state.showQueue = false;
    state.loading = true;
    emit(state);
    state = this.state.copyWith();
    player.switchToVideo(video);
    state.loading = false;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class TvPlayerControlsController {
  TvPlayerControlsController();

  double controlsOpacity = 0;
  bool showSettings = false;
  bool showQueue = false;
  bool loading = false;
  bool displayControls = false;

  int forwardStep = defaultStep, rewindStep = defaultStep;

  bool get isShowUi => controlsOpacity == 1;

  TvPlayerControlsController._(this.controlsOpacity, this.showSettings, this.showQueue, this.loading, this.displayControls, this.forwardStep, this.rewindStep);
}
