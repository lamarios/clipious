import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:get/get.dart';
import 'package:invidious/models/mediaEvent.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../main.dart';
import 'interfaces/playerController.dart';
import 'miniPayerController.dart';

part 'playerControlController.g.dart';

final log = Logger('PlayerControlControllers');

class PlayerControlCubit extends Cubit<PlayerControlController> {
  final MiniPlayerCubit player;

  PlayerControlCubit(super.initialState, this.player) {
    onReady();
  }

  void onReady() {
    log.fine("Controls ready!");
    // MiniPlayerController.to()?.eventStream.stream.listen(onStreamEvent);
    showControls();
  }

  onStreamEvent(MediaEvent event) {
    log.fine('Event: ${event.state}, ${event.type}');
    var state = this.state.copyWith();
    switch (event.state) {
      case MediaState.buffering:
        // showControls();
        break;
      case MediaState.loading:
      case MediaState.ready:
        showControls();
        state = this.state.copyWith();
        break;
      case MediaState.miniDisplayChanged:
        hideControls();
        state = this.state.copyWith();
        break;
      default:
        break;
    }

    switch (event.type) {
      case MediaEventType.progress:
        state.audioPosition = event.value;
        break;
      case MediaEventType.seek:
        showControls();
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
    state.displayControls = false;
    emit(state);
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
    state.audioPosition = seekTo;
    emit(state);
  }

  void onScrubDrag(double value) {
    var state = this.state.copyWith();
    Duration seekTo = Duration(milliseconds: value.toInt());
    state.audioPosition = seekTo;
    emit(state);
  }

  void setPlaybackSpeed(double d) {
    player.setSpeed(d);
  }
}

@CopyWith(constructor: "_")
class PlayerControlController {
  PlayerControlController();

  MediaEvent event = MediaEvent(state: MediaState.idle);
  Duration audioPosition = Duration.zero;

  bool displayControls = false;

  PlayerControlController._(this.event, this.audioPosition, this.displayControls);
}
