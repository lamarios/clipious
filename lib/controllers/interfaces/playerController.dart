import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

import '../../models/video.dart';

abstract class PlayerController extends GetxController {
  Video? video;
  DownloadedVideo? offlineVideo;
  bool? playNow;
  bool? disableControls;

  PlayerController({this.video, this.offlineVideo, this.playNow, this.disableControls});

  void disposeControllers();

  void saveProgress(int timeInSeconds);

  void switchVideo(Video video, {Duration? startAt});

  void togglePlaying();

  void toggleControls(bool visible);

  void playVideo(bool offline);

  void setSponsorBlock();

  void switchToOfflineVideo(DownloadedVideo v);

  bool isPlaying();

  void play();

  void pause();

  void seek(Duration position);

  Duration position();

  Duration? bufferedPosition();

  double? speed();

  void onVideoFinished() {
    MiniPlayerController.to()?.playNext();
  }
}
