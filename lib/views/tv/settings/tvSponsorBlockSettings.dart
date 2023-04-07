import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/sponsorBlockSettingsController.dart';
import 'package:invidious/views/tv/tvSettings.dart';

import '../../../models/sponsorSegmentTypes.dart';

class TvSponsorBlockSettings extends StatelessWidget {
  const TvSponsorBlockSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    return Scaffold(
      body: GetBuilder<SponsorBlockSettingsController>(
        init: SponsorBlockSettingsController(),
        global: false,
        builder: (_) => Padding(
            padding: EdgeInsets.all(40),
            child: ListView(
              children: [
                SettingsTitle(title: locals.sponsorBlockSettingsQuickDescription),
                ...SponsorSegmentType.values.map((t) => SettingsTile(
                      trailing: Switch(value: _.value(t), onChanged: (value) {}),
                      onSelected: (context) => _.setValue(t, !_.value(t)),
                      title: SponsorSegmentType.getLabel(t, locals),
                      description: SponsorSegmentType.getDescription(t, locals),
                    ))
              ],
            )),
      ),
    );
  }
}
