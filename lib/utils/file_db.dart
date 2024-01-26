import 'dart:convert';
import 'dart:io';

import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/search/models/db/search_history_item.dart';
import 'package:invidious/settings/models/db/app_logs.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/models/db/video_filter.dart';
import 'package:invidious/videos/models/db/dearrow_cache.dart';
import 'package:invidious/videos/models/db/history_video_cache.dart';
import 'package:invidious/videos/models/db/progress.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../notifications/models/db/channel_notifications.dart';
import '../notifications/models/db/playlist_notifications.dart';
import '../notifications/models/db/subscription_notifications.dart';
import '../settings/models/db/server.dart';
import 'interfaces/db.dart';

part 'file_db.g.dart';

/// this is probably far from the best way to do this but issues with DBs not working on multiple isolates
/// this will just read and write plain json to files
/// methods will follow whatever used to be in the DB
/// this has very low read/write, it should be fine

const _subNotifsFile = 'subscription_notifications.json',
    _channelNotifFile = 'channel_notifications.json',
    _playlistNotifsFile = "player_list_notifications.json",
    _genericSettings = "generic_settings.json";

final _log = Logger('FileDb');

class FileDB extends IDbClient {
  FileDB();

  Future<void> setSubscriptionNotifications(bool b) async {
    var settings = await getGenericSettings();
    settings.subscriptionNotifications = b;
    await updateGenericSettings(settings);
  }

  Future<bool> getSubscriptionNotifications() async {
    return (await getGenericSettings()).subscriptionNotifications;
  }

  Future<void> setLocale(String? l) async {
    var settings = await getGenericSettings();
    settings.locale = l;
    await updateGenericSettings(settings);
  }

  Future<String?> getLocale() async {
    return (await getGenericSettings()).locale;
  }

  Future<void> updateGenericSettings(FileDbGenericSettings settings) async {
    File f = await _openAppFile(_genericSettings);
    await _writeMapToFile(f, settings.toJson());
  }

  Future<FileDbGenericSettings> getGenericSettings() async {
    File f = await _openAppFile(_genericSettings);
    var content = await _readFileAsMap(f);
    if (content.isNotEmpty) {
      return FileDbGenericSettings.fromJson(content);
    } else {
      return FileDbGenericSettings();
    }
  }

  Future<SubscriptionNotification?> getLastSubscriptionNotification() async {
    File f = await _openAppFile(_subNotifsFile);
    var content = await _readFileAsMap(f);
    if (content.isNotEmpty) {
      return SubscriptionNotification.fromJson(content);
    } else {
      return null;
    }
  }

  Future<void> setLastSubscriptionNotification(
      SubscriptionNotification sub) async {
    File f = await _openAppFile(_subNotifsFile);
    await _writeMapToFile(f, sub.toJson());
  }

  Future<ChannelNotification?> getChannelNotification(String channelId) async {
    return (await getAllChannelNotifications())
        .firstWhereOrNull((element) => element.channelId == channelId);
  }

  Future<List<ChannelNotification>> getAllChannelNotifications() async {
    File f = await _openAppFile(_channelNotifFile);
    var contents = await _readFileAsMap(f);
    return contents.values.map((e) => ChannelNotification.fromJson(e)).toList();
  }

  Future<void> deleteChannelNotification(ChannelNotification notif) async {
    var notifs = await getAllChannelNotifications();
    notifs.removeWhere((element) => element.channelId == notif.channelId);
    await _updateChannelNotifications(notifs);
  }

  Future<void> upsertChannelNotification(ChannelNotification notif) async {
    List<ChannelNotification> notifs = await getAllChannelNotifications();
    notifs.removeWhere((element) => element.channelId == notif.channelId);
    notifs.add(notif);
    await _updateChannelNotifications(notifs);
  }

  Future<void> setChannelNotificationLastViewedVideo(
      String channelId, String videoId) async {
    var notif = await getChannelNotification(channelId);
    if (notif != null) {
      notif.lastSeenVideoId = videoId;
      notif.timestamp = DateTime.now().millisecondsSinceEpoch;
      await upsertChannelNotification(notif);
    }
  }

