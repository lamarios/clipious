import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/settings/models/db/settings.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/videos/models/sponsor_segment_types.dart';
import 'package:settings_ui/settings_ui.dart';

import 'settings.dart';

@RoutePage()
class SponsorBlockSettingsScreen extends StatelessWidget {
  const SponsorBlockSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        var cubit = context.read<SettingsCubit>();
        return Scaffold(
            appBar: AppBar(
              title: const Text('SponsorBlock'),
            ),
            backgroundColor: colorScheme.surface,
            body: SafeArea(
              bottom: false,
              child:
                  SettingsList(lightTheme: theme, darkTheme: theme, sections: [
                SettingsSection(
                    title: Text(locals.sponsorBlockSettingsQuickDescription),
                    tiles: SponsorSegmentType.values
                        .map((t) => SettingsTile.switchTile(
                              initialValue:
                                  state.settings[t.settingsName()]?.value ==
                                      'true',
                              onToggle: (bool value) => cubit.saveSetting(
                                  SettingsValue(
                                      t.settingsName(), value.toString())),
                              title:
                                  Text(SponsorSegmentType.getLabel(t, locals)),
                              description: Text(
                                  SponsorSegmentType.getDescription(t, locals)),
                            ))
                        .toList()),
              ]),
            ));
      },
    );
  }
}
