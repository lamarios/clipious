import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/sponsorBlockSettingsController.dart';
import 'package:invidious/models/sponsorSegmentTypes.dart';
import 'package:settings_ui/settings_ui.dart';

import '../components/miniPlayerAware.dart';
import '../settings.dart';

class SponsorBlockSettings extends StatelessWidget {
  const SponsorBlockSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return GetBuilder<SponsorBlockSettingsController>(
      init: SponsorBlockSettingsController(),
      global: false,
      builder: (_) {
        return MiniPlayerAware(
          child: Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                title: const Text('SponsorBlock'),
              ),
              backgroundColor: colorScheme.background,
              body: SafeArea(
                bottom: false,
                child: SettingsList(lightTheme: theme, darkTheme: theme, sections: [
                  SettingsSection(
                      title: Text(locals.sponsorBlockSettingsQuickDescription),
                      tiles: SponsorSegmentType.values
                          .map((t) => SettingsTile.switchTile(
                                initialValue: _.value(t),
                                onToggle: (bool value) => _.setValue(t, value),
                                title: Text(SponsorSegmentType.getLabel(t, locals)),
                                description: Text(SponsorSegmentType.getDescription(t, locals)),
                              ))
                          .toList()),
                ]),
              )),
        );
      },
    );
  }
}
