import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';

import '../../models/mediaCommand.dart';
import '../../videos/models/video.dart';

enum FullScreenState {
  fullScreen,
  notFullScreen,
  unsupported;
}

abstract class PlayerCubit<T extends PlayerController> extends Cubit<T> {
  PlayerCubit(super.initialState);

  void disposeControllers();

  void switchVideo(Video video, {Duration? startAt});

  void togglePlaying();

  void toggleControls(bool visible);

  void playVideo(bool offline);

  void switchToOfflineVideo(DownloadedVideo v);

  bool isPlaying();

  void handleCommand(MediaCommand command) {
    switch (command.type) {
      case MediaCommandType.speed:
        setSpeed(command.value);
        break;
      case MediaCommandType.switchVideo:
        SwitchVideoValue val = command.value;
        switchVideo(val.video, startAt: val.startAt);
        break;
      case MediaCommandType.switchToOfflineVideo:
        switchToOfflineVideo(command.value);
        break;
      case MediaCommandType.play:
        print("PLAAAYYYY");
        play();
        break;
      case MediaCommandType.pause:
        print("PAUSEEE ${this.runtimeType.toString()}");
        pause();
        break;
      case MediaCommandType.mute:
        toggleVolume(false);
        break;
      case MediaCommandType.unmute:
        toggleVolume(true);
        break;
      case MediaCommandType.seek:
        seek(command.value);
        break;
    }
  }

  void play();

  void pause();

  void seek(Duration position);

  Duration position();

  Duration? bufferedPosition();

  double? speed();

  FullScreenState isFullScreen();

  setFullScreen(bool bool);

  List<String> getVideoTracks();

  List<String> getAudioTracks();

  List<String> getSubtitles();

  int selectedVideoTrack();

  int selectedAudioTrack();

  int selectedSubtitle();

  selectVideoTrack(int index);

  selectAudioTrack(int index);

  selectSubtitle(int index);

  bool supportsPip();

  void enterPip();

  bool isMuted();

  void toggleVolume(bool soundOn);

  void setSpeed(double d);

  double getSpeed();

  bool hasDashToggle();

  bool isUsingDash();

  void toggleDash();

  Duration duration();
}

abstract class PlayerController {
  Video? video;
  DownloadedVideo? offlineVideo;
  bool? playNow;
  bool? disableControls;

  PlayerController({this.video, this.offlineVideo, this.playNow, this.disableControls});
}
