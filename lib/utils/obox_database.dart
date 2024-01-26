import 'dart:io';

import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/search/models/db/search_history_item.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/utils/interfaces/db.dart';
import 'package:invidious/videos/models/db/dearrow_cache.dart';
import 'package:invidious/videos/models/db/history_video_cache.dart';
import 'package:invidious/videos/models/db/progress.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../downloads/models/downloaded_video.dart';
import '../notifications/models/db/playlist_notifications.dart';
import '../objectbox.g.dart'; // created by `flutter pub run build_runner build`
import '../settings/models/db/app_logs.dart';
import '../settings/models/db/server.dart';
import '../settings/models/db/video_filter.dart';

const maxLogs = 1000;

class DbClient extends IDbClient {
  /// The Store of this app.
  late final Store store;
  final log = Logger('DbClient');

  DbClient._create(this.store);

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<DbClient> create() async {
    late final Directory docsDir;
    try {
      docsDir = await getApplicationDocumentsDirectory();
    } catch (e) {
      docsDir = Directory.current;
    }
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    var dbPath = p.join(docsDir.path, "impuc-data");
    Store? store;
    if (Store.isOpen(dbPath)) {
      store = Store.attach(getObjectBoxModel(), dbPath);
    } else {
      store = await openStore(directory: dbPath);
    }
    return DbClient._create(store);
  }

  bool get isClosed => store.isClosed();

  @override
  close() {
    store.close();
  }

  @override
  Server? getServer(String url) {
    return store
        .box<Server>()
        .query(Server_.url.equals(url))
        .build()
        .findFirst();
  }

  @override
  upsertServer(Server server) {
    // if we only have one server, we select it
    store.box<Server>().put(server);
    super.upsertServer(server);
  }

  @override
  Future<List<Server>> getServers() async {
    return store.box<Server>().getAll();
  }

  @override
  deleteServerById(Server server) {
    store.box<Server>().remove(server.id);
  }

  @override
  saveSetting(SettingsValue setting) {
    store.box<SettingsValue>().put(setting, mode: PutMode.put);
  }

  @override
  List<SettingsValue> getAllSettings() {
    return store.box<SettingsValue>().getAll();
  }

  @override
  deleteSetting(String name) {
    SettingsValue? settings = getSettings(name);
    if (settings != null) {
      store.box<SettingsValue>().remove(settings.id);
    }
  }

  @override
  SettingsValue? getSettings(String name) {
    return store
        .box<SettingsValue>()
        .query(SettingsValue_.name.equals(name))
        .build()
        .findFirst();
  }

  @override
  double getVideoProgress(String videoId) {
    return store
            .box<Progress>()
            .query(Progress_.videoId.equals(videoId))
            .build()
            .findFirst()
            ?.progress ??
        0;
  }

  @override
  saveProgress(Progress progress) {
    store.box<Progress>().put(progress);
  }

  @override
  Future<void> useServer(Server server) async {
    List<Server> servers = await getServers();
    for (Server s in servers) {
      s.inUse = false;
    }

    store.box<Server>().putMany(servers);

    server.inUse = true;

    store.box<Server>().put(server);
  }

  @override
  List<String> getSearchHistory() {
    return _getSearchHistory().map((e) => e.search).toList();
  }

  List<SearchHistoryItem> _getSearchHistory() {
    return (store.box<SearchHistoryItem>().query()
          ..order(SearchHistoryItem_.time, flags: Order.descending))
        .build()
        .find();
  }

  @override
  Future<void> addToSearchHistory(SearchHistoryItem searchHistoryItem) async {
    store.box<SearchHistoryItem>().put(searchHistoryItem);
    clearExcessSearchHistory();
  }

