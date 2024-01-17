import 'dart:io';

import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';
import 'package:invidious/notifications/models/db/playlist_notifications.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/search/models/db/search_history_item.dart';
import 'package:invidious/settings/models/db/app_logs.dart';
import 'package:invidious/settings/models/db/server.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/models/db/video_filter.dart';
import 'package:invidious/utils/interfaces/db.dart';
import 'package:invidious/videos/models/db/dearrow_cache.dart';
import 'package:invidious/videos/models/db/history_video_cache.dart';
import 'package:invidious/videos/models/db/progress.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../settings/states/settings.dart';
import 'obox_database.dart';

const maxLogs = 1000;

class IsarDb extends IDbClient {
  final Isar isar;
  final log = Logger('IsarDB');

  IsarDb._create(this.isar);

  static Future<IsarDb> create() async {
    late final Directory docsDir;
    try {
      docsDir = await getApplicationDocumentsDirectory();
    } catch (e) {
      docsDir = Directory.current;
    }

    final isar = await Isar.open([
      DownloadedVideoSchema,
      HomeLayoutSchema,
      ChannelNotificationSchema,
      PlaylistNotificationSchema,
      SubscriptionNotificationSchema,
      SearchHistoryItemSchema,
      AppLogSchema,
      ServerSchema,
      SettingsValueSchema,
      VideoFilterSchema,
      DeArrowCacheSchema,
      HistoryVideoCacheSchema,
      ProgressSchema
    ], directory: docsDir.path, name: "clipious");
    return IsarDb._create(isar);
  }

  @override
  addToSearchHistory(SearchHistoryItem searchHistoryItem) {
    isar.writeTxnSync(() {
      isar.searchHistoryItems.putSync(searchHistoryItem);
    });
    clearExcessSearchHistory();
  }

  @override
  void insertLogs(AppLog log) {
    isar.writeTxnSync(() => isar.appLogs.putSync(log));
    super.insertLogs(log);
  }

  @override
  cleanOldLogs() {
    isar.writeTxnSync(() {
      var all = isar.appLogs.where().findAllSync();
      List<int> ids = all.reversed.skip(maxLogs).map((e) => e.isarId).toList();
      isar.appLogs.deleteAllSync(ids);
      log.fine("clearing ${ids.length} logs out of ${all.length}");
    });
  }

  @override
  clearExcessSearchHistory() {
    final limit = int.parse(getSettings(searchHistoryLimitSettingName)?.value ??
        searchHistoryDefaultLength);
    log.fine('History limit ? $limit');
    isar.writeTxnSync(() {
      var count = isar.searchHistoryItems.countSync();
      log.fine('search history clear $count/$limit');
      if (count > limit) {
        var ids =
            (_getSearchHistory()).skip(limit).map((e) => e.isarId).toList();
        log.fine('clearing history, ${ids.map((e) => e.toString()).join(",")}');
        isar.searchHistoryItems.deleteAllSync(ids);
      }
    });
  }

  List<SearchHistoryItem> _getSearchHistory() {
    return isar.searchHistoryItems
        .where(sort: Sort.desc)
        .anyTime()
        .findAllSync();
  }

  @override
  clearSearchHistory() {
    isar.writeTxnSync(() {
      isar.searchHistoryItems.clearSync();
    });
  }

  @override
  close() {
    isar.close();
  }

  @override
  deleteChannelNotification(ChannelNotification notif) {
    isar.writeTxnSync(() {
      isar.channelNotifications.deleteSync(notif.isarId);
    });
  }

  @override
  deleteDownload(DownloadedVideo vid) {
    isar.writeTxnSync(() => isar.downloadedVideos.deleteSync(vid.isarId));
  }

  @override
  deleteFilter(VideoFilter filter) {
    isar.writeTxnSync(() => isar.videoFilters.deleteSync(filter.isarId));
  }

  @override
  deletePlaylistNotification(PlaylistNotification notif) {
    isar.writeTxnSync(
        () => isar.playlistNotifications.deleteSync(notif.isarId));
  }

  @override
  deleteServerById(Server server) {
    isar.writeTxnSync(() => isar.servers.deleteSync(server.isarId));
  }

  @override
  deleteSetting(String name) {
    isar.writeTxnSync(() => isar.settingsValues.deleteByNameSync(name));
  }

  @override
  List<ChannelNotification> getAllChannelNotifications() {
    return isar.channelNotifications.where().findAllSync();
  }

  @override
  List<DownloadedVideo> getAllDownloads() {
    return isar.downloadedVideos.where().findAllSync();
  }

  @override
  List<VideoFilter> getAllFilters() {
    return isar.videoFilters.where().findAllSync();
  }

  @override
  List<PlaylistNotification> getAllPlaylistNotifications() {
    return isar.playlistNotifications.where().findAllSync();
  }

  @override
  List<SettingsValue> getAllSettings() {
    return isar.settingsValues.where().findAllSync();
  }

