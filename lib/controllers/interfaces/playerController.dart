import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

import '../../models/video.dart';

enum FullScreenState {
  fullScreen,
  notFullScreen,
  unsupported;
}

abstract class PlayerController extends GetxController {
  Video? video;
  DownloadedVideo? offlineVideo;
  bool? playNow;
  bool? disableControls;

  PlayerController({this.video, this.offlineVideo, this.playNow, this.disableControls});

  void disposeControllers();

  void switchVideo(Video video, {Duration? startAt});

  void togglePlaying();

  void toggleControls(bool visible);

  void playVideo(bool offline);

  void switchToOfflineVideo(DownloadedVideo v);

  bool isPlaying();

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
