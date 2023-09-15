import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:settings_ui/settings_ui.dart';


@RoutePage()
class VideoPlayerSettingsScreen extends StatelessWidget {
  const VideoPlayerSettingsScreen({super.key});

  openSponsorBlockSettings(BuildContext context) {
    AutoRouter.of(context).push(const SponsorBlockSettingsRoute());
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        title: Text(locals.videoPlayer),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(child: BlocBuilder<SettingsCubit, SettingsState>(builder: (context, _) {
        var cubit = context.read<SettingsCubit>();
        return DefaultTabController(
          length: 2,
          child: SettingsList(
            lightTheme: theme,
            darkTheme: theme,
            sections: [
              SettingsSection(tiles: [
                SettingsTile.switchTile(
                  initialValue: _.useDash,
                  onToggle: cubit.toggleDash,
                  title: Text(locals.useDash),
                  description: Text(locals.useDashDescription),
                ),
                SettingsTile.switchTile(
                  initialValue: _.useProxy,
                  onToggle: cubit.toggleProxy,
                  title: Text(locals.useProxy),
                  description: Text(locals.useProxyDescription),
                ),
                SettingsTile.switchTile(
                  initialValue: _.autoplayVideoOnLoad,
                  onToggle: cubit.toggleAutoplayOnLoad,
                  title: Text(locals.autoplayVideoOnLoad),
                  description: Text(locals.autoplayVideoOnLoadDescription),
                ),
                SettingsTile(
                  title: Text(locals.subtitleFontSize),
                  description: Text(locals.subtitleFontSizeDescription),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () => cubit.changeSubtitleSize(increase: false), icon: const Icon(Icons.remove)),
                      Text(_.subtitleSize.floor().toString()),
                      IconButton(
                          onPressed: () => cubit.changeSubtitleSize(increase: true), icon: const Icon(Icons.add)),
                    ],
                  ),
                ),
                SettingsTile.switchTile(
                  initialValue: _.rememberSubtitles,
                  onToggle: cubit.toggleRememberSubtitles,
                  title: Text(locals.rememberSubtitleLanguage),
                  description: Text(locals.rememberSubtitleLanguageDescription),
                ),
                SettingsTile.switchTile(
                  initialValue: _.rememberPlayBackSpeed,
                  onToggle: cubit.toggleRememberPlaybackSpeed,
                  title: Text(locals.rememberPlaybackSpeed),
                  description: Text(locals.rememberPlaybackSpeedDescription),
                ),
                SettingsTile.navigation(
                  title: const Text('SponsorBlock'),
                  description: Text(locals.sponsorBlockDescription),
                  onPressed: openSponsorBlockSettings,
                ),
                SettingsTile.switchTile(
                  initialValue: _.forceLandscapeFullScreen,
                  onToggle: cubit.toggleForceLandscapeFullScreen,
                  title: Text(locals.lockFullScreenToLandscape),
                  description: Text(locals.lockFullScreenToLandscapeDescription),
                ),
                SettingsTile.switchTile(
                  initialValue: _.fillFullscreen,
                  onToggle: cubit.toggleFillFullscreen,
                  title: Text(locals.fillFullscreen),
                  description: Text(locals.fillFullscreenDescription),
                ),
              ]),
            ],
          ),
        );
      })),
    );
  }
}
