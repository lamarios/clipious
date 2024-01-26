import 'dart:async';
import 'dart:io';

import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/home/models/db/home_layout.dart';
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
import 'package:sembast/sembast_memory.dart';
import 'package:sembast_sqflite/sembast_sqflite.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../settings/states/settings.dart';

const maxLogs = 1000;
const singleId = 1;

class SembastSqfDb extends IDbClient {
  final log = Logger('SembastSqfLDB');
  final Database db;
  final downloadedVideosStore = intMapStoreFactory.store('downloadedVideo');
  final homeLayoutStore =
      intMapStoreFactory.store('homeLayout'); // always use id = 1
  final searchHistoryStore =
      stringMapStoreFactory.store('searchHistory'); // use term as key
  final appLogsStore = intMapStoreFactory.store('appLogs');
  final serversStore =
      stringMapStoreFactory.store('serviers'); // use server url as key
  final videoFiltersStore = intMapStoreFactory.store('videoFilters');
  final settingsStore =
      stringMapStoreFactory.store('settings'); // settings name as key;
  final deArrowCacheStore =
      stringMapStoreFactory.store('dearrow'); // use video id as key
  final historyVideoCacheStore =
      stringMapStoreFactory.store('historyVideoCache'); // use historyVideoCache
  final progressStore = stringMapStoreFactory.store('progress');

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
    searchHistoryItem.time = DateTime.now().millisecondsSinceEpoch;
    await searchHistoryStore
        .record(searchHistoryItem.search)
        .put(db, searchHistoryItem.toJson());
    await clearExcessSearchHistory();
  }

  @override
  Future<void> cleanOldLogs() async {
    // TODO: implement cleanOldLogs
    var all = getAppLogs();
    List<int> ids = all.reversed.skip(maxLogs).map((e) => e.id).toList();
    await appLogsStore.delete(db,
        finder: Finder(
            sortOrders: [SortOrder("time")], offset: 0, limit: ids.length));
    log.fine("clearing ${ids.length} logs out of ${all.length}");
  }

  @override
  Future<void> clearExcessSearchHistory() async {
    final limit = int.parse(getSettings(searchHistoryLimitSettingName)?.value ??
        searchHistoryDefaultLength);

    log.fine('History limit ? $limit');

    var count = searchHistoryStore.countSync(db);
    log.fine('search history clear $count/$limit');
    if (count > limit) {
      await searchHistoryStore.delete(db,
          finder: Finder(
              sortOrders: [SortOrder("time")],
              offset: 0,
              limit: count - limit));
      log.fine('clearing ${count - limit} history itens');
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    // TODO: implement clearSearchHistory
    await searchHistoryStore.delete(db);
  }

  @override
  close() async {
    await db.close();
  }

  @override
  Future<void> deleteDownload(DownloadedVideo vid) async {
    await downloadedVideosStore.record(vid.id).delete(db);
  }

  @override
  Future<void> deleteFilter(VideoFilter filter) async {
    await videoFiltersStore.record(filter.id).delete(db);
  }

  @override
  deleteServerById(Server server) async {
    await serversStore.record(server.url).delete(db);
  }

  @override
  deleteSetting(String name) async {
    await settingsStore.record(name).delete(db);
  }

  @override
  List<DownloadedVideo> getAllDownloads() {
    var records = downloadedVideosStore.findSync(db);
    return records.map((e) {
      var d = DownloadedVideo.fromJson(e.value);
      d.id = e.key;
      return d;
    }).toList();
  }

  @override
  List<VideoFilter> getAllFilters() {
    return videoFiltersStore
        .findSync(db)
        .map((e) => VideoFilter.fromJson(e.value)..id = e.key)
        .toList();
  }

  @override
  List<SettingsValue> getAllSettings() {
    return settingsStore
        .findSync(db)
        .map((e) => SettingsValue.fromJson(e.value))
        .toList();
  }

  @override
  List<AppLog> getAppLogs() {
    return appLogsStore
        .findSync(db)
        .map((e) => AppLog.fromJson(e.value)..id = e.key)
        .toList();
  }

  @override
  DeArrowCache? getDeArrowCache(String videoId) {
    var v = deArrowCacheStore.record(videoId).getSync(db);

    return v != null ? DeArrowCache.fromJson(v) : null;
  }

  @override
  DownloadedVideo? getDownloadById(int id) {
    var v = downloadedVideosStore.record(id).getSync(db);
    return v != null ? (DownloadedVideo.fromJson(v)..id = id) : null;
  }

  @override
  DownloadedVideo? getDownloadByVideoId(String videoId) {
    var v = downloadedVideosStore
        .findSync(db, finder: Finder(filter: Filter.equals("videoId", videoId)))
        .firstOrNull;
    return v != null ? (DownloadedVideo.fromJson(v.value)..id = v.key) : null;
  }

  @override
  HistoryVideoCache? getHistoryVideoByVideoId(String videoId) {
    var v = historyVideoCacheStore.record(videoId).getSync(db);
    return v != null ? HistoryVideoCache.fromJson(v) : null;
  }

  @override
  HomeLayout getHomeLayout() {
    var findFirstSync = homeLayoutStore.findFirstSync(db);
    if (findFirstSync != null) {
      return HomeLayout.fromJson(findFirstSync.value);
    } else {
      return HomeLayout();
    }
  }

  @override
  List<String> getSearchHistory() {
    return searchHistoryStore
        .findSync(db)
        .map((e) => SearchHistoryItem.fromJson(e.value).search)
        .toList();
  }

  @override
  Server? getServer(String url) {
    var v = serversStore.record(url).getSync(db);
    return v != null ? Server.fromJson(v) : null;
  }

  @override
  Future<List<Server>> getServers() async {
    return (await serversStore.find(db))
        .map((e) => Server.fromJson(e.value))
        .toList();
  }

  @override
  SettingsValue? getSettings(String name) {
    var v = settingsStore.record(name).getSync(db);
    return v != null ? SettingsValue.fromJson(v) : null;
  }

  @override
  double getVideoProgress(String videoId) {
    var v = progressStore.record(videoId).getSync(db);
    return v != null ? Progress.fromJson(v).progress : 0;
  }

  @override
  Future<void> insertLogs(AppLog log) async {
    await appLogsStore.add(db, log.toJson());
    super.insertLogs(log);
  }

  @override
  Future<void> saveFilter(VideoFilter filter) async {
    await videoFiltersStore.record(filter.id).put(db, filter.toJson());
  }

  @override
  saveProgress(Progress progress) async {
    await progressStore.record(progress.videoId).put(db, progress.toJson());
  }

  @override
  saveSetting(SettingsValue setting) async {
    await settingsStore.record(setting.name).put(db, setting.toJson());
  }

  @override
  Future<void> upsertDeArrowCache(DeArrowCache cache) async {
    await deArrowCacheStore.record(cache.videoId).put(db, cache.toJson());
  }

  @override
  Future<void> upsertDownload(DownloadedVideo vid) async {
    await downloadedVideosStore.record(vid.id).put(db, vid.toJson());
  }

  @override
  Future<void> upsertHistoryVideo(HistoryVideoCache vid) async {
    await historyVideoCacheStore.record(vid.videoId).put(db, vid.toJson());
  }

  @override
  Future<void> upsertHomeLayout(HomeLayout layout) async {
    await homeLayoutStore.record(singleId).put(db, layout.toJson());
  }

  @override
  upsertServer(Server server) async {
    await serversStore.record(server.url).put(db, server.toJson());
    await super.upsertServer(server);
  }

  @override
  Future<void> useServer(Server server) async {
    List<Server> servers = await getServers();
    for (Server s in servers) {
      s.inUse = false;
      await serversStore.record(server.url).put(db, server.toJson());
    }

    server.inUse = true;

    await serversStore.record(server.url).put(db, server.toJson());
  }
}
