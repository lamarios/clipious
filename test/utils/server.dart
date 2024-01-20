import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/server.dart';
import 'package:invidious/utils/sembast_sqflite_database.dart';

import '../globals.dart';

Future<Server> getLoggedInTestServer() async {
  var server = Server(url: localInvidiousServer);
  server.sidCookie = await service.loginWithCookies(localInvidiousServer, "test", "test");
  return server;
}

Future<void> setUpTestsForTestServer() async{
  db = await SembastSqfDb.createInMenory();
  var server = await getLoggedInTestServer();
  await db.upsertServer(server);
  await db.useServer(server);
}

Future<void> cleanUpTestServer() async {
  var server = await getLoggedInTestServer();
  await db.upsertServer(server);

  await db.useServer(server);

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

  await db.close();
}