  @override
  Future<void> clearExcessSearchHistory() async {
    final limit = int.parse(getSettings(searchHistoryLimitSettingName)?.value ??
        searchHistoryDefaultLength);
    if (store.box<SearchHistoryItem>().count() > limit) {
      store.box<SearchHistoryItem>().removeMany(
          _getSearchHistory().skip(limit).map((e) => e.id).toList());
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    store.box<SearchHistoryItem>().removeAll();
  }

  @override
  Future<void> insertLogs(AppLog log) async {
    store.box<AppLog>().put(log);
    super.insertLogs(log);
  }

  @override
  Future<void> cleanOldLogs() async {
    var all = store.box<AppLog>().getAll();

    List<int> ids = all.reversed.skip(maxLogs).map((e) => e.id).toList();
    store.box<AppLog>().removeMany(ids);
    log.fine("clearing ${ids.length} logs out of ${all.length}");
  }

  @override
  List<AppLog> getAppLogs() {
    return store.box<AppLog>().getAll();
  }

  @override
  List<VideoFilter> getAllFilters() {
    return store.box<VideoFilter>().getAll();
  }

  @override
  Future<void> saveFilter(VideoFilter filter) async {
    store.box<VideoFilter>().put(filter);
  }

  @override
  Future<void> deleteFilter(VideoFilter filter) async {
    store.box<VideoFilter>().remove(filter.id);
  }

  @override
  List<DownloadedVideo> getAllDownloads() {
    return store.box<DownloadedVideo>().getAll();
  }

  @override
  Future<void> upsertDownload(DownloadedVideo vid) async {
    store.box<DownloadedVideo>().put(vid);
  }

  @override
  Future<void> deleteDownload(DownloadedVideo vid) async {
    store.box<DownloadedVideo>().remove(vid.id);
  }

  @override
  DownloadedVideo? getDownloadByVideoId(String videoId) {
    return store
        .box<DownloadedVideo>()
        .query(DownloadedVideo_.videoId.equals(videoId))
        .build()
        .findFirst();
  }

  @override
  HistoryVideoCache? getHistoryVideoByVideoId(String videoId) {
    return store
        .box<HistoryVideoCache>()
        .query(HistoryVideoCache_.videoId.equals(videoId))
        .build()
        .findFirst();
  }

  @override
  Future<void> upsertHistoryVideo(HistoryVideoCache vid) async {
    store.box<HistoryVideoCache>().put(vid);
  }

  // we only want one layout
  @override
  Future<void> upsertHomeLayout(HomeLayout layout) async {
    store.box<HomeLayout>().removeAll();
    store.box<HomeLayout>().put(layout);
  }

  @override
  HomeLayout getHomeLayout() {
    var all = store.box<HomeLayout>().getAll();
    return all.firstOrNull ?? HomeLayout();
  }

  SubscriptionNotification? getLastSubscriptionNotification() {
    return store.box<SubscriptionNotification>().getAll().lastOrNull;
  }

  Future<void> setLastSubscriptionNotification(
      SubscriptionNotification sub) async {
    store.box<SubscriptionNotification>().removeAll();
    store.box<SubscriptionNotification>().put(sub);
  }

  ChannelNotification? getChannelNotification(String channelId) {
    return store
        .box<ChannelNotification>()
        .query(ChannelNotification_.channelId.equals(channelId))
        .build()
        .findFirst();
  }

  List<ChannelNotification> getAllChannelNotifications() {
    return store.box<ChannelNotification>().getAll();
  }

  Future<void> deleteChannelNotification(ChannelNotification notif) async {
    store.box<ChannelNotification>().remove(notif.id);
  }

  Future<void> upsertChannelNotification(ChannelNotification notif) async {
    store.box<ChannelNotification>().put(notif);
  }

  Future<void> setChannelNotificationLastViewedVideo(
      String channelId, String videoId) async {
    var notif = getChannelNotification(channelId);
    if (notif != null) {
      notif.lastSeenVideoId = videoId;
      notif.timestamp = DateTime.now().millisecondsSinceEpoch;
      upsertChannelNotification(notif);
    }
  }

  PlaylistNotification? getPlaylistNotification(String channelId) {
    return store
        .box<PlaylistNotification>()
        .query(PlaylistNotification_.playlistId.equals(channelId))
        .build()
        .findFirst();
  }

  List<PlaylistNotification> getAllPlaylistNotifications() {
    return store.box<PlaylistNotification>().getAll();
  }

  Future<void> deletePlaylistNotification(PlaylistNotification notif) async {
    store.box<PlaylistNotification>().remove(notif.id);
  }

  Future<void> upsertPlaylistNotification(PlaylistNotification notif) async {
    store.box<PlaylistNotification>().put(notif);
  }

  Future<void> setPlaylistNotificationLastViewedVideo(
      String playlistId, int videoCount) async {
    var notif = getPlaylistNotification(playlistId);
    if (notif != null) {
      notif.lastVideoCount = videoCount;
      notif.timestamp = DateTime.now().millisecondsSinceEpoch;
      upsertPlaylistNotification(notif);
    }
  }

  @override
  DeArrowCache? getDeArrowCache(String videoId) {
    return store
        .box<DeArrowCache>()
        .query(DeArrowCache_.videoId.equals(videoId))
        .build()
        .findFirst();
  }

  @override
  Future<void> upsertDeArrowCache(DeArrowCache cache) async {
    store.box<DeArrowCache>().put(cache);
  }
}
