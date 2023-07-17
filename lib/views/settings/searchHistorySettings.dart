import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/settingsController.dart';
import 'package:invidious/globals.dart';
import 'package:settings_ui/settings_ui.dart';

import '../settings.dart';

class SearchHistorySettings extends StatelessWidget {
  const SearchHistorySettings({Key? key}) : super(key: key);

  confirmClear(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    showDialog(
        context: context,
        useRootNavigator: false,
        useSafeArea: true,
        builder: (ctx) => SizedBox(
            height: 200,
            child: AlertDialog(title: Text(locals.clearSearchHistory), content: Text(locals.irreversibleAction), actions: [
              TextButton(
                child: Text(locals.cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(locals.ok, style: const TextStyle(color: Colors.red)),
                onPressed: () {
                  db.clearSearchHistory();
                  Navigator.of(context).pop();
                },
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return GetBuilder<SettingsController>(
      init: SettingsController(),
      global: false,
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: colorScheme.background,
              scrolledUnderElevation: 0,
              title: Text(locals.searchHistory),
            ),
            backgroundColor: colorScheme.background,
            body: SafeArea(
              bottom: false,
              child: SettingsList(lightTheme: theme, darkTheme: theme, sections: [
                SettingsSection(title: Text(locals.searchHistoryDescription), tiles: [
                  SettingsTile.switchTile(
                    initialValue: _.useSearchHistory,
                    onToggle: _.toggleSearchHistory,
                    title: Text(locals.enableSearchHistory),
                  ),
                  SettingsTile(
                    title: Text(locals.searchHistoryLimit),
                    description: Text(locals.searchHistoryLimitDescription),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () => _.useSearchHistory ? _.changeSearchHistoryLimit(increase: false) : null, icon: const Icon(Icons.remove)),
                        Text(_.searchHistoryLimit.toString()),
                        IconButton(onPressed: () => _.useSearchHistory ? _.changeSearchHistoryLimit(increase: true) : null, icon: const Icon(Icons.add)),
                      ],
                    ),
                  ),
                  SettingsTile(
                    title: Text(locals.clearSearchHistory),
                    onPressed: (context) => confirmClear(context),
                  )
                ])
              ]),
            ));
      },
    );
  }
}
