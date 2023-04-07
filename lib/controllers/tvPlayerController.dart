import 'package:better_player/better_player.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:logging/logging.dart';

import '../utils.dart';

const Duration controlFadeOut = Duration(seconds: 4);

class TvPlayerController extends GetxController {
  Logger logger = Logger('TvPlayerController');

  static TvPlayerController? to() => safeGet();
  double progress = 0;
  double controlsOpacity = 0;
  Duration currentPosition = Duration.zero;
  bool buffering = true;
  bool showSettings = false;

  Duration get videoLength => Duration(seconds: PlayerController.to()?.video.lengthSeconds ?? 0);

  togglePlayPause() {
    showControls();
    if (isPlaying) {
      logger.info('Pausing video');
      PlayerController.to()?.videoController?.pause();
    } else {
      logger.info('Playing video');
      PlayerController.to()?.videoController?.play();
    }
    update();
  }

  @override
  void onReady() {}

  bool get isPlaying => PlayerController.to()?.videoController?.isPlaying() ?? false;

  handleVideoEvent(BetterPlayerEvent event) {
    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.progress:
        Duration currentPosition = (event.parameters?['progress'] as Duration);
        setProgress(currentPosition);
        break;
      case BetterPlayerEventType.seekTo:
        Duration currentPosition = (event.parameters?['duration'] as Duration);
        setProgress(currentPosition);
        break;
      case BetterPlayerEventType.bufferingStart:
        buffering = true;
        break;
      case BetterPlayerEventType.bufferingEnd:
        buffering = false;
        break;
      default:
        break;
    }
    update();
  }

  setProgress(Duration currentPosition) {
    this.currentPosition = currentPosition;
    progress = currentPosition.inSeconds / videoLength.inSeconds;
    update();
  }

  showControls() {
    controlsOpacity = 1;
    update();
    hideControls();
  }

  hideControls() {
    EasyDebounce.debounce('tv-controls', controlFadeOut, () {
      controlsOpacity = 0;
      showSettings = false;
      update();
    });
  }

  KeyEventResult handleRemoteEvents(FocusNode node, KeyEvent event) {
    log.info('Other key event: ${event.logicalKey}');
    showControls();
    if (event is KeyUpEvent) {
      if (!showSettings) {
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          PlayerController.to()?.videoController?.seekTo(currentPosition + const Duration(seconds: 10));
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          PlayerController.to()?.videoController?.seekTo(currentPosition - const Duration(seconds: 10));
        } else if (event.logicalKey == LogicalKeyboardKey.select) {
          togglePlayPause();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          log.info('showing video settings');
          showSettings = true;
          update();
        }
      }
    }
    return KeyEventResult.ignored;
  }
}
