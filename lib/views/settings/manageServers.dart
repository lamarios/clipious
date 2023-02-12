import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/service.dart';
import 'package:invidious/utils.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../models/db/server.dart';
import '../settings.dart';

const pingTimeout = 5000;

class ManageServers extends StatefulWidget {
  const ManageServers({super.key});

  @override
  ManageServerState createState() => ManageServerState();
}

class ManageServerState extends State<ManageServers> with AfterLayoutMixin<ManageServers> {
  late List<Server> dbServers;
  TextEditingController addServerController = TextEditingController(text: 'https://');
  List<Server> publicServers = PUBLIC_SERVERS.map((e) => Server(e)).toList();

  bool pinging = true;

  bool isLoggedInToServer(String url) {
    Server server = dbServers.firstWhere((s) => s.url == url, orElse: () => Server('notFound'));

    return (server.authToken?.length ?? 0) > 0;
  }

  @override
  initState() {
    super.initState();
    refreshServers();
  }

  @override
  dispose() {
    addServerController.dispose();
    super.dispose();
  }

  logIn(String serverUrl) async {
    String url = serverUrl + '/authorize_token?scopes=:feed,:subscriptions*,:playlists*&callback_url=impuc-auth://';
    final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: 'clipious-auth');

    final token = Uri.parse(result).queryParameters['token'];

    Server server = Server(serverUrl);

    server.authToken = Uri.decodeComponent(token ?? '');

    db.updateServer(server);

    refreshServers();
    FBroadcast.instance().broadcast(BROADCAST_SERVER_CHANGED);
  }

  refreshServers() {
    setState(() {
      dbServers = db.getServers();
    });
  }

  deleteServer(BuildContext context, Server server) {
    db.deleteServer(server);
    refreshServers();

    Server currentServer = db.getCurrentlySelectedServer();
    if (currentServer.url == server.url) {
      db.deleteSetting(SELECTED_SERVER);
      FBroadcast.instance().broadcast(BROADCAST_SERVER_CHANGED);
    }
    Navigator.pop(context);
  }

  showServerActions(BuildContext context, Server server) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 100,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            logIn(server.url);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.person),
                        ),
                        const Text(
                          'Log in',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: server.id != -1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => deleteServer(context, server),
                            icon: const Icon(Icons.delete),
                          ),
                          const Text(
                            'Delete',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  saveServer(BuildContext context) async {
    var serverUrl = addServerController.text;
    if (serverUrl.endsWith("/")) {
      serverUrl = serverUrl.substring(0, serverUrl.length - 1);
    }

    bool isValidServer = false;
    try {
      isValidServer = await service.isValidServer(serverUrl);
    } catch (err) {
      isValidServer = false;
    }

    if (!context.mounted) return;
    if (isValidServer) {
      Server server = Server(serverUrl);
      db.addServer(server);
      refreshServers();
      Navigator.pop(context);

      addServerController.text = 'https://';
    } else {
      await showAlertDialog(context, [const Text('Invalid invidious server')]);
    }
  }

  addServerDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Add server'),
                    TextField(
                      controller: addServerController,
                      autocorrect: false,
                      enableSuggestions: false,
                      enableIMEPersonalizedLearning: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            saveServer(context);
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage servers'),
        ),
        backgroundColor: colorScheme.background,
        floatingActionButton: FloatingActionButton(
          onPressed: () => addServerDialog(context),
          backgroundColor: colorScheme.primaryContainer,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
            bottom: false,
            child: SettingsList(
              lightTheme: theme,
              darkTheme: theme,
              sections: [
                SettingsSection(
                    title: const Text('Custom servers'),
                    tiles: dbServers.isNotEmpty
                        ? dbServers
                            .map((s) => SettingsTile(
                                  title: Text(s.url),
                                  value: s.authToken?.isNotEmpty ?? false ? const Text('Logged in') : const Text('Not logged in, tap to log in'),
                                  onPressed: (context) => showServerActions(context, s),
                                ))
                            .toList()
                        : [
                            SettingsTile(
                              title: const Text(
                                'Use the + button to add your own servers',
                                style: TextStyle(fontSize: 12),
                              ),
                              enabled: false,
                            )
                          ]),
                SettingsSection(
                    title: Text('Public servers'),
                    tiles: publicServers
                        .map((s) => SettingsTile(
                              key: Key(s.url),
                              title: Row(
                                children: [
                                  Expanded(child: Text('${s.url} ')),
                                  pinging
                                      ? const SizedBox(
                                          width: 15,
                                          height: 15,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ))
                                      : Text(
                                          s.ping != null && s.ping != MAX_PING
                                              ? (s.ping ?? pingTimeout) >= pingTimeout
                                                  ? '> 5s'
                                                  : '${s.ping}ms'
                                              : '',
                                          style: TextStyle(fontSize: 15, color: colorScheme.secondary))
                                ],
                              ),
                              value: isLoggedInToServer(s.url)
                                  ? const Text('Logged in')
                                  : const Text(
                                      'Not logged in, tap to log in',
                                    ),
                              onPressed: (context) => showServerActions(context, s),
                            ))
                        .toList()),
              ],
            )));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    var servers = publicServers;
    List<Server> pingedServers = await Future.wait(servers.map((e) async {
      e.ping = await service.pingServer(e.url).timeout(const Duration(seconds: pingTimeout), onTimeout: () => pingTimeout);
      return e;
    }));

    pingedServers.sort((a, b) => (a.ping ?? MAX_PING).compareTo(b.ping ?? MAX_PING));

    setState(() {
      pinging = false;
      publicServers = pingedServers;
    });
  }
}
