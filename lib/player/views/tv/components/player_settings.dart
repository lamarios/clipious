import 'package:clipious/player/states/player.dart';
import 'package:clipious/player/states/tv_player_controls.dart';
import 'package:clipious/player/states/tv_player_settings.dart';
import 'package:clipious/player/states/video_player.dart';
import 'package:clipious/player/views/tv/components/sleep_timer.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/utils/views/tv/components/tv_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TvPlayerSettings extends StatelessWidget {
  const TvPlayerSettings({super.key});

  List<Widget> getContent(BuildContext context) {
    var cubit = context.read<TvPlayerSettingsCubit>();
    var player = context.read<PlayerCubit>();

    var locals = AppLocalizations.of(context)!;

    switch (cubit.state.selected) {
      case Tabs.video:
        return cubit.videoTrackNames
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: cubit.changeVideoTrack,
                ))
            .toList();
      case Tabs.audio:
        return cubit.audioTrackNames
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: cubit.changeChangeAudioTrack,
                ))
            .toList();
      case Tabs.captions:
        return cubit.availableCaptions
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: cubit.changeSubtitles,
                ))
            .toList();
      case Tabs.playbackSpeed:
        return tvAvailablePlaybackSpeeds
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: cubit.changePlaybackSpeed,
                ))
            .toList();
      case Tabs.sleepTimer:
        return [
          player.state.hasTimer
              ? TvSettingButton(
                  label: locals.cancelSleepTimer,
                  onPressed: (selected) {
                    player.cancelSleep();
                    context.read<TvPlayerControlsCubit>().hideSettings();
                  })
              : TvSleepTimer(
                  onSet: (sleepTimer) {
                    player.sleep(sleepTimer!);
                    context.read<TvPlayerControlsCubit>().hideSettings();
                  },
                )
        ];
      default:
        return const [SizedBox.shrink()];
    }
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    TextStyle? settingStyle = textTheme.titleLarge;
    var settings = context.read<SettingsCubit>();
    return BlocProvider(
      create: (context) => TvPlayerSettingsCubit(const TvPlayerSettingsState(),
          context.read<VideoPlayerCubit>(), settings),
      child: BlocBuilder<TvPlayerSettingsCubit, TvPlayerSettingsState>(
          builder: (context, playerState) {
        var cubit = context.read<TvPlayerSettingsCubit>();
        var settings = context.read<SettingsCubit>();

        return FocusScope(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TvButton(
                      autofocus: true,
                      unfocusedColor: playerState.selected == Tabs.video
                          ? colors.secondaryContainer
                          : Colors.transparent,
                      onFocusChanged: cubit.videoButtonFocusChange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Text(
                          locals.quality,
                          style: settingStyle,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: settings.state.useDash,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TvButton(
                        onFocusChanged: cubit.audioButtonFocusChange,
                        unfocusedColor: playerState.selected == Tabs.audio
                            ? colors.secondaryContainer
                            : Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: Text(locals.audio, style: settingStyle),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TvButton(
                      onFocusChanged: cubit.captionsButtonFocusChange,
                      unfocusedColor: playerState.selected == Tabs.captions
                          ? colors.secondaryContainer
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Text(locals.subtitles, style: settingStyle),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TvButton(
                      onFocusChanged: cubit.playbackSpeedButtonFocusChange,
                      unfocusedColor: playerState.selected == Tabs.playbackSpeed
                          ? colors.secondaryContainer
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Text(locals.playbackSpeed, style: settingStyle),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TvButton(
                      onFocusChanged: cubit.sleepTimerButtonFocusChange,
                      unfocusedColor: playerState.selected == Tabs.sleepTimer
                          ? colors.secondaryContainer
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Text(locals.sleepTimer, style: settingStyle),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: getContent(context)
                      .map((e) => Center(
                            child: e,
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class TvSettingButton extends StatelessWidget {
  final String label;
  final Function(String selected) onPressed;

  const TvSettingButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TvButton(
        unfocusedColor: Colors.transparent,
        onPressed: (context) => onPressed(label),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Text(label, style: textTheme.titleLarge),
        ));
  }
}
