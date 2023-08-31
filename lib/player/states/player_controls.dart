import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
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

    emit(state.copyWith(duration:  player.duration, muted: player.state.muted, fullScreenState: player.state.fullScreenState, supportsPip: player.state.supportsPip));
    // MiniPlayerController.to()?.eventStream.stream.listen(onStreamEvent);
    showControls();
  }

  onStreamEvent(MediaEvent event) {
    log.fine('Event: ${event.state}, ${event.type}');
    var state = this.state.copyWith();
    switch (event.state) {
      case MediaState.buffering:
        setBuffer(event.value ?? Duration.zero);
        state = this.state.copyWith();
        break;
      case MediaState.loading:
      case MediaState.ready:
        showControls();
        state = this.state.copyWith();
        break;
      case MediaState.error:
        hideControls();
        state = this.state.copyWith();
        state.errored = true;
        break;
      default:
        break;
    }

    switch (event.type) {
      case MediaEventType.miniDisplayChanged:
        hideControls();
        state = this.state.copyWith();
        break;
      case MediaEventType.progress:
        if (!state.draggingPositionSlider) {
          state.position = event.value;
        }
        state.errored = false;
        break;
      case MediaEventType.seek:
        showControls();
        state = this.state.copyWith();
        break;
      case MediaEventType.fullScreenChanged:
        setFullScreenState(event.value);
        state = this.state.copyWith();
        break;
      case MediaEventType.volumeChanged:
        setMuted(!event.value);
        state = this.state.copyWith();
        break;
      case MediaEventType.durationChanged:
        setDuration(event.value);
        state = this.state.copyWith();
        break;
      case MediaEventType.pipSupportChanged:
        setSupportsPip(event.value);
        state = this.state.copyWith();
        break;
      case MediaEventType.bufferChanged:
        setBuffer(event.value);
        state = this.state.copyWith();
        break;
      default:
        break;
    }
    state.event = event;
    // print('UPDATE ${displayControls} ${event.state}');
    emit(state);
  }

  void hideControls() {
    var state = this.state.copyWith();

    // we don't want the controls to disappear if we're dragging the position slider
    if(!state.draggingPositionSlider) {
      state.displayControls = false;
      if (!isClosed) {
        emit(state);
      }
    }else{
      EasyDebounce.debounce(
        'player-controls-hide',
        const Duration(seconds: 3),
        hideControls,
      );
    }
  }

  void showControls() {
    if (isTv || !player.state.isMini) {
      var state = this.state.copyWith();
      state.displayControls = true;
      emit(state);

      EasyDebounce.debounce(
        'player-controls-hide',
        const Duration(seconds: 3),
        hideControls,
      );
    }
  }

  void onScrubbed(double value) {
    var state = this.state.copyWith();
    Duration seekTo = Duration(milliseconds: value.toInt());
    player.seek(seekTo);
    state.position = seekTo;
    state.draggingPositionSlider = false;
    emit(state);
  }

  void onScrubDrag(double value) {
    var state = this.state.copyWith();
    Duration seekTo = Duration(milliseconds: value.toInt());
    state.position = seekTo;
    state.draggingPositionSlider = true;
    emit(state);
  }

  void setPlaybackSpeed(double d) {
    player.setSpeed(d);
  }

  void removeError() {
    emit(state.copyWith(errored: false));
  }

  setSupportsPip(bool hasSupport) {
    emit(state.copyWith(supportsPip: hasSupport));
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
    emit(state.copyWith(buffer: buffer));
  }
}

@CopyWith(constructor: "_")
class PlayerControlsState {
  PlayerControlsState();

  bool errored = false;

  MediaEvent event = MediaEvent(state: MediaState.idle);
  Duration position = Duration.zero;
  Duration duration = const Duration(seconds: 1);
  Duration buffer = Duration.zero;
  FullScreenState fullScreenState = FullScreenState.notFullScreen;
  bool supportsPip = false;
  bool displayControls = false;
  bool muted = false;
  bool draggingPositionSlider = false;

  PlayerControlsState._(this.event, this.position, this.displayControls, this.errored, this.supportsPip, this.duration, this.fullScreenState, this.muted, this.buffer, this.draggingPositionSlider);
}
