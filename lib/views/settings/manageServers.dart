import 'dart:async';
import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:invidious/globals.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../models/db/server.dart';

class ManageServers extends StatefulWidget {
  const ManageServers({super.key});

  @override
  ManageServerState createState() => ManageServerState();
}

class ManageServerState extends State<ManageServers> with AfterLayoutMixin<ManageServers> {
  List<Server> dbServers = db.getServers();

  bool isLoggedInToServer(String url) {
    Server server = dbServers.firstWhere((s) => s.url == url, orElse: () => Server('notFound'));

    return (server.authToken?.length ?? 0) > 0;
  }

  logIn(String serverUrl) async {
    String url = serverUrl + '/authorize_token?scopes=:feed&callback_url=impuc-auth://';
    final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: 'impuc-auth');

    final token = Uri.parse(result).queryParameters['token'];

    var decoded = jsonDecode(Uri.decodeComponent(token ?? ''));

    Server server  = Server(serverUrl);

    server.authToken = Uri.decodeComponent(token ?? '');

    db.updateServer(server);

    setState(() {
      dbServers = db.getServers();
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage servers'),
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
            bottom: false,
            child: SettingsList(
              sections: [
                SettingsSection(
                    title: Text('Public servers'),
                    tiles: PUBLIC_SERVERS
                        .map((s) => SettingsTile(
                              title: Text(s),
                              value: isLoggedInToServer(s) ? Text('Logged in') : Text('Not logged in, tap to log in'),
                              onPressed: (context) => logIn(s),
                            ))
                        .toList())
              ],
            )));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}
}
