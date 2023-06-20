import 'package:get/get.dart';
import 'package:invidious/globals.dart';

import '../models/db/videoFilter.dart';

class VideoFilterController extends GetxController {
  List<VideoFilter> filters = db.getAllFilters();

  @override
  void onInit() {
    super.onInit();
    filters.sort((a, b) {
      if (a.channelId == null && b.channelId != null) {
        return -1;
      } else if (b.channelId == null && a.channelId != null) {
        return 1;
      } else if (a.channelId == null && b.channelId == null) {
        return 0;
      } else {
        return a.channelId?.compareTo(b.channelId ?? '') ?? 0;
      }
    });
  }
}