  @override
  List<AppLog> getAppLogs() {
    return isar.appLogs.where().findAllSync();
  }

  @override
  ChannelNotification? getChannelNotification(String channelId) {
    return isar.channelNotifications
        .where()
        .channelIdEqualTo(channelId)
        .findFirstSync();
  }

  @override
  DeArrowCache? getDeArrowCache(String videoId) {
    return isar.deArrowCaches.where().videoIdEqualTo(videoId).findFirstSync();
  }

  @override
  DownloadedVideo? getDownloadById(int id) {
    return isar.downloadedVideos.getSync(id);
  }

  @override
  DownloadedVideo? getDownloadByVideoId(String id) {
    return isar.downloadedVideos.filter().videoIdEqualTo(id).findFirstSync();
  }

  @override
  HistoryVideoCache? getHistoryVideoByVideoId(String videoId) {
    return isar.historyVideoCaches
        .where()
        .videoIdEqualTo(videoId)
        .findFirstSync();
  }

  @override
  HomeLayout getHomeLayout() {
    return isar.homeLayouts.where().findAllSync().firstOrNull ?? HomeLayout();
  }

  @override
  SubscriptionNotification? getLastSubscriptionNotification() {
    return isar.subscriptionNotifications.where().findAllSync().lastOrNull;
  }

  @override
  PlaylistNotification? getPlaylistNotification(String playlistId) {
    return isar.playlistNotifications
        .where()
        .playlistIdEqualTo(playlistId)
        .findFirstSync();
  }

  @override
  List<String> getSearchHistory() {
    return _getSearchHistory().map((e) => e.search).toList();
  }

  @override
  Server? getServer(String url) {
    return isar.servers.where().urlEqualTo(url).findFirstSync();
  }

  @override
  List<Server> getServers() {
    return isar.servers.where().findAllSync();
  }

  @override
  SettingsValue? getSettings(String name) {
    return isar.settingsValues.where().nameEqualTo(name).findFirstSync();
  }

  @override
  double getVideoProgress(String videoId) {
    return isar.progress
            .where()
            .videoIdEqualTo(videoId)
            .findFirstSync()
            ?.progress ??
        0;
  }

  @override
  void saveFilter(VideoFilter filter) {
    isar.writeTxnSync(() => isar.videoFilters.putSync(filter));
  }

  @override
  saveProgress(Progress progress) {
    isar.writeTxnSync(() => isar.progress.putSync(progress));
  }

  @override
  saveSetting(SettingsValue setting) {
    isar.writeTxnSync(() => isar.settingsValues.putSync(setting));
  }

  @override
  void setChannelNotificationLastViewedVideo(String channelId, String videoId) {
    var notif = getChannelNotification(channelId);
    if (notif != null) {
      notif.lastSeenVideoId = videoId;
      notif.timestamp = DateTime.now().millisecondsSinceEpoch;
      upsertChannelNotification(notif);
    }
  }

  @override
  void setLastSubscriptionNotification(SubscriptionNotification sub) {
    isar.writeTxnSync(() {
      isar.subscriptionNotifications.clearSync();
      isar.subscriptionNotifications.putSync(sub);
    });
  }

  @override
  void setPlaylistNotificationLastViewedVideo(
      String playlistId, int videoCount) {
    var notif = getPlaylistNotification(playlistId);
    if (notif != null) {
      notif.lastVideoCount = videoCount;
      notif.timestamp = DateTime.now().millisecondsSinceEpoch;
      upsertPlaylistNotification(notif);
    }
  }

  @override
  void upsertChannelNotification(ChannelNotification notif) {
    isar.writeTxnSync(() => isar.channelNotifications.putSync(notif));
  }

  @override
  void upsertDeArrowCache(DeArrowCache cache) {
    isar.writeTxnSync(() => isar.deArrowCaches.putSync(cache));
  }

  @override
  void upsertDownload(DownloadedVideo vid) {
    isar.writeTxnSync(() => isar.downloadedVideos.putSync(vid));
  }

  @override
  void upsertHistoryVideo(HistoryVideoCache vid) {
    isar.writeTxnSync(() => isar.historyVideoCaches.putSync(vid));
  }

  @override
  void upsertHomeLayout(HomeLayout layout) {
    isar.writeTxnSync(() {
      isar.homeLayouts.clearSync();
      isar.homeLayouts.putSync(layout);
    });
  }

  @override
  void upsertPlaylistNotification(PlaylistNotification notif) {
    isar.writeTxnSync(() => isar.playlistNotifications.putSync(notif));
  }

  @override
  upsertServer(Server server) {
    isar.writeTxnSync(() => isar.servers.putSync(server));
    super.upsertServer(server);
  }

  @override
  void useServer(Server server) {
    isar.writeTxnSync(() {
      List<Server> servers = getServers();
      for (Server s in servers) {
        s.inUse = false;
      }

      isar.servers.putAllSync(servers);

      server.inUse = true;

      isar.servers.putSync(server);
    });
  }
}
