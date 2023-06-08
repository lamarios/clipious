import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

class MiniPlayerAwareController extends GetxController {
  Logger log = Logger('MiniPlayerAwareController');
  static MiniPlayerAwareController? to() => safeGet();
  bool applyPadding = false;

  setPadding(bool apply) {
    log.fine('setting mini player padding $applyPadding');
    applyPadding = apply;
    update();
  }
}
