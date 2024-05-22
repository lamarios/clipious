import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

import '../../../../videos/models/sponsor_segment_types.dart';

@RoutePage()
class TvSponsorBlockSettingsScreen extends StatelessWidget {
  const TvSponsorBlockSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          var cubit = context.read<SettingsCubit>();
          return TvOverscan(
            child: ListView(
              children: [
                SettingsTitle(
                    title: locals.sponsorBlockSettingsQuickDescription),
                ...SponsorSegmentType.values.map((t) {
                  bool value =
                      state.settings[t.settingsName()]?.value == 'true';
                  return SettingsTile(
                    trailing: Switch(value: value, onChanged: (value) {}),
                    onSelected: (context) => cubit.saveSetting(
                        SettingsValue(t.settingsName(), (!value).toString())),
                    title: SponsorSegmentType.getLabel(t, locals),
                    description: SponsorSegmentType.getDescription(t, locals),
                  );
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
