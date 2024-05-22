import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

@RoutePage()
class TvDearrowSettingsScreen extends StatelessWidget {
  const TvDearrowSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    return Scaffold(
      body: Builder(
        builder: (context) {
          var settings = context.watch<SettingsCubit>();
          var state = settings.state;
          return TvOverscan(
            child: ListView(
              children: [
                SettingsTitle(title: locals.deArrowWarning),
                SettingsTile(
                  title: 'DeArrow',
                  description: locals.deArrowSettingDescription,
                  onSelected: (context) => settings.setDearrow(!state.dearrow),
                  trailing: Switch(onChanged: (value) {}, value: state.dearrow),
                ),
                SettingsTile(
                  title: locals.deArrowReplaceThumbnails,
                  description: locals.deArrowReplaceThumbnailsDescription,
                  onSelected: state.dearrow
                      ? (context) => settings
                          .setDearrowThumbnails(!state.dearrowThumbnails)
                      : null,
                  trailing: Switch(
                      onChanged: state.dearrow ? (value) {} : null,
                      value: state.dearrowThumbnails),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
