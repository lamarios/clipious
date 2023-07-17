import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';

import '../models/baseVideo.dart';

class AddToQueueButtonController extends GetxController {
  List<BaseVideo> videos;

  AddToQueueButtonController({required this.videos});

  bool canAddToQueue() =>
      (MiniPlayerController.to()?.videos.isNotEmpty ?? false) &&
      (videos.length > 1 || (videos.length == 1 && (MiniPlayerController.to()?.videos.indexWhere((element) => element.videoId == videos[0].videoId) ?? -1) < 0));

  addToQueue() {
    MiniPlayerController.to()?.queueVideos(videos);
    update();
  }
}
