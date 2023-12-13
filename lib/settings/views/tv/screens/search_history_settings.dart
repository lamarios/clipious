import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

import '../../../../utils.dart';
import '../../../../utils/views/tv/components/tv_button.dart';

@RoutePage()
class TvSearchHistorySettingsScreen extends StatelessWidget {
  const TvSearchHistorySettingsScreen({super.key});

  void showClearHistoryDialog(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    showTvDialog(
        context: context,
        builder: (BuildContext context) => [
              Column(
                children: [
                  Text(locals.clearSearchHistory),
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: Text(locals.irreversibleAction),
                  )
                ],
              ),
            ],
        actions: [
          TvButton(
            onPressed: (context) {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(locals.cancel),
            ),
          ),
          TvButton(
            onPressed: (context) async {
              db.clearSearchHistory();
              Navigator.of(context).pop();
            },
            focusedColor: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(locals.ok),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, _) {
          var cubit = context.read<SettingsCubit>();
          return TvOverscan(
            child: ListView(
              children: [
                SettingsTitle(title: locals.searchHistoryDescription),
                SettingsTile(
                  title: locals.enableSearchHistory,
                  trailing: Switch(onChanged: (value) {}, value: _.useSearchHistory),
                  onSelected: (ctx) => cubit.toggleSearchHistory(!_.useSearchHistory),
                ),
                AdjustmentSettingTile(
                  title: locals.searchHistoryLimit,
                  description: locals.searchHistoryLimitDescription,
                  value: _.searchHistoryLimit,
                  onNewValue: cubit.setHistoryLimit,
                ),
                SettingsTile(
                  title: locals.clearSearchHistory,
                  onSelected: (context) => showClearHistoryDialog(context),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
