import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:invidious/player/models/mediaEvent.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:logging/logging.dart';

import '../../main.dart';
import 'player.dart';

part 'player_controls.g.dart';

final log = Logger('PlayerControlControllers');

class PlayerControlsCubit extends Cubit<PlayerControlsState> {
  final PlayerCubit player;

  PlayerControlsCubit(super.initialState, this.player) {
    onReady();
  }

  void onReady() {
    log.fine("Controls ready!");

    emit(state.copyWith(duration: player.duration, muted: player.state.muted, fullScreenState: player.state.fullScreenState));
    showControls();
  }

  onStreamEvent(MediaEvent event) {
    log.fine('Event: ${event.state}, ${event.type}');
    switch (event.state) {
      case MediaState.buffering:
        setBuffer(event.value ?? Duration.zero);
        break;
      case MediaState.loading:
        emit(state.copyWith(buffering: true));
        break;
      case MediaState.ready:
        showControls();
        break;
      case MediaState.error:
        hideControls();
        setErrored();
        break;
      default:
        break;
    }

    switch (event.type) {
      case MediaEventType.miniDisplayChanged:
        hideControls();
        break;
      case MediaEventType.progress:
        if (!state.draggingPositionSlider) {
          // EasyThrottle.throttle('controls-progress-throttle', const Duration(seconds: 1), () {
            emit(state.copyWith(position: event.value, buffering: false, errored: false));
          // });
        }
        break;
      case MediaEventType.seek:
        hideControlsDebounce();
        break;
      case MediaEventType.fullScreenChanged:
        setFullScreenState(event.value);
        break;
      case MediaEventType.volumeChanged:
        setMuted(!event.value);
        break;
      case MediaEventType.durationChanged:
        setDuration(event.value);
        break;
      case MediaEventType.bufferChanged:
        setBuffer(event.value);
        break;
      case MediaEventType.pause:
      case MediaEventType.play:
        emit(state.copyWith());
        break;
      default:
        break;
    }
  }

  void setErrored() {
    emit(state.copyWith(errored: true));
  }

  @override
  emit(PlayerControlsState state) {
    print('Emiting');
    super.emit(state);
  }

  void hideControls() {
    // we don't want the controls to disappear if we're dragging the position slider
    if (!state.draggingPositionSlider && !isClosed) {
      emit(state.copyWith(displayControls: false));
    } else {
      hideControlsDebounce();
    }
  }

  void hideControlsDebounce() {
    EasyDebounce.debounce(
      'player-controls-hide',
      const Duration(seconds: 3),
      hideControls,
    );
  }

  void showControls() {
    if (isTv || !player.state.isMini) {
      emit(state.copyWith(displayControls: true));
    }
    hideControlsDebounce();
  }

  void onScrubbed(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    player.seek(seekTo);
    emit(state.copyWith(position: seekTo, draggingPositionSlider: false));
  }

  void onScrubDrag(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    emit(state.copyWith(position: seekTo, draggingPositionSlider: true));
  }

  void setPlaybackSpeed(double d) {
    player.setSpeed(d);
  }

  void removeError() {
    emit(state.copyWith(errored: false));
  }

  setDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  setFullScreenState(FullScreenState fsState) {
    emit(state.copyWith(fullScreenState: fsState));
  }

  setMuted(bool muted) {
    emit(state.copyWith(muted: muted));
  }

  setBuffer(Duration buffer) {
    EasyThrottle.throttle('video-buffer-update', const Duration(seconds: 1), () {
      emit(state.copyWith(buffer: buffer));
    });
  }

  void doubleTapFastForward() {
    player.fastForward();
    emit(state.copyWith(doubleTapFastForwardedOpacity: 1));
    EasyDebounce.debounce('fast-forward', const Duration(milliseconds: 250), () {
      emit(state.copyWith(doubleTapFastForwardedOpacity: 0));
    });
  }

  void doubleTapRewind() {
    player.rewind();
    emit(state.copyWith(doubleTapRewindedOpacity: 1));
    EasyDebounce.debounce('fast-rewind', const Duration(milliseconds: 250), () {
      emit(state.copyWith(doubleTapRewindedOpacity: 0));
    });
  }
}

@CopyWith(constructor: "_")
class PlayerControlsState {
  PlayerControlsState();

  bool errored = false;

  Duration position = Duration.zero;
  Duration duration = const Duration(seconds: 1);
  Duration buffer = Duration.zero;
  FullScreenState fullScreenState = FullScreenState.notFullScreen;
  bool displayControls = false;
  bool muted = false;
  bool buffering = false;
  bool draggingPositionSlider = false;
  double doubleTapFastForwardedOpacity = 0;
  double doubleTapRewindedOpacity = 0;

  PlayerControlsState._(this.buffering, this.position, this.displayControls, this.errored, this.duration, this.fullScreenState, this.muted, this.buffer, this.draggingPositionSlider,
      this.doubleTapFastForwardedOpacity, this.doubleTapRewindedOpacity);
}
