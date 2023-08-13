import 'package:easy_debounce/easy_debounce.dart';
import 'package:get/get.dart';
import 'package:invidious/models/mediaEvent.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../main.dart';
import 'interfaces/playerController.dart';
import 'miniPayerController.dart';

class PlayerControlController extends GetxController {
  static PlayerControlController? to() => safeGet();
  MediaEvent event = MediaEvent(state: MediaState.idle);
  Duration audioPosition = Duration.zero;
  var log = Logger('PlayerControlControllers');

  PlayerController? get pc => MiniPlayerController.to()?.playerController;
  bool displayControls = true;

  @override
  void onReady() {
    log.fine("Controls ready!");
    MiniPlayerController.to()?.eventStream.stream.listen(onStreamEvent);
    showControls();
    super.onReady();
  }

  onStreamEvent(MediaEvent event) {
    log.fine('Event: ${event.state}, ${event.type}');
    switch (event.state) {
      case MediaState.buffering:
        // showControls();
        break;
      case MediaState.loading:
      case MediaState.ready:
        showControls();
        break;
      case MediaState.miniDisplayChanged:
        displayControls = false;
        break;
      default:
        break;
    }

    switch (event.type) {
      case MediaEventType.progress:
        audioPosition = pc?.position() ?? Duration.zero;
        break;
      case MediaEventType.seek:
        showControls();
        break;
      default:
        break;
    }
    this.event = event;
    // print('UPDATE ${displayControls} ${event.state}');
    if (displayControls || event.state == MediaState.miniDisplayChanged) {
      update();
    }
  }

  void showControls() {
    if (isTv || !(MiniPlayerController.to()?.isMini ?? true)) {
      displayControls = true;
      update();

      EasyDebounce.debounce(
        'player-controls-hide',
        const Duration(seconds: 3),
        () {
          displayControls = false;
          update();
        },
      );
    }
  }

  void onScrubbed(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    pc?.seek(seekTo);
    audioPosition = seekTo;
    update();
  }

  void onScrubDrag(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    audioPosition = seekTo;
    update();
  }

  void setPlaybackSpeed(double d) {
    MiniPlayerController.to()?.playerController?.setSpeed(d);
  }
}
