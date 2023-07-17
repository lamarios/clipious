import 'package:easy_debounce/easy_debounce.dart';
import 'package:invidious/controllers/settingsController.dart';
import 'package:invidious/models/db/progress.dart';
import 'package:invidious/models/db/searchHistoryItem.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/models/errors/noServerSelected.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'models/db/appLog.dart';
import 'models/db/server.dart';
import 'models/db/videoFilter.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

const SELECTED_SERVER = 'selected-server';
const USE_SPONSORBLOCK = 'use-sponsor-block';
const SPONSOR_BLOCK_PREFIX = 'sponsor-block-';
const BROWSING_COUNTRY = 'browsing-country';
const DYNAMIC_THEME = 'dynamic-theme';
const USE_DASH = 'use-dash';
const PLAYER_REPEAT = 'player-repeat';
const PLAYER_SHUFFLE = 'player-shuffle';
const PLAYER_AUTOPLAY_ON_LOAD = 'player-autoplay-on-load';
const PLAY_RECOMMENDED_NEXT = 'play-recommended-next';
const USE_PROXY = 'use-proxy';
const USE_RETURN_YOUTUBE_DISLIKE = 'use-return-youtube-dislike';
const BLACK_BACKGROUND = 'black-background';
const SUBTITLE_SIZE = 'subtitles-size';
const REMEMBER_LAST_SUBTITLE = 'remember-last-subtitle';
const LAST_SUBTITLE = 'last-subtitle';
const SKIP_SSL_VERIFICATION = 'skip-ssl-verification';
const THEME_MODE = 'theme-mode';
const LOCALE = 'locale';
const USE_SEARCH_HISTORY = 'use-search-history';
const SEARCH_HISTORY_LIMIT = 'search-history-limit';
const HIDE_FILTERED_VIDEOS = 'hide-filtered-videos';
const REMEMBER_PLAYBACK_SPEED = 'remember-playback-speed';
const LAST_SPEED = 'last-speed';
const LOCK_ORIENTATION_FULLSCREEN = 'lock-orientation-fullscreen';

const ON_OPEN = "on-open";

const MAX_LOGS = 1000;

class DbClient {
  /// The Store of this app.
  late final Store store;
  final log = Logger('DbClient');

  DbClient._create(this.store) {}

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<DbClient> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "impuc-data"));
    return DbClient._create(store);
  }

  Server? getServer(String url) {
    return store.box<Server>().query(Server_.url.equals(url)).build().findFirst();
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

  deleteSetting(String name) {
    SettingsValue? settings = getSettings(name);
    if (settings != null) {
      store.box<SettingsValue>().remove(settings.id);
    }
  }

  SettingsValue? getSettings(String name) {
    return store.box<SettingsValue>().query(SettingsValue_.name.equals(name)).build().findFirst();
  }

  Server getCurrentlySelectedServer() {
    Server? server = store.box<Server>().query(Server_.inUse.equals(true)).build().findFirst();

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
    return (currentlySelectedServer.authToken?.isNotEmpty ?? false) || (currentlySelectedServer.sidCookie?.isNotEmpty ?? false);
  }

  double getVideoProgress(String videoId) {
    return store.box<Progress>().query(Progress_.videoId.equals(videoId)).build().findFirst()?.progress ?? 0;
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
    return (store.box<SearchHistoryItem>().query()..order(SearchHistoryItem_.time, flags: Order.descending)).build().find();
  }

  void addToSearchHistory(SearchHistoryItem searchHistoryItem) {
    store.box<SearchHistoryItem>().put(searchHistoryItem);
    clearExcessSearchHistory();
  }

  void clearExcessSearchHistory() {
    final limit = int.parse(getSettings(SEARCH_HISTORY_LIMIT)?.value ?? searchHistoryDefaultLength);
    if (store.box<SearchHistoryItem>().count() > limit) {
      store.box<SearchHistoryItem>().removeMany(_getSearchHistory().skip(limit).map((e) => e.id).toList());
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

    List<int> ids = all.reversed.skip(MAX_LOGS).map((e) => e.id).toList();
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
}
