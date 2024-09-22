import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/settings/views/screens/settings.dart';
import 'package:clipious/utils.dart';
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
        title: Text(locals.videoPlayer),
      ),
      body: SafeArea(child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
        var cubit = context.read<SettingsCubit>();
        return DefaultTabController(
          length: 2,
          child: SettingsList(
            lightTheme: theme,
            darkTheme: theme,
            sections: [
              SettingsSection(tiles: [
                SettingsTile.switchTile(
                  leading: const Icon(Icons.stream),
                  initialValue: state.useDash,
                  onToggle: cubit.toggleDash,
                  title: Text(locals.useDash),
                  description: Text(locals.useDashDescription),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.vpn_lock),
                  initialValue: state.useProxy,
                  onToggle: cubit.toggleProxy,
                  title: Text(locals.useProxy),
                  description: Text(locals.useProxyDescription),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.play_arrow),
                  initialValue: state.autoplayVideoOnLoad,
                  onToggle: cubit.toggleAutoplayOnLoad,
                  title: Text(locals.autoplayVideoOnLoad),
                  description: Text(locals.autoplayVideoOnLoadDescription),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.speed),
                  initialValue: state.rememberPlayBackSpeed,
                  onToggle: cubit.toggleRememberPlaybackSpeed,
                  title: Text(locals.rememberPlaybackSpeed),
                  description: Text(locals.rememberPlaybackSpeedDescription),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.dangerous),
                  title: const Text('SponsorBlock'),
                  description: Text(locals.sponsorBlockDescription),
                  onPressed: openSponsorBlockSettings,
                ),
                if (getDeviceType() == DeviceType.phone)
                  SettingsTile.switchTile(
                    leading: const Icon(Icons.stay_primary_landscape),
                    initialValue: state.fullscreenOnRotate,
                    onToggle: cubit.setFullscreenOnRotate,
                    title: Text(locals.fullscreenOnLandscape),
                    description: Text(locals.fullscreenOnLandscapeDescription),
                  ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.aspect_ratio),
                  initialValue: state.forceLandscapeFullScreen,
                  onToggle: cubit.toggleForceLandscapeFullScreen,
                  title: Text(locals.lockFullScreenToLandscape),
                  description:
                      Text(locals.lockFullScreenToLandscapeDescription),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.open_in_full),
                  initialValue: state.fillFullscreen,
                  onToggle: cubit.toggleFillFullscreen,
                  title: Text(locals.fillFullscreen),
                  description: Text(locals.fillFullscreenDescription),
                ),
              ]),
              SettingsSection(title: Text(locals.seeking), tiles: [
                SettingsTile(
                  leading: const Icon(Icons.fast_forward),
                  title: Text(locals.skipStep),
                  description: Text(locals.skipStepDescription),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () =>
                              cubit.changeSkipStep(increase: false),
                          icon: const Icon(Icons.remove)),
                      Text(state.skipStep.floor().toString()),
                      IconButton(
                          onPressed: () => cubit.changeSkipStep(increase: true),
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.moving),
                  initialValue: state.skipExponentially,
                  onToggle: cubit.setSkipExponentially,
                  title: Text(locals.exponentialSkip),
                  description: Text(locals.exponentialSkipDescription),
                ),
              ]),
              SettingsSection(title: Text(locals.subtitles), tiles: [
                SettingsTile(
                  leading: const Icon(Icons.format_size),
                  title: Text(locals.subtitleFontSize),
                  description: Text(locals.subtitleFontSizeDescription),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () =>
                              cubit.changeSubtitleSize(increase: false),
                          icon: const Icon(Icons.remove)),
                      Text(state.subtitleSize.floor().toString()),
                      IconButton(
                          onPressed: () =>
                              cubit.changeSubtitleSize(increase: true),
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.format_paint),
                  initialValue: state.subtitlesBackground,
                  onToggle: cubit.setSubtitlesBackground,
                  title: Text(locals.subtitlesBackground),
                  description: Text(locals.subtitlesBackgroundDescription),
                ),
                SettingsTile.switchTile(
                  leading: const Icon(Icons.language),
                  initialValue: state.rememberSubtitles,
                  onToggle: cubit.toggleRememberSubtitles,
                  title: Text(locals.rememberSubtitleLanguage),
                  description: Text(locals.rememberSubtitleLanguageDescription),
                ),
              ]),
            ],
          ),
        );
      })),
    );
  }
}
