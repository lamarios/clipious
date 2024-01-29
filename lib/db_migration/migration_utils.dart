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
    var servers = store.box<Server>().count();
    items += servers;
    _logs.fine('servers: $servers');
    var downloads = store.box<DownloadedVideo>().count();
    items += downloads;
    _logs.fine('downloads: $downloads');
    var homeLayout = store.box<HomeLayout>().count();
    items += homeLayout;
    _logs.fine('homelayout: $homeLayout');
    var channelNotifications = store.box<ChannelNotification>().count();
    items += channelNotifications;
    _logs.fine('Channel notifications: $channelNotifications}');
    var playlists = store.box<PlaylistNotification>().count();
    items += playlists;
    _logs.fine('playlists notifications: $playlists');
    var subs = store.box<SubscriptionNotification>().count();
    items += subs;
    _logs.fine('subs: $subs');
    var searchHistory = store.box<SearchHistoryItem>().count();
    items += searchHistory;
    _logs.fine('search history: $searchHistory');
    var logs = store.box<AppLog>().count();
    items += logs;
    _logs.fine('app logs: $logs');
    var settings = store.box<SettingsValue>().count();
    items += settings;
    _logs.fine('settings: $settings');
    var videoFilters = store.box<VideoFilter>().count();
    items += videoFilters;
    _logs.fine('video filters: $videoFilters');
    var deArrowCache = store.box<DeArrowCache>().count();
    items += deArrowCache;
    _logs.fine('dearrow cache: $deArrowCache');
    var historyCache = store.box<HistoryVideoCache>().count();
    items += historyCache;
    _logs.fine('history cache: $historyCache');
    var progress = store.box<Progress>().count();
    _logs.fine('progresses: $progress');
    items += progress;

    _logs.fine('Needs migration ? ${items > 0}, items to migrate: $items');

    return items > 0;
  } finally {
    db.close();
  }
}

Future<void> clearIsar() async {}
