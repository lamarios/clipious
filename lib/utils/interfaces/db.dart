import 'package:easy_debounce/easy_debounce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../home/models/db/home_layout.dart';
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
  upsertServer(Server server) async {
    var servers = await getServers();
    if (servers.length == 1) {
      await useServer(server);
    }
  }

  Future<List<Server>> getServers();

  deleteServerById(Server server);

  deleteServer(Server server) async {
    if ((await getServers()).length >= 2) {
      await deleteServerById(server);
      if (server.inUse) {
        getCurrentlySelectedServer();
      }
    }
  }

  saveSetting(SettingsValue setting);

  List<SettingsValue> getAllSettings();

  deleteSetting(String name);

  SettingsValue? getSettings(String name);

  Future<Server> getCurrentlySelectedServer() async {
    var server =
        (await getServers()).where((element) => element.inUse).firstOrNull;
    if (server == null) {
      log.fine('No servers selected, we try to find one');
      List<Server> servers = await getServers();
      if (servers.isEmpty) {
        log.fine('We don\'t have servers, we need to show the welcome screen');
        throw NoServerSelected();
      }
      // we just select the first of the list
      await useServer(servers.first);
      return servers.first;
    } else {
      return server;
    }
  }

  Future<bool> isLoggedInToCurrentServer() async {
    var currentlySelectedServer = await getCurrentlySelectedServer();
    return (currentlySelectedServer.authToken?.isNotEmpty ?? false) ||
        (currentlySelectedServer.sidCookie?.isNotEmpty ?? false);
  }

  double getVideoProgress(String videoId);

  saveProgress(Progress progress);

  Future<void> useServer(Server server);

  List<String> getSearchHistory();

  Future<void> addToSearchHistory(SearchHistoryItem searchHistoryItem);

  Future<void> clearExcessSearchHistory();

  Future<void> clearSearchHistory();

  /// Call super at the end
  @mustCallSuper
  @mustBeOverridden
  Future<void> insertLogs(AppLog log) async {
    EasyDebounce.debounce('log-cleaning', const Duration(seconds: 5), () {
      cleanOldLogs();
    });
  }

  Future<void> cleanOldLogs();

  List<AppLog> getAppLogs();

  List<VideoFilter> getAllFilters();

  Future<void> saveFilter(VideoFilter filter);

  Future<void> deleteFilter(VideoFilter filter);

  List<DownloadedVideo> getAllDownloads();

  Future<void> upsertDownload(DownloadedVideo vid);

  Future<void> deleteDownload(DownloadedVideo vid);

  DownloadedVideo? getDownloadByVideoId(String videoId);

  HistoryVideoCache? getHistoryVideoByVideoId(String videoId);

  Future<void> upsertHistoryVideo(HistoryVideoCache vid);

  // we only want one layout
  Future<void> upsertHomeLayout(HomeLayout layout);

  HomeLayout getHomeLayout();

  DeArrowCache? getDeArrowCache(String videoId);

  Future<void> upsertDeArrowCache(DeArrowCache cache);

  Future<void> deleteFromSearchHistory(String search);
}
