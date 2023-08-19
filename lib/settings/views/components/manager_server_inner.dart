import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/settings/states/server_list_settings.dart';
import 'package:invidious/settings/views/screens/manage_single_server.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../utils.dart';
import '../../models/db/server.dart';
import '../screens/settings.dart';

class ManagerServersView extends StatelessWidget {
  const ManagerServersView({super.key});

  showPublicServerActions(BuildContext context, ServerListSettingsState controller, Server server) {
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    ServerListSettingsCubit cubit = context.read<ServerListSettingsCubit>();

    showModalBottomSheet<void>(
        showDragHandle: true,
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
                        IconButton.filledTonal(
                          onPressed: () {
                            cubit.upsertServer(server);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.add),
                        ),
                        Text(
                          locals.addServer,
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

  saveServer(BuildContext context, ServerListSettingsState controller) async {
    var locals = AppLocalizations.of(context)!;
    ServerListSettingsCubit cubit = context.read<ServerListSettingsCubit>();

    try {
      await cubit.saveServer();
      Navigator.pop(context);
    } catch (err) {
      await showAlertDialog(context, 'Error', [Text(locals.invalidInvidiousServer)]);
    }
  }

  addServerDialog(BuildContext context) {
    ServerListSettingsCubit cubit = context.read<ServerListSettingsCubit>();
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
                        controller: cubit.state.addServerController,
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
                                await cubit.saveServer();
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
            ));
  }

  openServer(BuildContext context, Server s) {
    var cubit = context.read<ServerListSettingsCubit>();
    navigatorKey.currentState
        ?.push(MaterialPageRoute(
          settings: ROUTE_SETTINGS_MANAGE_ONE_SERVER,
          builder: (context) => ManageSingleServer(
            server: s,
          ),
        ))
        .then((value) => cubit.refreshServers());
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ServerListSettingsCubit, ServerListSettingsState>(
      builder: (ctx, _) {
        ServerListSettingsCubit cubit = context.read<ServerListSettingsCubit>();
        var app = context.read<AppCubit>();
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
                                    onTap: () => cubit.switchServer(s),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.done,
                                        color: s.url == app.state.server?.url ? colorScheme.primary : colorScheme.secondaryContainer,
                                      ),
                                    ),
                                  ),
                                  title: Text(s.url),
                                  value: Text('${cubit.isLoggedInToServer(s.url) ? '${locals.loggedIn}, ' : ''} ${locals.tapToManage}'),
                                  onPressed: (context) => openServer(context, s),
                                ))
                            .toList()
                        : [
                            SettingsTile(
                              title: Text(
                                locals.addServerHelpText,
                              ),
                              enabled: false,
                            )
                          ]),
                SettingsSection(
                    title: Text(locals.publicServers),
                    tiles: _.publicServersError != PublicServerErrors.none
                        ? [
                            SettingsTile(
                              onPressed: (context) => cubit.getPublicServers(),
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
                                              style: textTheme.labelLarge?.copyWith(color: colorScheme.secondary))
                                        ],
                                      ),
                                      value: Row(
                                        children: [Visibility(visible: s.flag != null && s.region != null, child: Text('${s.flag} - ${s.region} - ')), Text(locals.tapToAddServer)],
                                      ),
                                      onPressed: (context) => showPublicServerActions(context, _, s),
                                    ))
                                .toList()),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () => addServerDialog(ctx),
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
