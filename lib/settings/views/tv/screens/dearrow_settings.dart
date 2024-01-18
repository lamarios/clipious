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
          var _ = settings.state;
          return TvOverscan(
            child: ListView(
              children: [
                SettingsTitle(title: locals.deArrowWarning),
                SettingsTile(
                  title: 'DeArrow',
                  description: locals.deArrowSettingDescription,
                  onSelected: (context) => settings.setDearrow(!_.dearrow),
                  trailing: Switch(onChanged: (value) {}, value: _.dearrow),
                ),
                SettingsTile(
                  title: locals.deArrowReplaceThumbnails,
                  description: locals.deArrowReplaceThumbnailsDescription,
                  onSelected: _.dearrow
                      ? (context) =>
                          settings.setDearrowThumbnails(!_.dearrowThumbnails)
                      : null,
                  trailing: Switch(
                      onChanged: _.dearrow ? (value) {} : null,
                      value: _.dearrowThumbnails),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
