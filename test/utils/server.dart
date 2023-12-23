import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/server.dart';

import '../globals.dart';
import 'memorydb.dart';

Future<Server> getLoggedInTestServer() async {
  var server = Server(url: localInvidiousServer);
  server.sidCookie = await service.loginWithCookies(localInvidiousServer, "test", "test");
  return server;
}

Future<void> setUpTestsForTestServer() async{
  db = MemoryDB();
  var server = await getLoggedInTestServer();
  db.upsertServer(server);
  db.useServer(server);
}

Future<void> cleanUpTestServer() async {
  var server = await getLoggedInTestServer();
  db.upsertServer(server);

  db.useServer(server);

  // removing all subscriptions
  var subs = await service.getSubscriptions();
  for (var sub in subs) {
    await service.unSubscribe(sub.authorId);
  }
  // removing all playlists
  var playlists = await service.getUserPlaylists();
  for (var pl in playlists) {
    await service.deleteUserPlaylist(pl.playlistId);
  }

  // clean history
  await service.clearUserHistory();
}
