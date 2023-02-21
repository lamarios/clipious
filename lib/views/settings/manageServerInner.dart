import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:logging/logging.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../models/db/server.dart';
import '../../utils.dart';
import '../settings.dart';

const pingTimeout = 3;

class ManagerServersView extends StatefulWidget {
  const ManagerServersView({super.key});

  @override
  State<ManagerServersView> createState() => _ManagerServersViewState();
}

class _ManagerServersViewState extends State<ManagerServersView> with AfterLayoutMixin<ManagerServersView> {
  late List<Server> dbServers;
  TextEditingController addServerController = TextEditingController(text: 'https://');
  List<Server> publicServers = [];
  final log = Logger('ManagerServerView');

  bool pinging = true;

  String publicServersError = '';

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
    String url = '$serverUrl/authorize_token?scopes=:feed,:subscriptions*,:playlists*&callback_url=clipious-auth://';
    final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: 'clipious-auth');

    final token = Uri.parse(result).queryParameters['token'];

    Server? server = db.getServer(serverUrl);

    if(server != null) {
      server.authToken = Uri.decodeComponent(token ?? '');

      db.upsertServer(server);

      refreshServers();
      FBroadcast.instance().broadcast(BROADCAST_SERVER_CHANGED);
    }else{
      throw InvidiousServiceError('logging in to deleted server');
    }
  }

  refreshServers() {
    var servers = publicServers.where((s) => dbServers.indexWhere((element) => element.url == s.url) == -1).toList();

    setState(() {
      dbServers = db.getServers();
      publicServers = servers;
    });
  }

  deleteServer(BuildContext context, Server server) {
    db.deleteServer(server);
    refreshServers();

    Server currentServer = db.getCurrentlySelectedServer();
    if (currentServer.url == server.url) {
      db.deleteSetting(SELECTED_SERVER);
    }
    Navigator.pop(context);
  }

  showPublicServerActions(BuildContext context, Server server) {
    var locals = AppLocalizations.of(context)!;
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
                            db.upsertServer(server);
                            refreshServers();
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.add),
                        ),
                        Text(
                          locals.addServer,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  showServerActions(BuildContext context, Server server) {
    var locals = AppLocalizations.of(context)!;
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
                            db.useServer(server);
                            refreshServers();
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.done),
                        ),
                        Text(
                          locals.useThisServer,
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
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
                        Text(
                          locals.logIn,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: dbServers.length > 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => deleteServer(context, server),
                            icon: const Icon(Icons.delete),
                          ),
                          Text(
                            locals.delete,
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
    var locals = AppLocalizations.of(context)!;
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
      db.upsertServer(server);
      refreshServers();
      Navigator.pop(context);

      addServerController.text = 'https://';
    } else {
      await showAlertDialog(context, 'Error', [Text(locals.invalidInvidiousServer)]);
    }
  }

  addServerDialog(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(locals.addServer),
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
                            child: Text(locals.cancel),
                          ),
                          TextButton(
                            onPressed: () {
                              saveServer(context);
                            },
                            child: Text(locals.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);
    var locals = AppLocalizations.of(context)!;

    var filteredPublicServers = publicServers.where((s) => dbServers.indexWhere((element) => element.url == s.url) == -1).toList();

    return Stack(
      children: [
        SettingsList(
          lightTheme: theme,
          darkTheme: theme,
          sections: [
            SettingsSection(
                title: Text(locals.yourServers),
                tiles: dbServers.isNotEmpty
                    ? dbServers
                        .map((s) => SettingsTile(
                              leading: Icon(
                                Icons.done,
                                color: s.inUse ? colorScheme.primary : colorScheme.secondaryContainer,
                              ),
                              title: Text(s.url),
                              value: s.authToken?.isNotEmpty ?? false ? Text(locals.loggedIn) : Text(locals.notLoggedIn),
                              onPressed: (context) => showServerActions(context, s),
                            ))
                        .toList()
                    : [
                        SettingsTile(
                          title: Text(
                            locals.addServerHelpText,
                            style: const TextStyle(fontSize: 12),
                          ),
                          enabled: false,
                        )
                      ]),
            SettingsSection(
                title: Text(locals.publicServers),
                tiles: publicServersError.isNotEmpty
                    ? [
                        SettingsTile(
                          onPressed: (context) => getPublicServers(context),
                          title: Text(publicServersError),
                        )
                      ]
                    : pinging
                        ? [
                            SettingsTile(
                              title: Text(locals.loadingPublicServer),
                              leading: const SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  )),
                            )
                          ]
                        : filteredPublicServers
                            .map((s) => SettingsTile(
                                  key: Key(s.url),
                                  title: Row(
                                    children: [
                                      Expanded(child: Text('${s.url} ')),
                                      Text((s.ping != null && s.ping!.compareTo(const Duration(seconds: pingTimeout)) == -1) ? '${s.ping?.inMilliseconds}ms' : '>${pingTimeout}s',
                                          style: TextStyle(fontSize: 15, color: colorScheme.secondary))
                                    ],
                                  ),
                                  value: Row(
                                    children: [Visibility(visible: s.flag != null && s.region != null, child: Text('${s.flag} - ${s.region} - ')), Text(locals.tapToAddServer)],
                                  ),
                                  onPressed: (context) => showPublicServerActions(context, s),
                                ))
                            .toList()),
          ],
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            onPressed: () => addServerDialog(context),
            backgroundColor: colorScheme.primaryContainer,
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }

  getPublicServers(BuildContext context) async {
    var locals = AppLocalizations.of(context)!;
    setState(() {
      pinging = true;
      publicServersError = '';
    });
    try {
      var public = await service.getPublicServers();

      var servers = public.map((e) {
        var s = Server(e.uri);
        s.flag = e.flag;
        s.region = e.region;

        return s;
      }).toList();

      List<Server> pingedServers = await Future.wait(servers.map((e) async {
        e.ping = await service.pingServer(e.url).timeout(const Duration(seconds: pingTimeout), onTimeout: () => const Duration(seconds: pingTimeout));
        return e;
      }));

      pingedServers.sort((a, b) => (a.ping ?? const Duration(seconds: pingTimeout)).compareTo(b.ping ?? const Duration(seconds: pingTimeout)));

      if (context.mounted) {
        setState(() {
          pinging = false;
          publicServers = pingedServers;
          publicServersError = '';
        });
      }
    } catch (err) {
      if (context.mounted) {
        setState(() {
          publicServersError = locals.publicServersError;
        });
      }
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await getPublicServers(context);
  }
}
