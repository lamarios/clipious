import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/settings/tvManageSingleServer.dart';
import 'package:invidious/views/tv/tvButton.dart';

import '../../../controllers/serverListSettingsController.dart';
import '../../../models/db/server.dart';
import '../tvSettings.dart';

class TvManageServersInner extends StatelessWidget {
  const TvManageServersInner({Key? key}) : super(key: key);

  openServer(BuildContext context, Server s) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvManageSingleServer(
        server: s,
      ),
    ));
  }

  addServerDialog(BuildContext context, ServerListSettingsController controller) {
    var locals = AppLocalizations.of(context)!;
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
              await controller.saveServer();
              Navigator.pop(context);
            } catch (err) {
              await showTvAlertdialog(context, 'Error', [
                Text(
                  locals.invalidInvidiousServer,
                  style: const TextStyle(fontSize: 20),
                )
              ]);
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
                controller: controller.addServerController,
                autocorrect: false,
                enableSuggestions: false,
                enableIMEPersonalizedLearning: false,
              ),
              Row(
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
    return GetBuilder<ServerListSettingsController>(
        init: ServerListSettingsController(),
        builder: (_) {
          var filteredPublicServers = _.publicServers.where((s) => _.dbServers.indexWhere((element) => element.url == s.url) == -1).toList();
          return ListView(children: [
            SettingsTitle(title: locals.yourServers),
            ..._.dbServers.map((s) => SettingsTile(
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
                  title: s.url,
                  description: '${_.isLoggedInToServer(s.url) ? '${locals.loggedIn}, ' : ''} ${locals.tapToManage}',
                  onSelected: (context) => openServer(context, s),
                )),
            SettingsTile(
              title: locals.addServer,
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: colorScheme.secondary,
                ),
              ),
              onSelected: (context) => addServerDialog(context, _),
            ),
            SettingsTitle(title: locals.publicServers),
            ..._.publicServersError != PublicServerErrors.none
                ? [
                    SettingsTile(
                      onSelected: (context) => _.getPublicServers(),
                      title: locals.publicServersError,
                    )
                  ]
                : _.pinging
                    ? [
                        SettingsTile(
                          title: locals.loadingPublicServer,
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
                              title: '${s.url} - ${(s.ping != null && s.ping!.compareTo(const Duration(seconds: pingTimeout)) == -1) ? '${s.ping?.inMilliseconds}ms' : '>${pingTimeout}s'}',
                              description: '${(s.flag != null && s.region != null) ? '${s.flag} - ${s.region} - ' : ''} ${locals.tapToAddServer}',
                              onSelected: (context) => _.upsertServer(s),
                            ))
                        .toList()
          ]);
        });
  }
}
