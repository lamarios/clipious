import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/playerControlController.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/controllers/videoPlayerController.dart';
import 'package:invidious/utils.dart';

import '../models/videoInList.dart';
import 'interfaces/playerController.dart';

const Duration controlFadeOut = Duration(seconds: 4);
const Duration throttleDuration = Duration(milliseconds: 250);

const defaultStep = 10;
const stepMultiplier = 0.2;

class TvPlayerControlsController extends PlayerControlController {
  static TvPlayerControlsController? to() => safeGet();
  double controlsOpacity = 0;
  bool buffering = false;
  bool showSettings = false;
  bool showQueue = false;
  bool loading = false;

  int forwardStep = defaultStep, rewindStep = defaultStep;

  bool get isShowUi => controlsOpacity == 1;

  TvPlayerController? get mpc => TvPlayerController.to();

  PlayerController? get pc => mpc?.playerController;

  double get progress {
    var progress = (pc?.position() ?? Duration.zero).inSeconds;
    var length = (pc?.duration() ?? const Duration(seconds: 1)).inSeconds;
    return progress / length;
  }

  @override
  void onReady() {
    log.fine("Controls ready!");
    if(mpc == null){
      Future.delayed(const Duration(seconds:1), onReady);
      return;
    }else {
      mpc!.eventStream.stream.listen(onStreamEvent);
    }
  }

  fastForward() {
    if (pc != null) {
      pc!.seek(pc!.position() + Duration(seconds: forwardStep));
      forwardStep += (forwardStep * stepMultiplier).floor();
      EasyDebounce.debounce('fast-forward-step', const Duration(seconds: 1), () {
        forwardStep = defaultStep;
      });
    }
  }

  fastRewind() {
    if (pc != null) {
      pc!.seek(pc!.position() - Duration(seconds: forwardStep));
      rewindStep += (rewindStep * stepMultiplier).floor();
      EasyDebounce.debounce('fast-rewind-step', const Duration(seconds: 1), () {
        rewindStep = defaultStep;
      });
    }
  }

  displaySettings() {
    showSettings = true;
    displayControls = false;
    update();
  }

  showUi() {
    controlsOpacity = 1;
    update();
    hideControls();
  }

  KeyEventResult handleRemoteEvents(FocusNode node, KeyEvent event) {
    bool timeLineControl = !showQueue && !showSettings && !displayControls;
    log.fine('Key: ${event.logicalKey}, Timeline control: $timeLineControl, showQueue: $showQueue, showSettings: $showSettings, showControls: $displayControls}');
    showUi();

    // looks like back is activate on pressdown and not press up
    if (event is KeyUpEvent && !timeLineControl && event.logicalKey == LogicalKeyboardKey.goBack) {
      if (showQueue || showSettings) {
        showQueue = false;
        showSettings = false;
        displayControls = true;
      } else {
        showQueue = false;
        showSettings = false;
        displayControls = false;
      }
      update();
      return KeyEventResult.handled;
    } else if (event is KeyUpEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.mediaPlay:
          mpc?.play();
          break;
        case LogicalKeyboardKey.mediaPause:
          mpc?.pause();
          break;
        case LogicalKeyboardKey.mediaPlayPause:
          mpc?.togglePlaying();
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
          mpc?.playNext();
          break;
        case LogicalKeyboardKey.mediaTrackPrevious:
          mpc?.playPrevious();
          break;
      }

      if (timeLineControl) {
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          fastForward();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          fastRewind();
        } else if (event.logicalKey == LogicalKeyboardKey.select) {
          displayControls = true;
          update();
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
      controlsOpacity = 0;
      showSettings = false;
      showQueue = false;
      displayControls = false;
      update();
    });
  }

  displayQueue() {
    showQueue = true;
    displayControls = false;
    update();
  }

  Future<void> playFromQueue(VideoInList video) async {
    print('hello');
    showQueue = false;
    loading = true;
    update();
    mpc?.switchToVideo(video);
    loading = false;
    update();
  }

}
