import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/playerController.dart';

class MiniPlayerControlsController extends GetxController {
  togglePlay() {
    PlayerController.to()?.togglePlaying();
    update();
  }

  bool isPlaying() {
    return (PlayerController.to()?.videoController?.isPlaying() ?? false);
  }

  playNext() {
    MiniPlayerController.to()?.playNext();
  }

  playPrevious() {
    MiniPlayerController.to()?.playPrevious();
  }
}
