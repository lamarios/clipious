import 'package:get/get.dart';
import 'package:invidious/utils.dart';

import 'miniPayerController.dart';

class MiniPlayerProgressController extends GetxController {
  @override
  void onReady() {
    MiniPlayerController.to()?.eventStream.stream.listen((event) {
      setProgress();
    });
  }

  double progress = 0;

  setProgress() {
    var controller = MiniPlayerController.to();
    if (controller != null) {
      var length = controller.currentlyPlaying?.lengthSeconds ?? controller.offlineCurrentlyPlaying?.lengthSeconds ?? 1;
      var position = controller.playerController?.position() ?? Duration.zero;

      progress = position.inSeconds / length;

      update();
    }
  }
}
