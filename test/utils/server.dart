import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/server.dart';

import '../globals.dart';

Future<Server> getLoggedInTestServer() async {
  var server = Server(url: localInvidiousServer);
  server.sidCookie = await service.loginWithCookies(localInvidiousServer, "test", "test");
  return server;
}