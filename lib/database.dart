import 'package:easy_debounce/easy_debounce.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/search/models/db/search_history_item.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/models/errors/no_server_selected.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/videos/models/db/dearrow_cache.dart';
import 'package:invidious/videos/models/db/history_video_cache.dart';
import 'package:invidious/videos/models/db/progress.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'downloads/models/downloaded_video.dart';
import 'notifications/models/db/playlist_notifications.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`
import 'settings/models/db/app_logs.dart';
import 'settings/models/db/server.dart';
import 'settings/models/db/video_filter.dart';

const selectedServer = 'selected-server';
const useSponsorBlock = 'use-sponsor-block';
const sponsorBlockPrefix = 'sponsor-block-';
const browsingCountry = 'browsing-country';
const dynamicTheme = 'dynamic-theme';
const useDashSettingName = 'use-dash';
const playerRepeat = 'player-repeat';
const playerShuffle = 'player-shuffle';
const playerAutoplayOnLoad = 'player-autoplay-on-load';
const playRecommendedNextSettingName = 'play-recommended-next';
const useProxySettingName = 'use-proxy';
const useReturnYoutubeDislikeSettingName = 'use-return-youtube-dislike';
const blackBackgroundSettingName = 'black-background';
const subtitleSizeSettingName = 'subtitles-size';
const rememberLastSubtitle = 'remember-last-subtitle';
const lastSubtitle = 'last-subtitle';
const skipSslVerificationSettingName = 'skip-ssl-verification';
const themeModeSettingName = 'theme-mode';
const localeSettingName = 'locale';
const useSearchHistorySettingName = 'use-search-history';
const searchHistoryLimitSettingName = 'search-history-limit';
const hideFilteredVideo = 'hide-filtered-videos';
const remeberPlaybackSpeed = 'remember-playback-speed';
const lastSpeedSettingName = 'last-speed';
const lockOrientationFullScreen = 'lock-orientation-fullscreen';
const skipStepSettingName = 'skip-step';
const skipExponentialSettingName = 'skip-exponentially';
const fillFullScreen = 'fill-fullscreen';
const appLayoutSettingName = 'app-layout';
const navigationBarLabelBehaviorSettingName = 'navigation-bar-label-behavior';
const distractionFreeModeSettingName = 'distraction-free-mode';
const backgroundNotificationsSettingName = 'background-notifications';
const subscriptionNotifications = 'subscriptions-notifications';
const backgroundCheckFrequency = "background-check-frequency";
const subtitleBackground = 'subtitle-background';
const dearrowSettingName = 'dearrow';
const dearrowThumbnailsSettingName = "dearrow-thumbnails";
const fullScreenOnLandscapeSettingName = "fullscreen-on-landscape";

const onOpenSettingName = "on-open";

const maxLogs = 1000;

class DbClient {
  /// The Store of this app.
  late final Store store;
  final log = Logger('DbClient');

  DbClient._create(this.store);

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<DbClient> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
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

  close() {
    store.close();
  }

  Server? getServer(String url) {
    return store
        .box<Server>()
        .query(Server_.url.equals(url))
        .build()
        .findFirst();
  }

  upsertServer(Server server) {
    store.box<Server>().put(server);
    // if we only have one server, we select it
    var servers = getServers();
    if (servers.length == 1) {
      useServer(server);
    }
  }

  List<Server> getServers() {
    return store.box<Server>().getAll();
  }

  deleteServer(Server server) {
    if (getServers().length >= 2) {
      store.box<Server>().remove(server.id);
      if (server.inUse) {
        getCurrentlySelectedServer();
      }
    }
  }

  saveSetting(SettingsValue setting) {
    store.box<SettingsValue>().put(setting, mode: PutMode.put);
  }

  List<SettingsValue> getAllSettings() {
    return store.box<SettingsValue>().getAll();
  }

  deleteSetting(String name) {
    SettingsValue? settings = getSettings(name);
    if (settings != null) {
      store.box<SettingsValue>().remove(settings.id);
    }
  }

  SettingsValue? getSettings(String name) {
    return store
        .box<SettingsValue>()
        .query(SettingsValue_.name.equals(name))
        .build()
        .findFirst();
  }

