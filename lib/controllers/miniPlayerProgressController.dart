import 'package:get/get.dart';
import 'package:invidious/utils.dart';

class MiniPlayerProgressController extends GetxController {
  static MiniPlayerProgressController? to() => safeGet();

  double progress = 0;

  setProgress(double progress) {
    this.progress = progress;
    update();
  }
}
