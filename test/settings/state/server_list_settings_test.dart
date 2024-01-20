import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/settings/states/server_list_settings.dart';
import 'package:invidious/utils/sembast_sqflite_database.dart';

import '../../globals.dart';
import '../../test_app_cubit.dart';

void main() {
  // Setting a customer override that'll use an unmocked HTTP client
  late AppCubit app;
  setUp(() async {
    db = await SembastSqfDb.createInMenory();
    app = TestAppCubit(AppState(0, null, HomeLayout()));
    await app.initState();
  });

  tearDown(() async => await db.close());

  test('save public servers', () async {
    final servers = ServerListSettingsCubit(const ServerListSettingsState(dbServers: [], publicServers: []), app);
    await servers.getPublicServers();
    expect(servers.state.publicServers.isEmpty, false);
    var publicServerCount = servers.state.publicServers.length;

    // adding server to selected servers
    servers.upsertServer(servers.state.publicServers.first);
    expect(servers.state.publicServers.length, publicServerCount - 1);
  });

  test('adding own server', () async {
    final servers = ServerListSettingsCubit(const ServerListSettingsState(dbServers: [], publicServers: []), app);
    servers.addServerController.text = localInvidiousServer;
    await servers.saveServer();
    expect(servers.state.dbServers.length, 1);
    expect(servers.isLoggedInToServer(localInvidiousServer), false);
  });
}
