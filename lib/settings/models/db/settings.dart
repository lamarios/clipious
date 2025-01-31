import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

const selectedServer = 'selected-server';
const useSponsorBlock = 'use-sponsor-block';
const sponsorBlockPrefix = 'sponsor-block-';
const browsingCountry = 'browsing-country';
const dynamicTheme = 'dynamic-theme';
const useDashSettingName = 'use-dash';
const playerRepeat = 'player-repeat';
const playerShuffle = 'player-shuffle';
const playerAutoplayOnLoad = 'player-autoplay-on-load';
const playRecommendedNextSettingName = 'play-recommended-next';
const useProxySettingName = 'use-proxy';
const useReturnYoutubeDislikeSettingName = 'use-return-youtube-dislike';
const returnYoutubeDislikeUrlSettingName = 'custom-return-youtube-dislike-url';
const blackBackgroundSettingName = 'black-background';
const subtitleSizeSettingName = 'subtitles-size';
const rememberLastSubtitle = 'remember-last-subtitle';
const lastSubtitle = 'last-subtitle';
const skipSslVerificationSettingName = 'skip-ssl-verification';
const themeModeSettingName = 'theme-mode';
const localeSettingName = 'locale';
const useSearchHistorySettingName = 'use-search-history';
const searchHistoryLimitSettingName = 'search-history-limit';
const hideFilteredVideo = 'hide-filtered-videos';
const remeberPlaybackSpeed = 'remember-playback-speed';
const lastSpeedSettingName = 'last-speed';
const lockOrientationFullScreen = 'lock-orientation-fullscreen';
const skipStepSettingName = 'skip-step';
const skipExponentialSettingName = 'skip-exponentially';
const fillFullScreen = 'fill-fullscreen';
const appLayoutSettingName = 'app-layout';
const navigationBarLabelBehaviorSettingName = 'navigation-bar-label-behavior';
const distractionFreeModeSettingName = 'distraction-free-mode';
const backgroundNotificationsSettingName = 'background-notifications';
const backgroundCheckFrequency = "background-check-frequency";
const subtitleBackground = 'subtitle-background';
const dearrowSettingName = 'dearrow';
const dearrowThumbnailsSettingName = "dearrow-thumbnails";
const fullScreenOnLandscapeSettingName = "fullscreen-on-landscape";
const screenControlsSettingName = "screen-controls";
const forceTvUiSettingName = "force-tv-ui";

const onOpenSettingName = "on-open";

@JsonSerializable()
class SettingsValue {
  String name;

  String value;

  SettingsValue(this.name, this.value);

  factory SettingsValue.fromJson(Map<String, dynamic> json) =>
      _$SettingsValueFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsValueToJson(this);
}
