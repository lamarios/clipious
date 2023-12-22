import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/states/server_list_settings.dart';

import '../../globals.dart';
import '../../testAppCubit.dart';
import '../../utils/memorydb.dart';

void main() {
  // Setting a customer override that'll use an unmocked HTTP client
  late AppCubit app;
  setUp(() {
    db = MemoryDB();
    app = TestAppCubit(AppState.init());
  });

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
