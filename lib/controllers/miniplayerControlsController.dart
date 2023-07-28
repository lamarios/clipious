import 'package:get/get.dart';
import 'package:invidious/controllers/audioPlayerController.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/videoPlayerController.dart';
import 'package:invidious/controllers/videoLikeController.dart';

import '../utils.dart';
import 'interfaces/playerController.dart';

class MiniPlayerControlsController extends GetxController {
  MiniPlayerControlsController(this.videoId);

  static MiniPlayerControlsController? to() => safeGet();

  String videoId;

  PlayerController? get player {
    if (MiniPlayerController.to()?.isAudio ?? false) {
      return AudioPlayerController.to();
    } else {
      return VideoPlayerController.to();
    }
  }

  togglePlay() {
    player?.togglePlaying();
    update();
  }

  bool isPlaying() {
    return player?.isPlaying() ?? false;
  }

  setVideo(String videoId) {
    this.videoId = videoId;
    update();
    VideoLikeButtonController.to(tag: VideoLikeButtonController.tags(videoId))?.checkVideoLikeStatus();
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
