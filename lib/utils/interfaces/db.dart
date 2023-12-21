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
import '../../videos/models/db/dearrow_cache.dart';
import '../../videos/models/db/history_video_cache.dart';
import '../../videos/models/db/progress.dart';

abstract class IDbClient {
  close();

  Server? getServer(String url);

  upsertServer(Server server);

  List<Server> getServers();

  deleteServer(Server server);

  saveSetting(SettingsValue setting);

  List<SettingsValue> getAllSettings();

  deleteSetting(String name);

  SettingsValue? getSettings(String name);

  Server getCurrentlySelectedServer();

  bool isLoggedInToCurrentServer();

  double getVideoProgress(String videoId);

  saveProgress(Progress progress);

  void useServer(Server server);

  List<String> getSearchHistory();

  List<SearchHistoryItem> _getSearchHistory();

  void addToSearchHistory(SearchHistoryItem searchHistoryItem);

  void clearExcessSearchHistory();

  void clearSearchHistory();

  void insertLogs(AppLog log);

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
