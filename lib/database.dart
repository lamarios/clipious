import 'package:invidious/models/db/progress.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/models/errors/noServerSelected.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'models/db/server.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

const SELECTED_SERVER = 'selected-server';
const USE_SPONSORBLOCK = 'use-sponsor-block';
const BROWSING_COUNTRY = 'browsing-country';
const DYNAMIC_THEME = 'dynamic-theme';
const USE_DASH = 'use-dash';
const PLAYER_REPEAT = 'player-repeat';
const PLAYER_SHUFFLE = 'player-shuffle';

const ON_OPEN = "on-open";

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
      log.info('No servers selected, we try to find one');
      List<Server> servers = getServers();
      if (servers.isEmpty) {
        log.info('We don\'t have servers, we need to show the welcome screen');
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
}