  Future<PlaylistNotification?> getPlaylistNotification(
      String playlistId) async {
    return (await getAllPlaylistNotifications())
        .firstWhereOrNull((element) => element.playlistId == playlistId);
  }

  Future<List<PlaylistNotification>> getAllPlaylistNotifications() async {
    File f = await _openAppFile(_playlistNotifsFile);
    var contents = await _readFileAsMap(f);
    return contents.values
        .map((e) => PlaylistNotification.fromJson(e))
        .toList();
  }

  Future<void> deletePlaylistNotification(PlaylistNotification notif) async {
    var notifs = await getAllPlaylistNotifications();
    notifs.removeWhere((element) => element.playlistId == notif.playlistId);
    await _updatePlayListNotifications(notifs);
  }

  Future<void> upsertPlaylistNotification(PlaylistNotification notif) async {
    List<PlaylistNotification> notifs = await getAllPlaylistNotifications();
    notifs.removeWhere((element) => element.playlistId == notif.playlistId);
    notifs.add(notif);
    await _updatePlayListNotifications(notifs);
  }

  Future<void> setPlaylistNotificationLastViewedVideo(
      String playlistId, int videoCount) async {
    var notif = await getPlaylistNotification(playlistId);
    if (notif != null) {
      notif.lastVideoCount = videoCount;
      notif.timestamp = DateTime.now().millisecondsSinceEpoch;
      await upsertPlaylistNotification(notif);
    }
  }

  Future<void> _updateChannelNotifications(
      List<ChannelNotification> notifications) async {
    Map<String, ChannelNotification> map = {};
    for (var element in notifications) {
      map[element.channelId] = element;
    }

    File f = await _openAppFile(_channelNotifFile);
    await _writeMapToFile(f, map);
  }

  Future<void> _updatePlayListNotifications(
      List<PlaylistNotification> notifications) async {
    Map<String, PlaylistNotification> map = {};
    for (var element in notifications) {
      map[element.playlistId] = element;
    }

    File f = await _openAppFile(_playlistNotifsFile);
    await _writeMapToFile(f, map);
  }

  Future<File> _openAppFile(String path) async {
    late final Directory docsDir;
    try {
      docsDir = await getApplicationDocumentsDirectory();
    } catch (e) {
      docsDir = Directory.current;
    }

    var dbPath = p.join(docsDir.path, path);

    return File(dbPath);
  }

  Future<void> _writeMapToFile(File f, Map<String, dynamic> map) async {
    var string = jsonEncode(map);
    _log.fine("Writing json to ${f.path}: $string");
    await f.writeAsString(string, mode: FileMode.write);
  }

  Future<Map<String, dynamic>> _readFileAsMap(File f) async {
    try {
      final contents = await f.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      return {};
    }
  }

  Future<void> clearDb() async {
    var f = await _openAppFile(_channelNotifFile);
    try {
      await f.delete();
    } catch (e) {
      log.fine('file doesn\'t exist');
    }

    f = await _openAppFile(_playlistNotifsFile);
    try {
      await f.delete();
    } catch (e) {
      log.fine('file doesn\'t exist');
    }

    f = await _openAppFile(_subNotifsFile);
    try {
      await f.delete();
    } catch (e) {
      log.fine('file doesn\'t exist');
    }

    f = await _openAppFile(_genericSettings);
    try {
      await f.delete();
    } catch (e) {
      log.fine('file doesn\'t exist');
    }
  }

  /*
  * This is getting worst and worst. we will only implement the required things for the work manager.
   */
  @override
  Future<void> useServer(Server server) async {
    var settings = await getGenericSettings();
    settings.server = server;
    await updateGenericSettings(settings);
  }

  @override
  Future<Server> getCurrentlySelectedServer() async {
    return (await getGenericSettings()).server!;
  }

  @override
  Future<List<Server>> getServers() async {
    return [(await getGenericSettings()).server!];
  }

  @override
  Future<void> addToSearchHistory(SearchHistoryItem searchHistoryItem) {
    throw UnimplementedError();
  }

  Future<void> syncWithDb() async {
    _log.fine('Syncing file settings with DB');
    var fileSettings = await getGenericSettings();
    fileSettings.locale = db.getSettings(localeSettingName)?.value;
    try {
      fileSettings.server = await db.getCurrentlySelectedServer();
    } catch (err) {
      _log.fine("No server selected in the DB settings, we proceed without");
    }
    await updateGenericSettings(fileSettings);
  }

