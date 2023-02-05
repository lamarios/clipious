import 'package:invidious/globals.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'models/db/server.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

const SELECTED_SERVER = 'selected-server';

class DbClient {
  /// The Store of this app.
  late final Store store;

  DbClient._create(this.store) {}

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<DbClient> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "impuc-data"));
    return DbClient._create(store);
  }

  addServer(Server server) {
    store.box<Server>().put(server);
  }

  Server? getServer(String url) {
    return store.box<Server>().query(Server_.url.equals(url)).build().findFirst();
  }

  updateServer(Server server) {
    store.box<Server>().put(server, mode: PutMode.update);
  }

  List<Server> getServers() {
    return store.box<Server>().getAll();
  }

  saveSetting(SettingsValue setting) {
    store.box<SettingsValue>().put(setting, mode: PutMode.put);
  }

  SettingsValue? getSettings(String name) {
    return store.box<SettingsValue>().query(SettingsValue_.name.equals(name)).build().findFirst();
  }

  Server getCurrentlySelectedServer() {
    SettingsValue? value = getSettings(SELECTED_SERVER);
    if (value != null) {
      Server? server = getServer(value.value);
      return server ?? Server(PUBLIC_SERVERS[0]);
    } else {
      return Server(PUBLIC_SERVERS[0]);
    }
  }
}
