import 'dart:math';

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

class MemoryDB extends IDbClient {
  final List<SearchHistoryItem> searchHistoryItems = [];
  final List<ChannelNotification> channelNotifications = [];
  final List<DownloadedVideo> downloadedVideos = [];

  final List<VideoFilter> videoFilters = [];
  final List<SettingsValue> settings = [];
  final List<AppLog> logs = [];
  final List<Server> servers = [];
  HomeLayout homeLayout = HomeLayout();

  @override
  void addToSearchHistory(SearchHistoryItem searchHistoryItem) {
    // TODO: implement addToSearchHistory
  }

  @override
  void cleanOldLogs() {
    if (logs.length > 20) {
      logs.removeRange(0, logs.length - 20);
    }
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
  close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  void deleteChannelNotification(ChannelNotification notif) {
    // TODO: implement deleteChannelNotification
  }

  @override
  void deleteDownload(DownloadedVideo vid) {
    // TODO: implement deleteDownload
  }

  @override
  void deleteFilter(VideoFilter filter) {
    // TODO: implement deleteFilter
  }

  @override
  void deletePlaylistNotification(PlaylistNotification notif) {
    // TODO: implement deletePlaylistNotification
  }

  @override
  deleteServerById(int id) {
    servers.removeWhere((element) => element.id == id);
  }

  @override
  deleteSetting(String name) {
    // TODO: implement deleteSetting
    throw UnimplementedError();
  }

  @override
  List<ChannelNotification> getAllChannelNotifications() {
    // TODO: implement getAllChannelNotifications
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
  List<PlaylistNotification> getAllPlaylistNotifications() {
    // TODO: implement getAllPlaylistNotifications
    throw UnimplementedError();
  }

  @override
  List<SettingsValue> getAllSettings() {
    return settings;
  }

  @override
  List<AppLog> getAppLogs() {
    return logs;
  }

  @override
  ChannelNotification? getChannelNotification(String channelId) {
    // TODO: implement getChannelNotification
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
  DownloadedVideo? getDownloadByVideoId(String id) {
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
    return homeLayout;
  }

  @override
  SubscriptionNotification? getLastSubscriptionNotification() {
    // TODO: implement getLastSubscriptionNotification
    throw UnimplementedError();
  }

  @override
  PlaylistNotification? getPlaylistNotification(String channelId) {
    // TODO: implement getPlaylistNotification
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
    return servers;
  }

  @override
  SettingsValue? getSettings(String name) {
    return settings.where((element) => element.name == name).firstOrNull;
  }

  @override
  double getVideoProgress(String videoId) {
    // TODO: implement getVideoProgress
    throw UnimplementedError();
  }

  @override
  void insertLogs(AppLog log) {
    log.id = Random().nextInt(999999999);
    logs.add(log);
    super.insertLogs(log);
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
    settings.removeWhere((element) => element.name == setting.name);
    setting.id = Random().nextInt(999999999);
    settings.add(setting);
  }

  @override
  void setChannelNotificationLastViewedVideo(String channelId, String videoId) {
    // TODO: implement setChannelNotificationLastViewedVideo
  }

  @override
  void setLastSubscriptionNotification(SubscriptionNotification sub) {
    // TODO: implement setLastSubscriptionNotification
  }

  @override
  void setPlaylistNotificationLastViewedVideo(String playlistId, int videoCount) {
    // TODO: implement setPlaylistNotificationLastViewedVideo
  }

  @override
  void upsertChannelNotification(ChannelNotification notif) {
    // TODO: implement upsertChannelNotification
  }

  @override
  void upsertDeArrowCache(DeArrowCache cache) {
    // TODO: implement upsertDeArrowCache
  }

  @override
  void upsertDownload(DownloadedVideo vid) {
    // TODO: implement upsertDownload
  }

  @override
  void upsertHistoryVideo(HistoryVideoCache vid) {
    // TODO: implement upsertHistoryVideo
  }

  @override
  void upsertHomeLayout(HomeLayout layout) {
    homeLayout = layout;
  }

  @override
  void upsertPlaylistNotification(PlaylistNotification notif) {
    // TODO: implement upsertPlaylistNotification
  }

  @override
  upsertServer(Server server) {
    if (server.id == -1) {
      server.id = Random().nextInt(99999999);
    } else {
      servers.removeWhere((element) => element.id == server.id);
    }
    servers.add(server);

    super.upsertServer(server);
  }

  @override
  void useServer(Server server) {
    for (Server s in servers) {
      s.inUse = false;
    }
    server.inUse = true;
  }
}