  /*
  We don't care about anything below this
   */
  @override
  Future<void> cleanOldLogs() {
    throw UnimplementedError();
  }

  @override
  Future<void> clearExcessSearchHistory() {
    throw UnimplementedError();
  }

  @override
  Future<void> clearSearchHistory() {
    // TODO: implement clearSearchHistory
    throw UnimplementedError();
  }

  @override
  close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDownload(DownloadedVideo vid) {
    // TODO: implement deleteDownload
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFilter(VideoFilter filter) {
    // TODO: implement deleteFilter
    throw UnimplementedError();
  }

  @override
  deleteServerById(Server server) {
    // TODO: implement deleteServerById
    throw UnimplementedError();
  }

  @override
  deleteSetting(String name) {
    // TODO: implement deleteSetting
    throw UnimplementedError();
  }

  @override
  List<DownloadedVideo> getAllDownloads() {
    // TODO: implement getAllDownloads
    throw UnimplementedError();
  }

  @override
  List<VideoFilter> getAllFilters() {
    // TODO: implement getAllFilters
    throw UnimplementedError();
  }

  @override
  List<SettingsValue> getAllSettings() {
    // TODO: implement getAllSettings
    throw UnimplementedError();
  }

  @override
  List<AppLog> getAppLogs() {
    // TODO: implement getAppLogs
    throw UnimplementedError();
  }

  @override
  DeArrowCache? getDeArrowCache(String videoId) {
    // TODO: implement getDeArrowCache
    throw UnimplementedError();
  }

  @override
  DownloadedVideo? getDownloadById(int id) {
    // TODO: implement getDownloadById
    throw UnimplementedError();
  }

  @override
  DownloadedVideo? getDownloadByVideoId(String videoId) {
    // TODO: implement getDownloadByVideoId
    throw UnimplementedError();
  }

  @override
  HistoryVideoCache? getHistoryVideoByVideoId(String videoId) {
    // TODO: implement getHistoryVideoByVideoId
    throw UnimplementedError();
  }

  @override
  HomeLayout getHomeLayout() {
    // TODO: implement getHomeLayout
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
  SettingsValue? getSettings(String name) {
    _log.fine("trying to get setting $name");
    return switch (name) {
      (useProxySettingName) => SettingsValue(useProxySettingName, "false"),
      (_) => throw UnimplementedError()
    };
  }

  @override
  double getVideoProgress(String videoId) {
    // TODO: implement getVideoProgress
    throw UnimplementedError();
  }

  @override
  Future<void> insertLogs(AppLog log) async {
    await super.insertLogs(log);
  }

  @override
  Future<void> saveFilter(VideoFilter filter) {
    // TODO: implement saveFilter
    throw UnimplementedError();
  }

  @override
  saveProgress(Progress progress) {
    // TODO: implement saveProgress
    throw UnimplementedError();
  }

  @override
  saveSetting(SettingsValue setting) {
    // TODO: implement saveSetting
    throw UnimplementedError();
  }

  @override
  Future<void> upsertDeArrowCache(DeArrowCache cache) {
    // TODO: implement upsertDeArrowCache
    throw UnimplementedError();
  }

  @override
  Future<void> upsertDownload(DownloadedVideo vid) {
    // TODO: implement upsertDownload
    throw UnimplementedError();
  }

  @override
  Future<void> upsertHistoryVideo(HistoryVideoCache vid) {
    // TODO: implement upsertHistoryVideo
    throw UnimplementedError();
  }

  @override
  Future<void> upsertHomeLayout(HomeLayout layout) {
    // TODO: implement upsertHomeLayout
    throw UnimplementedError();
  }

  @override
  upsertServer(Server server) async {
    await super.upsertServer(server);
  }
}

@JsonSerializable()
class FileDbGenericSettings {
  Server?
      server; // we only store the currently used server because that's what we're interested in
  bool subscriptionNotifications = false;
  String? locale;

  FileDbGenericSettings();

  factory FileDbGenericSettings.fromJson(Map<String, dynamic> json) =>
      _$FileDbGenericSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FileDbGenericSettingsToJson(this);
}
