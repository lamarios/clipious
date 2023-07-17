import 'package:fbroadcast/fbroadcast.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/serverListSettingsController.dart';
import 'package:invidious/controllers/settingsController.dart';

import '../database.dart';
import '../globals.dart';
import '../models/db/server.dart';

class ServerSettingsController extends GetxController {
  late Server server;

  bool get canDelete => db.getServers().length > 1;

  ServerSettingsController(this.server);

  useServer(bool value) {
    db.useServer(server);
    server.inUse = true;
    update();
    refreshServerList();
    SettingsController.to()?.serverChanged();
  }

  void logOut() {
    Server s = server;
    s.sidCookie = null;
    s.authToken = null;
    db.upsertServer(server);
    server = s;
    update();
    refreshServerList();
  }

  Future<void> logInWithToken() async {
    await service.logIn(server.url);
    server = db.getServer(server.url)!;
    update();
    refreshServerList();
  }

  Future<void> logInWithCookie(String username, String password) async {
    print('login with $username, $password');
    String cookie =
        await service.loginWithCookies(server.url, username, password);

    server.sidCookie = cookie;
    db.upsertServer(server);
    FBroadcast.instance().broadcast(BROADCAST_SERVER_CHANGED);
    refreshServerList();
    update();
  }

  refreshServerList() {
    ServerListSettingsController.to()?.refreshServers();
    SettingsController.to()?.serverChanged();
  }

  deleteServer() {
    db.deleteServer(server);
    // widget.refreshServers();

    Server currentServer = db.getCurrentlySelectedServer();
    if (currentServer.url == server.url) {
      db.deleteSetting(SELECTED_SERVER);
    }
    update();
    refreshServerList();
    // Navigator.pop(context);
  }
}
