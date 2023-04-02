import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/utils.dart';

class MiniPlayerAwareController extends GetxController {
  static MiniPlayerAwareController? to() => safeGet();
  bool applyPadding = false;

  setPadding(bool apply) {
    applyPadding = apply;
    update();
  }
}
