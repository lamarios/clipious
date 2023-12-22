import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/server.dart';
import 'package:invidious/settings/states/server_settings.dart';

import '../../globals.dart';
import '../../testAppCubit.dart';
import '../../utils/memorydb.dart';

main() {
  // Setting a customer override that'll use an unmocked HTTP client
  late AppCubit app;
  setUp(() {
    db = MemoryDB();
    app = TestAppCubit(AppState.init());
  });

  test('test server setting', () async {
    var server = ServerSettingsCubit(Server(url: localInvidiousServer), app);
    server.useServer(true);

    await server.logInWithCookie("test", "test");
    expect(server.state.sidCookie != null, true);

    // test deleting the server from db
    expect(db.getServers().length, 1);
    server.deleteServer();
    // we can't delete a server if there's only one
    expect(db.getServers().length, 1);

    db.upsertServer(Server(url: localInvidiousServer));
    expect(db.getServers().length, 2);
    server.deleteServer();
    expect(db.getServers().length, 1);
  });
}
