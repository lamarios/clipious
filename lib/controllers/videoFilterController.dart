import 'package:get/get.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../models/db/videoFilter.dart';
import 'VideoFilterChannelController.dart';

class VideoFilterController extends GetxController {
  final Logger log = Logger('VideoFilterController');
  static VideoFilterController? to() => safeGet();
  late List<VideoFilter> filters = [];
  bool hideFilteredVideos = db.getSettings(HIDE_FILTERED_VIDEOS)?.value == 'true';

  @override
  onReady() {
    refreshFilters();
  }

  refreshFilters() {
    filters = db.getAllFilters();
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
    log.fine('found ${filters.length} filters');
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  int sortChannels(String a, String b) {
    if (a == allChannels && b != allChannels) {
      return -1;
    } else if (b == allChannels && a != allChannels) {
      return 1;
    } else if (a == allChannels && b == allChannels) {
      return 0;
    } else {
      return a.compareTo(b ?? '') ?? 0;
    }
  }

  void hideOnFilteredChanged(bool value) {
    hideFilteredVideos = value;
    db.saveSetting(SettingsValue(HIDE_FILTERED_VIDEOS, value.toString()));
    update();
  }
}
