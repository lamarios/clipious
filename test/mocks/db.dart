import 'package:invidious/database.dart';
import 'package:invidious/models/db/appLog.dart';
import 'package:invidious/models/db/progress.dart';
import 'package:invidious/models/db/searchHistoryItem.dart';
import 'package:invidious/models/db/server.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/models/db/videoFilter.dart';

var testServerUrl = 'https://test.com';

class TestDbClient implements IDBClient {
  Map<String, String?> settings = {};
  List<VideoFilter> videoFilters = [];

  @override
  Server getCurrentlySelectedServer() {
    Server server = Server(testServerUrl);
    server.inUse = true;
    return server;
  }

  @override
  void addToSearchHistory(SearchHistoryItem searchHistoryItem) {
    // TODO: implement addToSearchHistory
  }

  @override
  void cleanOldLogs() {
    // TODO: implement cleanOldLogs
  }

  @override
  void clearExcessSearchHistory() {
    // TODO: implement clearExcessSearchHistory
  }

  @override
  void clearSearchHistory() {
    // TODO: implement clearSearchHistory
  }

  @override
  void deleteFilter(VideoFilter filter) {
    // TODO: implement deleteFilter
  }

  @override
  deleteServer(Server server) {
    // TODO: implement deleteServer
    throw UnimplementedError();
  }

  @override
  deleteSetting(String name) {
    // TODO: implement deleteSetting
    throw UnimplementedError();
  }

  @override
  List<VideoFilter> getAllFilters() {
    return videoFilters;
  }

  @override
  List<AppLog> getAppLogs() {
    // TODO: implement getAppLogs
    throw UnimplementedError();
  }

  @override
  List<String> getSearchHistory() {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Server? getServer(String url) {
    // TODO: implement getServer
    throw UnimplementedError();
  }

  @override
  List<Server> getServers() {
    // TODO: implement getServers
    throw UnimplementedError();
  }

  @override
  SettingsValue? getSettings(String name) {
    return settings.containsKey(name) ? SettingsValue(name, settings[name]!) : null;
  }

  @override
  double getVideoProgress(String videoId) {
    // TODO: implement getVideoProgress
    throw UnimplementedError();
  }

  @override
  void insertLogs(AppLog log) {
    // TODO: implement insertLogs
  }

  @override
  bool isLoggedInToCurrentServer() {
    return true;
  }

  @override
  void saveFilter(VideoFilter filter) {
    // TODO: implement saveFilter
  }

  @override
  saveProgress(Progress progress) {
    // TODO: implement saveProgress
    throw UnimplementedError();
  }

  @override
  saveSetting(SettingsValue setting) {
    settings[setting.name] = setting.value;
  }

  @override
  upsertServer(Server server) {
    // TODO: implement upsertServer
    throw UnimplementedError();
  }

  @override
  void useServer(Server server) {
    // TODO: implement useServer
  }
}
