import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:invidious/controllers/videoLikeController.dart';

import '../utils.dart';

class MiniPlayerControlsController extends GetxController {
  MiniPlayerControlsController(this.videoId);

  static MiniPlayerControlsController? to() => safeGet();

  String videoId;

  togglePlay() {
    PlayerController.to()?.togglePlaying();
    update();
  }

  bool isPlaying() {
    return (PlayerController.to()?.videoController?.isPlaying() ?? false);
  }

  setVideo(String videoId) {
    this.videoId = videoId;
    update();
    VideoLikeButtonController.to(tag: VideoLikeButtonController.tags(videoId))
        ?.checkVideoLikeStatus();
  }

  playNext() {
    MiniPlayerController.to()?.playNext();
  }

  playPrevious() {
    MiniPlayerController.to()?.playPrevious();
  }

  toggleShuffle() {
    MiniPlayerController.to()?.toggleShuffle();
    update();
  }

  switchToNextRepeat() {
    MiniPlayerController.to()?.setNextRepeatMode();
    update();
  }
}
