import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../home/models/db/home_layout.dart';
import '../../notifications/models/db/channel_notifications.dart';
import '../../notifications/models/db/playlist_notifications.dart';
import '../../notifications/models/db/subscription_notifications.dart';
import '../../search/models/db/search_history_item.dart';
import '../../settings/models/db/app_logs.dart';
import '../../settings/models/db/server.dart';
import '../../settings/models/db/settings.dart';
import '../../settings/models/db/video_filter.dart';
import '../../settings/models/errors/no_server_selected.dart';
import '../../videos/models/db/dearrow_cache.dart';
import '../../videos/models/db/history_video_cache.dart';
import '../../videos/models/db/progress.dart';

abstract class IDbClient {
  close();

  Server? getServer(String url);

  /// Call super at the end
  @mustCallSuper
  @mustBeOverridden
  upsertServer(Server server) {
    var servers = getServers();
    if (servers.length == 1) {
      useServer(server);
    }
  }

  List<Server> getServers();

  deleteServerById(Server server);

  deleteServer(Server server) {
    if (getServers().length >= 2) {
      deleteServerById(server);
      if (server.inUse) {
        getCurrentlySelectedServer();
      }
    }
  }

  saveSetting(SettingsValue setting);

  List<SettingsValue> getAllSettings();

  deleteSetting(String name);

  SettingsValue? getSettings(String name);

  Server getCurrentlySelectedServer() {
    var server = getServers().where((element) => element.inUse).firstOrNull;
    if (server == null) {
      log.fine('No servers selected, we try to find one');
      List<Server> servers = getServers();
      if (servers.isEmpty) {
        log.fine('We don\'t have servers, we need to show the welcome screen');
        throw NoServerSelected();
      }
      // we just select the first of the list
      useServer(servers.first);
      return servers.first;
    } else {
      return server;
    }
  }

  bool isLoggedInToCurrentServer() {
    var currentlySelectedServer = getCurrentlySelectedServer();
    return (currentlySelectedServer.authToken?.isNotEmpty ?? false) ||
        (currentlySelectedServer.sidCookie?.isNotEmpty ?? false);
  }

  double getVideoProgress(String videoId);

  saveProgress(Progress progress);

  void useServer(Server server);

  List<String> getSearchHistory();

  void addToSearchHistory(SearchHistoryItem searchHistoryItem);

  void clearExcessSearchHistory();

  void clearSearchHistory();

  /// Call super at the end
  @mustCallSuper
  @mustBeOverridden
  void insertLogs(AppLog log) {
    EasyDebounce.debounce('log-cleaning', const Duration(seconds: 5), () {
      cleanOldLogs();
    });
  }

  void cleanOldLogs();

  List<AppLog> getAppLogs();

  List<VideoFilter> getAllFilters();

  void saveFilter(VideoFilter filter);

  void deleteFilter(VideoFilter filter);

  List<DownloadedVideo> getAllDownloads();

  void upsertDownload(DownloadedVideo vid);

  void deleteDownload(DownloadedVideo vid);

  DownloadedVideo? getDownloadById(int id);

  DownloadedVideo? getDownloadByVideoId(String id);

  HistoryVideoCache? getHistoryVideoByVideoId(String videoId);

  void upsertHistoryVideo(HistoryVideoCache vid);

  // we only want one layout
  void upsertHomeLayout(HomeLayout layout);

  HomeLayout getHomeLayout();

  SubscriptionNotification? getLastSubscriptionNotification();

  void setLastSubscriptionNotification(SubscriptionNotification sub);

  ChannelNotification? getChannelNotification(String channelId);

  List<ChannelNotification> getAllChannelNotifications();

  void deleteChannelNotification(ChannelNotification notif);

  void upsertChannelNotification(ChannelNotification notif);

  void setChannelNotificationLastViewedVideo(String channelId, String videoId);

  PlaylistNotification? getPlaylistNotification(String channelId);

  List<PlaylistNotification> getAllPlaylistNotifications();

  void deletePlaylistNotification(PlaylistNotification notif);

  void upsertPlaylistNotification(PlaylistNotification notif);

  void setPlaylistNotificationLastViewedVideo(
      String playlistId, int videoCount);

  DeArrowCache? getDeArrowCache(String videoId);

  void upsertDeArrowCache(DeArrowCache cache);
}
