import 'package:flutter_test/flutter_test.dart';
import 'package:clipious/app/states/app.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/home/models/db/home_layout.dart';
import 'package:clipious/settings/states/server_list_settings.dart';
import 'package:clipious/utils/sembast_sqflite_database.dart';

import '../../globals.dart';
import '../../test_app_cubit.dart';

void main() {
  // Setting a customer override that'll use an unmocked HTTP client
  late AppCubit app;
  setUp(() async {
    db = await SembastSqfDb.createInMemory();
    app = TestAppCubit(AppState(0, null, HomeLayout()));
    await app.initState();
  });

  tearDown(() async => await db.close());

  test('save public servers', () async {
    final servers = ServerListSettingsCubit(const ServerListSettingsState(dbServers: [], publicServers: []), app);
    await servers.getPublicServers();
    await servers.refreshServers();
    expect(servers.state.publicServers.isEmpty, false);
    var publicServerCount = servers.state.publicServers.length;

    // adding server to selected servers
    await servers.upsertServer(servers.state.publicServers.first);
    expect(servers.state.publicServers.length, publicServerCount - 1);
  });

  test('adding own server', () async {
    final servers = ServerListSettingsCubit(const ServerListSettingsState(dbServers: [], publicServers: []), app);
    await servers.refreshServers();
    servers.addServerController.text = localInvidiousServer;
    await servers.saveServer();
    expect(servers.state.dbServers.length, 1);
    expect(servers.isLoggedInToServer(localInvidiousServer), false);
  });

  test('switching server', () async {
    final servers = ServerListSettingsCubit(const ServerListSettingsState(dbServers: [], publicServers: []), app);
    await servers.getPublicServers();
    await servers.refreshServers();
    expect(servers.state.publicServers.isEmpty, false);
    var publicServerCount = servers.state.publicServers.length;

    var s1 = servers.state.publicServers[0];
    var s2 = servers.state.publicServers[1];
    await servers.upsertServer(s1);
    await servers.upsertServer(s2);

    expect(servers.state.publicServers.length, publicServerCount - 2);

    await servers.switchServer(s1);
    var inUse = await db.getCurrentlySelectedServer();
    expect(inUse.url, s1.url);
    var inUseCount = servers.state.dbServers.where((element) => element.inUse == true).length;
    expect(inUseCount, 1);
    expect(app.state.server?.url, s1.url);

    await servers.switchServer(s2);
    inUse = await db.getCurrentlySelectedServer();
    expect(inUse.url, s2.url);
    inUseCount = servers.state.dbServers.where((element) => element.inUse == true).length;
    expect(inUseCount, 1);
    expect(app.state.server?.url, s2.url);
  });
}
