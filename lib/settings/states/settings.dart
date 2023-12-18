import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/workmanager.dart';
import 'package:locale_names/locale_names.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../home/models/db/home_layout.dart';
import '../../player/states/player.dart';
import '../../utils.dart';
import '../../utils/models/country.dart';
import '../models/db/settings.dart';

part 'settings.freezed.dart';

const String subtitleDefaultSize = '14';
const String searchHistoryDefaultLength = '12';
const skipSteps = [5, 10, 15, 20, 30, 60];
const defaultStep = 10;

enum EnableBackGroundNotificationResponse {
  ok,
  notificationsNotAllowed,
  needBatteryOptimization;
}

var log = Logger('SettingsController');

class SettingsCubit extends Cubit<SettingsState> {
  final AppCubit appCubit;

  SettingsCubit(super.initialState, this.appCubit) {
    onReady();
  }

  onReady() {
    getPackageInfo();
  }

  toggleSponsorBlock(bool value) {
    sponsorBlock = value;
  }

  toggleForceLandscapeFullScreen(bool value) {
    forceLandscapeFullScreen = value;
  }

  toggleFillFullscreen(bool value) {
    fillFullscreen = value;
  }

  toggleDynamicTheme(bool value) {
    useDynamicTheme = value;
    updateApp();
  }

  toggleDash(bool value) {
    useDash = value;
  }

  toggleProxy(bool value) {
    useProxy = value;
  }

  toggleAutoplayOnLoad(bool value) {
    autoplayVideoOnLoad = value;
  }

  toggleReturnYoutubeDislike(bool value) {
    useReturnYoutubeDislike = value;
  }

  toggleSearchHistory(bool value) {
    useSearchHistory = value;
    if (!value) {
      db.clearSearchHistory();
    }
  }

  toggleRememberPlaybackSpeed(bool value) {
    rememberPlayBackSpeed = value;
  }

  selectOnOpen(int index) {
    onOpen = index;
  }

  void selectCountry(String selected) {
    country = countryCodes.firstWhere((element) => element.name == selected,
        orElse: () => state.country);
  }

  serverChanged() {
    emit(state.copyWith());
  }

