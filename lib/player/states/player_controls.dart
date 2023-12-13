import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/player/models/mediaEvent.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../../main.dart';
import 'player.dart';

part 'player_controls.freezed.dart';

final log = Logger('PlayerControlControllers');

class PlayerControlsCubit extends Cubit<PlayerControlsState> {
  final PlayerCubit player;

  PlayerControlsCubit(super.initialState, this.player) {
    onReady();
  }

  void onReady() {
    log.fine("Controls ready!");

    emit(state.copyWith(
        duration: player.duration,
        muted: player.state.muted,
        fullScreenState: player.state.fullScreenState));
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
        // showControls();
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
          emit(state.copyWith(
              position: event.value, buffering: false, errored: false));
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
      case MediaEventType.sponsorSkipped:
        emit(state.copyWith(showSponsorBlocked: true));
        EasyDebounce.debounce('player-control-sponsor-blocked',
            (animationDuration * 2) + Duration(seconds: 1), () {
          emit(state.copyWith(showSponsorBlocked: false));
        });
      default:
        break;
    }
  }

  void setErrored() {
    emit(state.copyWith(errored: true));
  }

  @override
  emit(PlayerControlsState state) {
    super.emit(state);
  }

  void hideControls() {
    // we don't want the controls to disappear if we're dragging the position slider
    if (!state.draggingPositionSlider && !isClosed) {
      emit(state.copyWith(displayControls: false));
      log.info("Hiding controls ${state.displayControls}");
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
    if (isTv || !player.state.isMini && !state.justDoubleTappedSkip) {
      emit(state.copyWith(displayControls: true));
    }
    hideControlsDebounce();
  }

  void onScrubbed(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    player.seek(seekTo);
    emit(state.copyWith(position: seekTo, draggingPositionSlider: false));
    hideControlsDebounce();
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
    emit(state.copyWith(buffer: buffer));
  }

  void doubleTapFastForward() {
    player.fastForward();
    emit(state.copyWith(
        doubleTapFastForwardedOpacity: 1, justDoubleTappedSkip: true));
    EasyDebounce.debounce('fast-forward', const Duration(milliseconds: 250),
        () {
      emit(state.copyWith(doubleTapFastForwardedOpacity: 0));
    });
    // we prevent controls showing to avoid issues where if hte user taps 3 times it will show the controls right after
    EasyDebounce.debounce('preventControlsShowing', Duration(seconds: 1), () {
      emit(state.copyWith(justDoubleTappedSkip: false));
    });
  }

  void doubleTapRewind() {
    player.rewind();
    emit(state.copyWith(
        doubleTapRewindedOpacity: 1, justDoubleTappedSkip: true));
    EasyDebounce.debounce('fast-rewind', const Duration(milliseconds: 250), () {
      emit(state.copyWith(doubleTapRewindedOpacity: 0));
    });
    EasyDebounce.debounce('preventControlsShowing', const Duration(seconds: 1),
        () {
      // we prevent controls showing to avoid issues where if hte user taps 3 times it will show the controls right after
      emit(state.copyWith(justDoubleTappedSkip: false));
    });
  }
}

@freezed
class PlayerControlsState with _$PlayerControlsState {
  const factory PlayerControlsState({
    @Default(false) bool errored,
    @Default(Duration.zero) Duration position,
    @Default(Duration(seconds: 1)) Duration duration,
    @Default(Duration.zero) Duration buffer,
    @Default(FullScreenState.notFullScreen) FullScreenState fullScreenState,
    @Default(false) bool displayControls,
    @Default(false) bool muted,
    @Default(false) bool buffering,
    @Default(false) bool draggingPositionSlider,
    @Default(0) double doubleTapFastForwardedOpacity,
    @Default(0) double doubleTapRewindedOpacity,
    @Default(false) bool justDoubleTappedSkip,
    @Default(false) bool showSponsorBlocked,
  }) = _PlayercontrolsState;
}
