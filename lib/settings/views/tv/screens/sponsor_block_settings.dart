import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/states/sponsor_block_settings.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

import '../../../../videos/models/sponsor_segment_types.dart';

@RoutePage()
class TvSponsorBlockSettingsScreen extends StatelessWidget {
  const TvSponsorBlockSettingsScreen({Key? key}) : super(key: key);

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
