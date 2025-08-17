import 'package:auto_route/auto_route.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/models/errors/cannot_add_server_error.dart';
import 'package:clipious/settings/models/errors/missing_software_key.dart';
import 'package:clipious/settings/models/errors/unreacheable_server.dart';
import 'package:clipious/settings/states/server_list_settings.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../utils.dart';
import '../../models/db/server.dart';
import '../screens/settings.dart';

class ManagerServersView extends StatelessWidget {
  final bool fromWizard;

  const ManagerServersView({super.key, this.fromWizard = false});

  showPublicServerActions(
      BuildContext context, ServerListSettingsState controller, Server server) {
    var locals = AppLocalizations.of(context)!;
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

  saveServer(BuildContext context) async {
    ServerListSettingsCubit cubit = context.read<ServerListSettingsCubit>();
    _serverServerHandling(context, cubit);
  }

  _serverServerHandling(
      BuildContext context, ServerListSettingsCubit cubit) async {
    var locals = AppLocalizations.of(context)!;
    try {
      // await cubit.saveServer();
      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (err) {
      if (context.mounted) {
        if (err is CannotAddServerError) {
          showAlertDialog(
              context,
              switch (err.runtimeType) {
                (MissingSoftwareKeyError _) => locals.malformedStatsEndpoint,
                (UnreachableServerError _) => locals.serverIsNotReachable,
                (_) => locals.error
              },
              [
                SelectableText(
                  '${err is MissingSoftwareKeyError ? "${locals.malformedStatsEndpointDescription}\n" : ""}${err.error}',
                  minLines: 1,
                  maxLines: 100,
                )
              ]);
        } else {
          showAlertDialog(context, locals.error, [
            SelectableText(
              err.toString(),
              maxLines: 100,
            )
          ]);
        }
      }
    }
  }

  openServer(BuildContext context, Server s) {
    var cubit = context.read<ServerListSettingsCubit>();
    AutoRouter.of(context)
        .push(ManageSingleServerRoute(server: s))
        .then((value) => cubit.refreshServers());
  }

  addServer(BuildContext context) async {
    var cubit = context.read<ServerListSettingsCubit>();
    final server = await AutoRouter.of(context).push(const AddServerRoute());
    if (server != null && server is Server && context.mounted) {
      cubit.saveServer(server);
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);
    var locals = AppLocalizations.of(context)!;

    return BlocBuilder<ServerListSettingsCubit, ServerListSettingsState>(
      builder: (ctx, state) {
        SettingsCubit settings = context.watch<SettingsCubit>();
        ServerListSettingsCubit cubit = context.read<ServerListSettingsCubit>();
        return Stack(
          children: [
            SettingsList(
              lightTheme: theme,
              darkTheme: theme,
              sections: [
                SettingsSection(
                  tiles: [
                    SettingsTile.switchTile(
                      title: Text(locals.skipSslVerification),
                      description: Text(locals.skipSslVerificationDescription),
                      initialValue: settings.state.skipSslVerification,
                      onToggle: settings.toggleSslVerification,
                    )
                  ],
                ),
                SettingsSection(
                    title: Text(locals.yourServers),
                    tiles: state.dbServers.isNotEmpty
                        ? state.dbServers
                            .map((s) => SettingsTile(
                                  leading: InkWell(
                                    onTap: () => cubit.switchServer(s),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.done,
                                        color: s.inUse
                                            ? colorScheme.primary
                                            : colorScheme.secondaryContainer,
                                      ),
                                    ),
                                  ),
                                  title: Text(s.url),
                                  value: Text(
                                      '${cubit.isLoggedInToServer(s.url) ? '${locals.loggedIn}, ' : ''} ${locals.tapToManage}'),
                                  onPressed: (context) =>
                                      openServer(context, s),
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
/*
                SettingsSection(
                    title: Text(locals.publicServers),
                    tiles: state.publicServersError != PublicServerErrors.none
                        ? [
                            SettingsTile(
                              onPressed: (context) => cubit.getPublicServers(),
                              title: Text(locals.publicServersError),
                            )
                          ]
                        : state.pinging
                            ? [
                                SettingsTile(
                                  title: Text(locals.loadingPublicServer),
                                  leading: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        value: state.publicServerProgress > 0
                                            ? state.publicServerProgress
                                            : null,
                                      )),
                                )
                              ]
                            : (filteredPublicServers.isEmpty
                                ? [
                                    SettingsTile(
                                      title: Text(locals.noPublicServers),
                                      description: Text(locals.tapToSeeHow),
                                      leading: const Icon(
                                          Icons.warning_amber_outlined),
                                      onPressed: (context) {
                                        launchUrl(
                                            Uri.parse(
                                                'https://docs.invidious.io/installation/'),
                                            mode:
                                                LaunchMode.externalApplication);
                                      },
                                    )
                                  ]
                                : filteredPublicServers
                                    .map((s) => SettingsTile(
                                          key: Key(s.url),
                                          title: Row(
                                            children: [
                                              Expanded(
                                                  child: Text('${s.url} ')),
                                              Text(
                                                  (s.ping != null &&
                                                          s.ping!.compareTo(
                                                                  const Duration(
                                                                      seconds:
                                                                          pingTimeout)) ==
                                                              -1)
                                                      ? '${s.ping?.inMilliseconds}ms'
                                                      : '>${pingTimeout}s',
                                                  style: textTheme.labelLarge
                                                      ?.copyWith(
                                                          color: colorScheme
                                                              .secondary))
                                            ],
                                          ),
                                          value: Wrap(
                                            children: [
                                              Visibility(
                                                  visible: s.flag != null &&
                                                      s.region != null,
                                                  child: Text(
                                                      '${s.flag} - ${s.region} - ')),
                                              Text(locals.tapToAddServer)
                                            ],
                                          ),
                                          onPressed: (context) =>
                                              showPublicServerActions(
                                                  context, state, s),
                                        ))
                                    .toList())),
*/
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () => addServer(context),
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
