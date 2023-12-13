import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

@RoutePage()
class TvAppLayoutSettingsScreen extends StatelessWidget {
  const TvAppLayoutSettingsScreen({super.key});

  toggleDataSource(BuildContext context, HomeDataSource ds) {
    var settings = context.read<SettingsCubit>();
    var current = settings.state.appLayout;
    var defaults = HomeDataSource.defaultSettings();

    // we want to keep the original order
    // so we take the existing settings, remove or add what we need
    if (current.contains(ds)) {
      current.remove(ds);
    } else {
      current.add(ds);
    }
    // use defaaults to keep original order
    settings.setAppLayout(
        defaults.where((element) => current.contains(element)).toList());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, _) {
          return TvOverscan(
            child: ListView(
                children: HomeDataSource.defaultSettings()
                    .map((e) => SettingsTile(
                          title: e.getLabel(locals),
                          onSelected: (context) => toggleDataSource(context, e),
                          trailing: Switch(
                              onChanged: (value) {},
                              value: _.appLayout.contains(e)),
                        ))
                    .toList()),
          );
        },
      ),
    );
  }
}
