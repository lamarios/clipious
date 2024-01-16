import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';
import 'package:invidious/notifications/models/db/playlist_notifications.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/search/models/db/search_history_item.dart';
import 'package:invidious/settings/models/db/app_logs.dart';
import 'package:invidious/settings/models/db/server.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/utils/obox_database.dart';
import 'package:invidious/videos/models/db/dearrow_cache.dart';
import 'package:invidious/videos/models/db/history_video_cache.dart';
import 'package:logging/logging.dart';

import '../settings/models/db/video_filter.dart';
import '../videos/models/db/progress.dart';

final _logs = Logger('Migration utils');

Future<bool> needsMigration() async {
  DbClient db = await DbClient.create();

  try {
    //check if we have any data
    final store = db.store;

    int items = 0;
    items += store.box<Server>().count();
    items += store.box<DownloadedVideo>().count();
    items += store.box<HomeLayout>().count();
    items += store.box<ChannelNotification>().count();
    items += store.box<PlaylistNotification>().count();
    items += store.box<SubscriptionNotification>().count();
    items += store.box<SearchHistoryItem>().count();
    items += store.box<AppLog>().count();
    items += store.box<SettingsValue>().count();
    items += store.box<VideoFilter>().count();
    items += store.box<DeArrowCache>().count();
    items += store.box<HistoryVideoCache>().count();
    items += store.box<Progress>().count();

    _logs.fine('Needs migration ? ${items > 0}, items to migrate: $items');

    return items > 0;
  } finally {
    db.close();
  }
}

Future<void> clearIsar() async {}
