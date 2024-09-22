import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/states/settings.dart';

import '../../../models/db/server.dart';
import '../../../states/server_list_settings.dart';
import '../screens/settings.dart';

class TvManageServersInner extends StatelessWidget {
  const TvManageServersInner({super.key});

  openServer(BuildContext context, Server s) {
    var cubit = context.read<ServerListSettingsCubit>();
    AutoRouter.of(context)
        .push(TvManageSingleServerRoute(server: s))
        .then((value) => cubit.refreshServers());
  }

  addServer(BuildContext context) async {
    var cubit = context.read<ServerListSettingsCubit>();
    final server = await AutoRouter.of(context).push(const TvAddServerRoute());
    if (server != null && server is Server && context.mounted) {
      cubit.saveServer(server);
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    return BlocBuilder<ServerListSettingsCubit, ServerListSettingsState>(
        builder: (context, state) {
      var cubit = context.read<ServerListSettingsCubit>();
      var settings = context.watch<SettingsCubit>();
      var filteredPublicServers = state.publicServers
          .where((s) =>
              state.dbServers.indexWhere((element) => element.url == s.url) ==
              -1)
          .toList();
      return ListView(children: [
        SettingsTile(
          title: locals.skipSslVerification,
          description: locals.skipSslVerification,
          onSelected: (context) => settings
              .toggleSslVerification(!settings.state.skipSslVerification),
          trailing: Switch(
              onChanged: (value) {}, value: settings.state.skipSslVerification),
        ),
        SettingsTitle(title: locals.yourServers),
        ...state.dbServers.map((s) => SettingsTile(
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
              title: s.url,
              description:
                  '${cubit.isLoggedInToServer(s.url) ? '${locals.loggedIn}, ' : ''} ${locals.tapToManage}',
              onSelected: (context) => openServer(context, s),
            )),
        SettingsTile(
          title: locals.addServer,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              color: colorScheme.secondary,
            ),
          ),
          onSelected: (context) => addServer(context),
        ),
        SettingsTitle(title: locals.publicServers),
        ...state.publicServersError != PublicServerErrors.none
            ? [
                SettingsTile(
                  onSelected: (context) => cubit.getPublicServers(),
                  title: locals.publicServersError,
                )
              ]
            : state.pinging
                ? [
                    SettingsTile(
                      title: locals.loadingPublicServer,
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
                : filteredPublicServers
                    .map((s) => SettingsTile(
                          key: Key(s.url),
                          title:
                              '${s.url} - ${(s.ping != null && s.ping!.compareTo(const Duration(seconds: pingTimeout)) == -1) ? '${s.ping?.inMilliseconds}ms' : '>${pingTimeout}s'}',
                          description:
                              '${(s.flag != null && s.region != null) ? '${s.flag} - ${s.region} - ' : ''} ${locals.tapToAddServer}',
                          onSelected: (context) => cubit.upsertServer(s),
                        ))
                    .toList()
      ]);
    });
  }
}
