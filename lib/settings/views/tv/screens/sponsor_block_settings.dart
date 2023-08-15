import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/settings/states/sponsor_block_settings.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';

import '../../../../models/sponsorSegmentTypes.dart';

class TvSponsorBlockSettings extends StatelessWidget {
  const TvSponsorBlockSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocProvider(
        create: (context) => SponsorBlockCubit(0),
        child: BlocBuilder<SponsorBlockCubit, int>(
          builder: (context, _) {
            var cubit = context.read<SponsorBlockCubit>();
            return TvOverscan(
              child: ListView(
                children: [
                  SettingsTitle(title: locals.sponsorBlockSettingsQuickDescription),
                  ...SponsorSegmentType.values.map((t) => SettingsTile(
                        trailing: Switch(value: cubit.value(t), onChanged: (value) {}),
                        onSelected: (context) => cubit.setValue(t, !cubit.value(t)),
                        title: SponsorSegmentType.getLabel(t, locals),
                        description: SponsorSegmentType.getDescription(t, locals),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