  Server getCurrentlySelectedServer() {
    Server? server = store
        .box<Server>()
        .query(Server_.inUse.equals(true))
        .build()
        .findFirst();

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

  double getVideoProgress(String videoId) {
    return store
            .box<Progress>()
            .query(Progress_.videoId.equals(videoId))
            .build()
            .findFirst()
            ?.progress ??
        0;
  }

  saveProgress(Progress progress) {
    store.box<Progress>().put(progress);
  }

  void useServer(Server server) {
    List<Server> servers = getServers();
    for (Server s in servers) {
      s.inUse = false;
    }

    store.box<Server>().putMany(servers);

    server.inUse = true;

    store.box<Server>().put(server);
  }

  List<String> getSearchHistory() {
    return _getSearchHistory().map((e) => e.search).toList();
  }

  List<SearchHistoryItem> _getSearchHistory() {
    return (store.box<SearchHistoryItem>().query()
          ..order(SearchHistoryItem_.time, flags: Order.descending))
        .build()
        .find();
  }

  void addToSearchHistory(SearchHistoryItem searchHistoryItem) {
    store.box<SearchHistoryItem>().put(searchHistoryItem);
    clearExcessSearchHistory();
  }

  void clearExcessSearchHistory() {
    final limit = int.parse(getSettings(searchHistoryLimitSettingName)?.value ??
        searchHistoryDefaultLength);
    if (store.box<SearchHistoryItem>().count() > limit) {
      store.box<SearchHistoryItem>().removeMany(
          _getSearchHistory().skip(limit).map((e) => e.id).toList());
    }
  }

  void clearSearchHistory() {
    store.box<SearchHistoryItem>().removeAll();
  }

  void insertLogs(AppLog log) {
    store.box<AppLog>().put(log);
    EasyDebounce.debounce('log-cleaning', const Duration(seconds: 5), () {
      cleanOldLogs();
    });
  }

  void cleanOldLogs() {
    var all = store.box<AppLog>().getAll();

    List<int> ids = all.reversed.skip(maxLogs).map((e) => e.id).toList();
    store.box<AppLog>().removeMany(ids);
    log.fine("clearing ${ids.length} logs out of ${all.length}");
  }

  List<AppLog> getAppLogs() {
    return store.box<AppLog>().getAll();
  }

  List<VideoFilter> getAllFilters() {
    return store.box<VideoFilter>().getAll();
  }

  void saveFilter(VideoFilter filter) {
    store.box<VideoFilter>().put(filter);
  }

  void deleteFilter(VideoFilter filter) {
    store.box<VideoFilter>().remove(filter.id);
  }

  List<DownloadedVideo> getAllDownloads() {
    return store.box<DownloadedVideo>().getAll();
  }

  void upsertDownload(DownloadedVideo vid) {
    store.box<DownloadedVideo>().put(vid);
  }

  void deleteDownload(DownloadedVideo vid) {
    store.box<DownloadedVideo>().remove(vid.id);
  }

  DownloadedVideo? getDownloadById(int id) {
    return store.box<DownloadedVideo>().get(id);
  }

  DownloadedVideo? getDownloadByVideoId(String id) {
    return store
        .box<DownloadedVideo>()
        .query(DownloadedVideo_.videoId.equals(id))
        .build()
        .findFirst();
  }

  HistoryVideoCache? getHistoryVideoByVideoId(String videoId) {
    return store
        .box<HistoryVideoCache>()
        .query(HistoryVideoCache_.videoId.equals(videoId))
        .build()
        .findFirst();
  }

  void upsertHistoryVideo(HistoryVideoCache vid) {
    store.box<HistoryVideoCache>().put(vid);
  }

  // we only want one layout
  void upsertHomeLayout(HomeLayout layout) {
    store.box<HomeLayout>().removeAll();
    store.box<HomeLayout>().put(layout);
  }

  HomeLayout getHomeLayout() {
    var all = store.box<HomeLayout>().getAll();
    return all.firstOrNull ?? HomeLayout();
  }

  SubscriptionNotification? getLastSubscriptionNotification() {
    return store.box<SubscriptionNotification>().getAll().lastOrNull;
  }

  void setLastSubscriptionNotification(SubscriptionNotification sub) {
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

  void deleteChannelNotification(ChannelNotification notif) {
    store.box<ChannelNotification>().remove(notif.id);
  }

  void upsertChannelNotification(ChannelNotification notif) {
    store.box<ChannelNotification>().put(notif);
  }

  void setChannelNotificationLastViewedVideo(String channelId, String videoId) {
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

  void deletePlaylistNotification(PlaylistNotification notif) {
    store.box<PlaylistNotification>().remove(notif.id);
  }

  void upsertPlaylistNotification(PlaylistNotification notif) {
    store.box<PlaylistNotification>().put(notif);
  }

  void setPlaylistNotificationLastViewedVideo(
      String playlistId, int videoCount) {
    var notif = getPlaylistNotification(playlistId);
    if (notif != null) {
      notif.lastVideoCount = videoCount;
      notif.timestamp = DateTime.now().millisecondsSinceEpoch;
      upsertPlaylistNotification(notif);
    }
  }

  DeArrowCache? getDeArrowCache(String videoId) {
    return store
        .box<DeArrowCache>()
        .query(DeArrowCache_.videoId.equals(videoId))
        .build()
        .findFirst();
  }

  void upsertDeArrowCache(DeArrowCache cache) {
    store.box<DeArrowCache>().put(cache);
  }
}
