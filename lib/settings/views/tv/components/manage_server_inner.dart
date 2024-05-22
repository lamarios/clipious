import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';

import '../../../models/db/server.dart';
import '../../../models/errors/cannot_add_server_error.dart';
import '../../../models/errors/missing_software_key.dart';
import '../../../models/errors/unreacheable_server.dart';
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

  addServerDialog(BuildContext context, ServerListSettingsState controller) {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<ServerListSettingsCubit>();

    FocusNode focusNode = FocusNode();
    showTvDialog(
      title: locals.addServer,
      context: context,
      actions: [
        TvButton(
          onPressed: (context) {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(locals.cancel),
          ),
        ),
        TvButton(
          onPressed: (context) async {
            try {
              await cubit.saveServer();
              if (context.mounted) {
                Navigator.pop(context);
              }
            } catch (err) {
              if (context.mounted) {
                if (err is CannotAddServerError) {
                  showTvAlertdialog(
                      context,
                      switch (err.runtimeType) {
                        (MissingSoftwareKeyError _) =>
                          locals.malformedStatsEndpoint,
                        (UnreachableServerError _) =>
                          locals.serverIsNotReachable,
                        (_) => locals.error
                      },
                      [
                        Text(
                          '${err is MissingSoftwareKeyError ? "${locals.malformedStatsEndpointDescription}\n" : ""}${err.error}',
                          maxLines: 100,
                        )
                      ]);
                } else {
                  showTvAlertdialog(context, locals.error, [
                    Text(
                      err.toString(),
                      maxLines: 100,
                    )
                  ]);
                }
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(locals.add),
          ),
        ),
      ],
      builder: (BuildContext context) => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode,
                textInputAction: TextInputAction.next,
                controller: cubit.addServerController,
                autocorrect: false,
                enableSuggestions: false,
                enableIMEPersonalizedLearning: false,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ],
          ),
        )
      ],
    );
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
          onSelected: (context) => addServerDialog(context, state),
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
