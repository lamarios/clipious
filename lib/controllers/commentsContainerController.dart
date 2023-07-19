import 'package:get/get.dart';

class CommentsContainerController extends GetxController {
  String source = 'youtube';
  String sortBy = 'top';

  changeSorting(String? value) {
    if (value != sortBy) {
      sortBy = value ?? 'top';
      update();
    }
  }
}