  toggleSslVerification(bool value) {
    skipSslVerification = value;
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(packageInfo: packageInfo));
  }

  toggleBlackBackground(bool value) {
    blackBackground = value;
    appCubit.rebuildApp();
  }

  changeSkipStep({required bool increase}) {
    int index = skipSteps.indexOf(state.skipStep);
    if (increase) {
      if (index < skipSteps.length - 1) {
        skipStep = skipSteps[index + 1];
      }
    } else {
      if (index > 0) {
        skipStep = skipSteps[index - 1];
      }
    }
  }

  changeSubtitleSize({required bool increase}) {
    if (increase) {
      subtitleSize = state.subtitleSize + 1;
    } else {
      if (state.subtitleSize > 1) {
        subtitleSize = state.subtitleSize - 1;
      }
    }
  }

  setSubtitleSize(int value) {
    if (value < 1) {
      subtitleSize = 1;
    } else {
      subtitleSize = value.toDouble();
    }
  }

  toggleRememberSubtitles(bool value) {
    rememberSubtitles = value;
  }

  changeSearchHistoryLimit({required bool increase}) {
    if (increase) {
      if (state.searchHistoryLimit < 30) {
        searchHistoryLimit = state.searchHistoryLimit + 1;
      }
    } else {
      if (state.searchHistoryLimit > 1) {
        searchHistoryLimit = state.searchHistoryLimit - 1;
      }
    }
    if (!increase) {
      db.clearExcessSearchHistory();
    }
  }

  setHistoryLimit(int value) {
    if (value < 1) {
      searchHistoryLimit = 1;
    } else if (value <= 30) {
      searchHistoryLimit = value;
    }

    if (value < state.searchHistoryLimit) {
      db.clearExcessSearchHistory();
    }
  }

  String getThemeLabel(AppLocalizations locals, ThemeMode theme) {
    switch (theme) {
      case ThemeMode.dark:
        return locals.themeDark;
      case ThemeMode.light:
        return locals.themeLight;
      case ThemeMode.system:
        return locals.followSystem;
    }
  }

  setThemeMode(ThemeMode? theme) {
    if (theme != null) {
      themeMode = theme;
    }
    updateApp();
  }

  setLocale(List<Locale> locals, List<String> localStrings, String? locale) {
    if (locale == null) {
      db.deleteSetting(localeSettingName);
      this.locale = null;
    } else {
      var selectedIndex = localStrings.indexOf(locale);

      Locale selectedLocale = locals[selectedIndex];

      String toSave = selectedLocale.languageCode;
      if (selectedLocale.scriptCode != null) {
        toSave += '_${selectedLocale.scriptCode}';
      }

      this.locale = toSave;
    }
    updateApp();
  }

  updateApp() {
    appCubit.rebuildApp();
  }

  setLastSpeed(double d) {
    lastSpeed = d;
  }

  setShuffle(bool b) {
    playerShuffleMode = b;
  }

  setRepeatMode(PlayerRepeat repeat) {
    playerRepeatMode = repeat;
  }

  toggleShuffle() {
    setShuffle(!state.playerShuffleMode);
  }

  setNextRepeatMode() {
    switch (state.playerRepeatMode) {
      case PlayerRepeat.noRepeat:
        setRepeatMode(PlayerRepeat.repeatAll);
        break;
      case PlayerRepeat.repeatAll:
        setRepeatMode(PlayerRepeat.repeatOne);
        break;
      case PlayerRepeat.repeatOne:
        setRepeatMode(PlayerRepeat.noRepeat);
        break;
    }
  }

  setLastSubtitle(String s) {
    lastSubtitles = s;
  }

  setPlayRecommendedNext(bool b) {
    playRecommendedNext = b;
  }

  setDistractionFreeMode(bool b) {
    distractionFreeMode = b;
  }

  setSubtitlesBackground(bool b) {
    subtitlesBackground = b;
  }

  String? getLocaleDisplayName() {
    List<String>? localeString = state.locale?.split('_');
    Locale? l = localeString != null
        ? Locale.fromSubtags(
            languageCode: localeString[0],
            scriptCode: localeString.length >= 2 ? localeString[1] : null)
        : null;

    return l?.nativeDisplayLanguageScript;
  }

  setAppLayout(List<HomeDataSource> layout) {
    appLayout = layout;
  }

  setNavigationBarLabelBehavior(NavigationDestinationLabelBehavior behavior) {
    navigationBarLabelBehavior = behavior;
  }

  Future<EnableBackGroundNotificationResponse> setBackgroundNotifications(
      bool b) async {
    if (!b) {
      await stopTasks();
      backgroundNotifications = b;
    } else {
      var isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        var allowed =
            await AwesomeNotifications().requestPermissionToSendNotifications();
        if (!allowed) {
          return EnableBackGroundNotificationResponse.notificationsNotAllowed;
        }
      }

      backgroundNotifications = b;
      await configureBackgroundService(this);
      await setupTasks(this);
      return EnableBackGroundNotificationResponse.ok;
    }

    return EnableBackGroundNotificationResponse.ok;
  }

  setSubscriptionsNotifications(bool b) {
    subscriptionsNotifications = b;
  }

  setDearrow(bool b) {
    dearrow = b;
  }

  setDearrowThumbnail(bool b) {
    dearrowThumbnails = b;
  }

  setBackgroundCheckFrequency(int i) {
    if (i > 0 && i <= 24) {
      backgroundNotificationFrequency = i;
      EasyDebounce.debounce(
          'restarting-background-service', const Duration(seconds: 2), () {
        setupTasks(this);
      });
    }
  }

  copySettingsAsJson(BuildContext context) {
    var encoder = const JsonEncoder.withIndent('    ');
    String json = encoder.convert(state.settings);
    Clipboard.setData(ClipboardData(text: json));
  }

  saveSetting(SettingsValue settings) {
    var newSettings = Map<String, SettingsValue>.from(state.settings);
    newSettings[settings.name] = settings;
    emit(state.copyWith(settings: newSettings));
  }

  set sponsorBlock(bool b) => _set(useSponsorBlock, b);

  set onOpen(int i) => _set(onOpenSettingName, i);

  set useProxy(bool b) => _set(useProxySettingName, b);

  set blackBackground(bool b) => _set(blackBackgroundSettingName, b);

  set rememberSubtitles(bool b) => _set(rememberLastSubtitle, b);

  set rememberPlayBackSpeed(bool b) => _set(remeberPlaybackSpeed, b);

  set fillFullscreen(bool b) => _set(fillFullScreen, b);

  set locale(String? s) => _set(localeSettingName, s);

  set searchHistoryLimit(int b) => _set(searchHistoryLimitSettingName, b);

  set lastSpeed(double d) => _set(lastSpeedSettingName, d);

  set playerShuffleMode(bool b) => _set(playerShuffle, b);

  set playerRepeatMode(PlayerRepeat repeatMode) =>
      _set(playerRepeat, PlayerRepeat.values.indexOf(repeatMode));

  set lastSubtitles(String s) => _set(lastSubtitle, s);

  set playRecommendedNext(bool b) => _set(playRecommendedNextSettingName, b);

  set country(Country c) {
    String code = countryCodes
        .firstWhere((element) => element.name == c.name,
            orElse: () => state.country)
        .code;
    _set(browsingCountry, code);
  }

  set useDynamicTheme(bool b) => _set(dynamicTheme, b);

  set useDash(bool b) => _set(useDashSettingName, b);

  set autoplayVideoOnLoad(bool b) => _set(playerAutoplayOnLoad, b);

  set useReturnYoutubeDislike(bool b) =>
      _set(useReturnYoutubeDislikeSettingName, b);

  set subtitleSize(double d) => _set(subtitleSizeSettingName, d);

  set skipSslVerification(bool b) => _set(skipSslVerificationSettingName, b);

  set forceLandscapeFullScreen(bool b) => _set(lockOrientationFullScreen, b);

  set themeMode(ThemeMode t) => _set(themeModeSettingName, t.name);

  set useSearchHistory(bool b) => _set(useSearchHistorySettingName, b);

  set appLayout(List<HomeDataSource> layout) =>
      _set(appLayoutSettingName, layout.map((e) => e.name).join(","));

  set navigationBarLabelBehavior(NavigationDestinationLabelBehavior behavior) =>
      _set(navigationBarLabelBehaviorSettingName, behavior.name);

  set distractionFreeMode(bool b) => _set(distractionFreeModeSettingName, b);

  set backgroundNotifications(bool b) =>
      _set(backgroundNotificationsSettingName, b);

  set subscriptionsNotifications(bool b) => _set(subscriptionNotifications, b);

  set backgroundNotificationFrequency(int i) =>
      _set(backgroundCheckFrequency, i);

  set subtitlesBackground(bool b) => _set(subtitleBackground, b);

  set dearrow(bool b) => _set(dearrowSettingName, b);

  set dearrowThumbnails(bool b) => _set(dearrowThumbnailsSettingName, b);

  set skipStep(int s) => _set(skipStepSettingName, s);

  set skipExponentially(bool b) => _set(skipExponentialSettingName, b);

  set fullscreenOnRotate(bool b) => _set(fullScreenOnLandscapeSettingName, b);

  void _set<T>(String name, T value) {
    var settings = Map<String, SettingsValue>.from(state.settings);
    if (value == null) {
      db.deleteSetting(name);
      settings.remove(name);
    } else {
      var settingsValue = SettingsValue(name, value.toString());
      settings[name] = settingsValue;
      db.saveSetting(settingsValue);
    }

    emit(state.copyWith(settings: settings));
  }
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState(
      {required Map<String, SettingsValue> settings,
      required PackageInfo packageInfo}) = _SettingsState;

  static SettingsState init() {
    PackageInfo packageInfo =
        PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');
    var allSettings = db.getAllSettings();
    var settings = {for (var s in allSettings) s.name: s};

    return SettingsState(settings: settings, packageInfo: packageInfo);
  }

  // late Map<String, SettingsValue> settings;

  bool get sponsorBlock => _get(useSponsorBlock)?.value == 'true';

  int get onOpen => int.parse(_get(onOpenSettingName)?.value ?? '0');

  bool get useProxy => _get(useProxySettingName)?.value == 'true';

  bool get blackBackground => _get(blackBackgroundSettingName)?.value == 'true';

  bool get rememberSubtitles => _get(rememberLastSubtitle)?.value == 'true';

  bool get rememberPlayBackSpeed => _get(remeberPlaybackSpeed)?.value == 'true';

  bool get fillFullscreen => _get(fillFullScreen)?.value == 'true';

  String? get locale => _get(localeSettingName)?.value;

  int get searchHistoryLimit => int.parse(
      _get(searchHistoryLimitSettingName)?.value ?? searchHistoryDefaultLength);

  double get lastSpeed =>
      double.parse(_get(lastSpeedSettingName)?.value ?? "1.0");

  bool get playerShuffleMode => _get(playerShuffle)?.value == "true";

  PlayerRepeat get playerRepeatMode =>
      PlayerRepeat.values[int.parse(_get(playerRepeat)?.value ?? '0')];

  String get lastSubtitles => _get(lastSubtitle)?.value ?? '';

  bool get playRecommendedNext =>
      _get(playRecommendedNextSettingName)?.value == "true";

  Country get country =>
      getCountryFromCode(_get(browsingCountry)?.value ?? 'US');

  bool get useDynamicTheme => _get(dynamicTheme)?.value == 'true';

  bool get useDash => _get(useDashSettingName)?.value == 'true';

  bool get autoplayVideoOnLoad => _get(playerAutoplayOnLoad)?.value == 'true';

  bool get useReturnYoutubeDislike =>
      _get(useReturnYoutubeDislikeSettingName)?.value == 'true';

  double get subtitleSize =>
      double.parse(_get(subtitleSizeSettingName)?.value ?? subtitleDefaultSize);

  bool get skipSslVerification =>
      _get(skipSslVerificationSettingName)?.value == 'true';

  bool get forceLandscapeFullScreen =>
      _get(lockOrientationFullScreen)?.value == 'true';

  int get skipStep =>
      int.parse(_get(skipStepSettingName)?.value ?? defaultStep.toString());

  bool get skipExponentially =>
      (_get(skipExponentialSettingName)?.value ?? 'true') == 'true';

  ThemeMode get themeMode => ThemeMode.values.firstWhere(
      (element) => element.name == _get(themeModeSettingName)?.value,
      orElse: () => ThemeMode.system);

  bool get useSearchHistory =>
      _get(useSearchHistorySettingName)?.value == 'true';

  List<HomeDataSource> get appLayout => (_get(appLayoutSettingName)?.value ??
          HomeDataSource.defaultSettings().map((e) => e.name).join(","))
      .split(',')
      .where((element) => element.isNotEmpty)
      .map((e) =>
          HomeDataSource.values.firstWhere((element) => element.name == e))
      .toList();

  NavigationDestinationLabelBehavior get navigationBarLabelBehavior =>
      NavigationDestinationLabelBehavior.values.firstWhere((e) =>
          e.name ==
          (_get(navigationBarLabelBehaviorSettingName)?.value ??
              NavigationDestinationLabelBehavior.onlyShowSelected.name));

  bool get distractionFreeMode =>
      _get(distractionFreeModeSettingName)?.value == "true";

  bool get backgroundNotifications =>
      _get(backgroundNotificationsSettingName)?.value == 'true';

  bool get subscriptionsNotifications =>
      _get(subscriptionNotifications)?.value == 'true';

  int get backgroundNotificationFrequency =>
      int.parse(_get(backgroundCheckFrequency)?.value ?? "1");

  bool get subtitlesBackground => _get(subtitleBackground)?.value == 'true';

  bool get dearrow => _get(dearrowSettingName)?.value == 'true';

  bool get dearrowThumbnails =>
      _get(dearrowThumbnailsSettingName)?.value == 'true';

  bool get fullscreenOnRotate =>
      (_get(fullScreenOnLandscapeSettingName)?.value ?? "true") == "true";

  SettingsValue? _get(String settingName) {
    if (settings.containsKey(settingName)) {
      return settings[settingName];
    } else {
      return null;
    }
  }

  const SettingsState._();
}
