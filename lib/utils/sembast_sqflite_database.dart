import 'dart:async';
import 'dart:ffi';
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
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_sqflite/sembast_sqflite.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../settings/states/settings.dart';

const maxLogs = 1000;
const singleId = 1;

class SembastSqfDb extends IDbClient {
  final log = Logger('SembastSqfLDB');
  final Database db;
  final downloadedVideos = intMapStoreFactory.store('downloadedVideo');
  final homeLayout =
      intMapStoreFactory.store('homeLayout'); // always use id = 1
  final searchHistory =
      stringMapStoreFactory.store('searchHistory'); // use term as key
  final appLogs = intMapStoreFactory.store('appLogs');
  final servers =
      stringMapStoreFactory.store('serviers'); // use server url as key
  final videoFilters = intMapStoreFactory.store('videoFilters');
  final settings =
      stringMapStoreFactory.store('settings'); // settings name as key;
  final deArrowCache =
      stringMapStoreFactory.store('dearrow'); // use video id as key
  final historyVideoCache =
      stringMapStoreFactory.store('historyVideoCache'); // use historyVideoCache
  final progress = stringMapStoreFactory.store('progress');

  SembastSqfDb(this.db);

  static Future<SembastSqfDb> create() async {
    late final Directory docsDir;
    try {
      docsDir = await getApplicationDocumentsDirectory();
    } catch (e) {
      docsDir = Directory.current;
    }

    var dbPath = p.join(docsDir.path, "clipious.db");

    final databaseFactorySqflite =
        getDatabaseFactorySqflite(sqflite.databaseFactory);
    var db = await databaseFactorySqflite.openDatabase(
      dbPath.toString(),
      version: 1,
    );

    return SembastSqfDb(db);
  }

  static Future<SembastSqfDb> createInMenory() async {
    var factory = newDatabaseFactoryMemory();
    var db = await factory.openDatabase("test.db");
    return SembastSqfDb(db);
  }

  @override
  Future<void> addToSearchHistory(SearchHistoryItem searchHistoryItem) async {
    await searchHistory
        .record(searchHistoryItem.search)
        .put(db, searchHistoryItem.toJson());
  }

  @override
  Future<void> cleanOldLogs() async {
    // TODO: implement cleanOldLogs
    var all = getAppLogs();
    List<int> ids = all.reversed.skip(maxLogs).map((e) => e.id).toList();
    await appLogs.delete(db, finder: Finder(offset: 0, limit: ids.length));
    log.fine("clearing ${ids.length} logs out of ${all.length}");
  }

