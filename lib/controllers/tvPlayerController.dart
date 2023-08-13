import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/tvPlayerControlsController.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:logging/logging.dart';

import '../utils.dart';

class TvPlayerController extends MiniPlayerController {
  Logger log = Logger('TvPlayerController');

  TvPlayerController(List<BaseVideo> videos):super.withVideos(videos);


  static TvPlayerController? to() => safeGet();

  @override
  void onReady() {
    super.onReady();
    switchToVideo(videos[0]);
  }

}
