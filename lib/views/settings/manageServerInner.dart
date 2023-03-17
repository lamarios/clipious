import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/serverListSettingsController.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/settings/manageSingleServer.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../globals.dart';
import '../../models/db/server.dart';
import '../../utils.dart';
import '../settings.dart';

class ManagerServersView extends StatelessWidget {
  const ManagerServersView({super.key});

  showPublicServerActions(BuildContext context, Server server) {
    var locals = AppLocalizations.of(context)!;
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return GetBuilder<ServerListSettingsController>(
            builder: (controller) => SizedBox(
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
                              controller.refreshServers();
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.add),
                          ),
                          Text(
                            locals.addServer,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  saveServer(BuildContext context, ServerListSettingsController controller) async {
    var locals = AppLocalizations.of(context)!;

    try {
      await controller.saveServer();
      Navigator.pop(context);

    } catch (err) {
      await showAlertDialog(context, 'Error', [Text(locals.invalidInvidiousServer)]);
    }
  }

  addServerDialog(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => GetBuilder<ServerListSettingsController>(
              builder: (controller) => Dialog(
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
                          controller: controller.addServerController,
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
                              onPressed: () async {
                                try {
                                  await controller.saveServer();
                                  Navigator.pop(context);
                                } catch (err) {
                                  await showAlertDialog(context, 'Error', [Text(locals.invalidInvidiousServer)]);
                                }
                              },
                              child: Text(locals.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  openServer(BuildContext context, Server s) {
    Navigator.push(
        context,
        MaterialPageRoute(
          settings: ROUTE_SETTINGS_MANAGE_ONE_SERVER,
          builder: (context) => ManageSingleServer(
            server: s,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<ServerListSettingsController>(
      init: ServerListSettingsController(),
      builder: (_) {
        var filteredPublicServers = _.publicServers.where((s) => _.dbServers.indexWhere((element) => element.url == s.url) == -1).toList();
        return Stack(
          children: [
            SettingsList(
              lightTheme: theme,
              darkTheme: theme,
              sections: [
                SettingsSection(
                    title: Text(locals.yourServers),
                    tiles: _.dbServers.isNotEmpty
                        ? _.dbServers
                            .map((s) => SettingsTile(
                                  leading: InkWell(
                                    onTap: () => _.switchServer(s),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.done,
                                        color: s.inUse ? colorScheme.primary : colorScheme.secondaryContainer,
                                      ),
                                    ),
                                  ),
                                  title: Text(s.url),
                                  value: Text('${_.isLoggedInToServer(s.url) ? '${locals.loggedIn}, ' : ''} ${locals.tapToManage}'),
                                  onPressed: (context) => openServer(context, s),
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
                    tiles: _.publicServersError != PublicServerErrors.none
                        ? [
                            SettingsTile(
                              onPressed: (context) => _.getPublicServers(),
                              title: Text(locals.publicServersError),
                            )
                          ]
                        : _.pinging
                            ? [
                                SettingsTile(
                                  title: Text(locals.loadingPublicServer),
                                  leading: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        value: _.publicServerProgress > 0 ? _.publicServerProgress : null,
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
      },
    );
  }
}