  @override
  Future<void> clearExcessSearchHistory() async {
    final limit = int.parse(getSettings(searchHistoryLimitSettingName)?.value ??
        searchHistoryDefaultLength);

    log.fine('History limit ? $limit');

    var count = searchHistory.countSync(db);
    log.fine('search history clear $count/$limit');
    if (count > limit) {
      await searchHistory.delete(db, finder: Finder(limit: count - limit));
      log.fine('clearing ${count - limit} history itens');
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    // TODO: implement clearSearchHistory
    await searchHistory.delete(db);
  }

  @override
  close() {
    db.close();
  }

  @override
  Future<void> deleteDownload(DownloadedVideo vid) async {
    await downloadedVideos.record(vid.id).delete(db);
  }

  @override
  Future<void> deleteFilter(VideoFilter filter) async {
    await videoFilters.record(filter.id).delete(db);
  }

  @override
  deleteServerById(Server server) async {
    await servers.record(server.url).delete(db);
  }

  @override
  deleteSetting(String name) async {
    await settings.record(name).delete(db);
  }

  @override
  List<DownloadedVideo> getAllDownloads() {
    var records = downloadedVideos.findSync(db);
    return records.map((e) {
      var d = DownloadedVideo.fromJson(e.value);
      d.id = e.key;
      return d;
    }).toList();
  }

  @override
  List<VideoFilter> getAllFilters() {
    return videoFilters
        .findSync(db)
        .map((e) => VideoFilter.fromJson(e.value)..id = e.key)
        .toList();
  }

  @override
  List<SettingsValue> getAllSettings() {
    return settings
        .findSync(db)
        .map((e) => SettingsValue.fromJson(e.value))
        .toList();
  }

  @override
  List<AppLog> getAppLogs() {
    return appLogs
        .findSync(db)
        .map((e) => AppLog.fromJson(e.value)..id = e.key)
        .toList();
  }

  @override
  DeArrowCache? getDeArrowCache(String videoId) {
    var v = deArrowCache.record(videoId).getSync(db);

    return v != null ? DeArrowCache.fromJson(v) : null;
  }

  @override
  DownloadedVideo? getDownloadById(int id) {
    var v = downloadedVideos.record(id).getSync(db);
    return v != null ? (DownloadedVideo.fromJson(v)..id = id) : null;
  }

  @override
  DownloadedVideo? getDownloadByVideoId(String videoId) {
    var v = downloadedVideos
        .findSync(db, finder: Finder(filter: Filter.equals("videoId", videoId)))
        .firstOrNull;
    return v != null ? (DownloadedVideo.fromJson(v.value)..id = v.key) : null;
  }

  @override
  HistoryVideoCache? getHistoryVideoByVideoId(String videoId) {
    var v = historyVideoCache.record(videoId).getSync(db);
    return v != null ? HistoryVideoCache.fromJson(v) : null;
  }

  @override
  HomeLayout getHomeLayout() {
    var findFirstSync = homeLayout.findFirstSync(db);
    if (findFirstSync != null) {
      return HomeLayout.fromJson(findFirstSync.value);
    } else {
      return HomeLayout();
    }
  }

  @override
  List<String> getSearchHistory() {
    return searchHistory
        .findSync(db)
        .map((e) => SearchHistoryItem.fromJson(e.value).search)
        .toList();
  }

  @override
  Server? getServer(String url) {
    var v = servers.record(url).getSync(db);
    return v != null ? Server.fromJson(v) : null;
  }

  @override
  Future<List<Server>> getServers() async {
    return (await servers.find(db))
        .map((e) => Server.fromJson(e.value))
        .toList();
  }

  @override
  SettingsValue? getSettings(String name) {
    var v = settings.record(name).getSync(db);
    return v != null ? SettingsValue.fromJson(v) : null;
  }

  @override
  double getVideoProgress(String videoId) {
    var v = progress.record(videoId).getSync(db);
    return v != null ? Progress.fromJson(v).progress : 0;
  }

  @override
  Future<void> insertLogs(AppLog log) async {
    await appLogs.add(db, log.toJson());
    super.insertLogs(log);
  }

  @override
  Future<void> saveFilter(VideoFilter filter) async {
    await videoFilters.record(filter.id).put(db, filter.toJson());
  }

  @override
  saveProgress(Progress progress) async {
    await this.progress.record(progress.videoId).put(db, progress.toJson());
  }

  @override
  saveSetting(SettingsValue setting) async {
    await settings.record(settings.name).put(db, setting.toJson());
  }

  @override
  Future<void> upsertDeArrowCache(DeArrowCache cache) async {
    await deArrowCache.record(cache.videoId).put(db, cache.toJson());
  }

  @override
  Future<void> upsertDownload(DownloadedVideo vid) async {
    await downloadedVideos.record(vid.id).put(db, vid.toJson());
  }

  @override
  Future<void> upsertHistoryVideo(HistoryVideoCache vid) async {
    await historyVideoCache.record(vid.videoId).put(db, vid.toJson());
  }

  @override
  Future<void> upsertHomeLayout(HomeLayout layout) async {
    await homeLayout.record(singleId).put(db, layout.toJson());
  }

  @override
  upsertServer(Server server) async {
    await servers.record(server.url).put(db, server.toJson());
    super.upsertServer(server);
  }

  @override
  Future<void> useServer(Server server) async {
    List<Server> servers = await getServers();
    for (Server s in servers) {
      s.inUse = false;
      await upsertServer(s);
    }

    server.inUse = true;

    await upsertServer(server);
  }
}
