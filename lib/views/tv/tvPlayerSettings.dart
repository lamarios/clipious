import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/tvPlayerSettingsController.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const TextStyle settingStyle = TextStyle(fontSize: 20);

class TvPlayerSettings extends StatelessWidget {
  const TvPlayerSettings({Key? key}) : super(key: key);

  List<Widget> getContent(TvPlayerSettingsController _) {
    switch (_.selected) {
      case Tabs.video:
        return _.videoTrackNames
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: _.changeVideoTrack,
                ))
            .toList();
      case Tabs.audio:
        return _.audioTrackNames
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: _.changeChangeAudioTrack,
                ))
            .toList();
      case Tabs.captions:
        return _.availableCaptions
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: _.changeSubtitles,
                ))
            .toList();
      case Tabs.playbackSpeed:
        return _.playbackSpeeds
            .map((e) => TvSettingButton(
                  label: e,
                  onPressed: _.changePlaybackSpeed,
                ))
            .toList();
      default:
        return const [SizedBox.shrink()];
    }
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    return GetBuilder<TvPlayerSettingsController>(
        init: TvPlayerSettingsController(),
        global: false,
        builder: (_) {
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
                        unfocusedColor: _.selected == Tabs.video ? colors.secondaryContainer : Colors.transparent,
                        onFocusChanged: _.videoButtonFocusChange,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                          child: Text(
                            locals.quality,
                            style: settingStyle,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _.useDash,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TvButton(
                          onFocusChanged: _.audioButtonFocusChange,
                          unfocusedColor: _.selected == Tabs.audio ? colors.secondaryContainer : Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                            child: Text(locals.audio, style: settingStyle),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TvButton(
                        onFocusChanged: _.captionsButtonFocusChange,
                        unfocusedColor: _.selected == Tabs.captions? colors.secondaryContainer : Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                          child: Text(locals.subtitles, style: settingStyle),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TvButton(
                        onFocusChanged: _.playbackSpeedButtonFocusChange,
                        unfocusedColor: _.selected == Tabs.playbackSpeed ? colors.secondaryContainer : Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                          child: Text(locals.playbackSpeed, style: settingStyle),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: getContent(_),
                )
              ],
            ),
          );
        });
  }
}

class TvSettingButton extends StatelessWidget {
  final String label;
  final Function(String selected) onPressed;

  const TvSettingButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TvButton(
        unfocusedColor: Colors.transparent,
        onPressed: (context) => onPressed(label),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Text(label, style: settingStyle),
        ));
  }
}
