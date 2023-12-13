import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
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
    country = countryCodes.firstWhere((element) => element.name == selected, orElse: () => state.country);
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
      db.deleteSetting(LOCALE);
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
    Locale? l = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

    return l?.nativeDisplayLanguageScript;
  }

  setAppLayout(List<HomeDataSource> layout) {
    appLayout = layout;
  }

  setNavigationBarLabelBehavior(NavigationDestinationLabelBehavior behavior) {
    navigationBarLabelBehavior = behavior;
  }

  Future<EnableBackGroundNotificationResponse> setBackgroundNotifications(bool b) async {
    if (!b) {
      await stopTasks();
      backgroundNotifications = b;
    } else {
      var isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        var allowed = await AwesomeNotifications().requestPermissionToSendNotifications();
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
      EasyDebounce.debounce('restarting-background-service', const Duration(seconds: 2), () {
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

  set sponsorBlock(bool b) => _set(USE_SPONSORBLOCK, b);

  set onOpen(int i) => _set(ON_OPEN, i);

  set useProxy(bool b) => _set(USE_PROXY, b);

  set blackBackground(bool b) => _set(BLACK_BACKGROUND, b);

  set rememberSubtitles(bool b) => _set(REMEMBER_LAST_SUBTITLE, b);

  set rememberPlayBackSpeed(bool b) => _set(REMEMBER_PLAYBACK_SPEED, b);

  set fillFullscreen(bool b) => _set(FILL_FULLSCREEN, b);

  set locale(String? s) => _set(LOCALE, s);

  set searchHistoryLimit(int b) => _set(SEARCH_HISTORY_LIMIT, b);

  set lastSpeed(double d) => _set(LAST_SPEED, d);

  set playerShuffleMode(bool b) => _set(PLAYER_SHUFFLE, b);

  set playerRepeatMode(PlayerRepeat repeatMode) => _set(PLAYER_REPEAT, PlayerRepeat.values.indexOf(repeatMode));

  set lastSubtitles(String s) => _set(LAST_SUBTITLE, s);

  set playRecommendedNext(bool b) => _set(PLAY_RECOMMENDED_NEXT, b);

  set country(Country c) {
    String code = countryCodes.firstWhere((element) => element.name == c.name, orElse: () => state.country).code;
    _set(BROWSING_COUNTRY, code);
  }

  set useDynamicTheme(bool b) => _set(DYNAMIC_THEME, b);

  set useDash(bool b) => _set(USE_DASH, b);

  set autoplayVideoOnLoad(bool b) => _set(PLAYER_AUTOPLAY_ON_LOAD, b);

  set useReturnYoutubeDislike(bool b) => _set(USE_RETURN_YOUTUBE_DISLIKE, b);

  set subtitleSize(double d) => _set(SUBTITLE_SIZE, d);

  set skipSslVerification(bool b) => _set(SKIP_SSL_VERIFICATION, b);

  set forceLandscapeFullScreen(bool b) => _set(LOCK_ORIENTATION_FULLSCREEN, b);

  set themeMode(ThemeMode t) => _set(THEME_MODE, t.name);

  set useSearchHistory(bool b) => _set(USE_SEARCH_HISTORY, b);

  set appLayout(List<HomeDataSource> layout) => _set(APP_LAYOUT, layout.map((e) => e.name).join(","));

  set navigationBarLabelBehavior(NavigationDestinationLabelBehavior behavior) => _set(NAVIGATION_BAR_LABEL_BEHAVIOR, behavior.name);

  set distractionFreeMode(bool b) => _set(DISTRACTION_FREE_MODE, b);

  set backgroundNotifications(bool b) => _set(BACKGROUND_NOTIFICATIONS, b);

  set subscriptionsNotifications(bool b) => _set(SUBSCRIPTION_NOTIFICATIONS, b);

  set backgroundNotificationFrequency(int i) => _set(BACKGROUND_CHECK_FREQUENCY, i);

  set subtitlesBackground(bool b) => _set(SUBTITLE_BACKGROUND, b);

  set dearrow(bool b) => _set(DEARROW, b);

  set dearrowThumbnails(bool b) => _set(DEARROW_THUMBNAILS, b);

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
  const factory SettingsState({required Map<String, SettingsValue> settings, required PackageInfo packageInfo}) = _SettingsState;

  static SettingsState init() {
    PackageInfo packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');
    var allSettings = db.getAllSettings();
    var settings = {for (var s in allSettings) s.name: s};

    return SettingsState(settings: settings, packageInfo: packageInfo);
  }

  // late Map<String, SettingsValue> settings;

  bool get sponsorBlock => _get(USE_SPONSORBLOCK)?.value == 'true';

  int get onOpen => int.parse(_get(ON_OPEN)?.value ?? '0');

  bool get useProxy => _get(USE_PROXY)?.value == 'true';

  bool get blackBackground => _get(BLACK_BACKGROUND)?.value == 'true';

  bool get rememberSubtitles => _get(REMEMBER_LAST_SUBTITLE)?.value == 'true';

  bool get rememberPlayBackSpeed => _get(REMEMBER_PLAYBACK_SPEED)?.value == 'true';

  bool get fillFullscreen => _get(FILL_FULLSCREEN)?.value == 'true';

  String? get locale => _get(LOCALE)?.value;

  int get searchHistoryLimit => int.parse(_get(SEARCH_HISTORY_LIMIT)?.value ?? searchHistoryDefaultLength);

  double get lastSpeed => double.parse(_get(LAST_SPEED)?.value ?? "1.0");

  bool get playerShuffleMode => _get(PLAYER_SHUFFLE)?.value == "true";

  PlayerRepeat get playerRepeatMode => PlayerRepeat.values[int.parse(_get(PLAYER_REPEAT)?.value ?? '0')];

  String get lastSubtitles => _get(LAST_SUBTITLE)?.value ?? '';

  bool get playRecommendedNext => _get(PLAY_RECOMMENDED_NEXT)?.value == "true";

  Country get country => getCountryFromCode(_get(BROWSING_COUNTRY)?.value ?? 'US');

  bool get useDynamicTheme => _get(DYNAMIC_THEME)?.value == 'true';

  bool get useDash => _get(USE_DASH)?.value == 'true';

  bool get autoplayVideoOnLoad => _get(PLAYER_AUTOPLAY_ON_LOAD)?.value == 'true';

  bool get useReturnYoutubeDislike => _get(USE_RETURN_YOUTUBE_DISLIKE)?.value == 'true';

  double get subtitleSize => double.parse(_get(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize);

  bool get skipSslVerification => _get(SKIP_SSL_VERIFICATION)?.value == 'true';

  bool get forceLandscapeFullScreen => _get(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';

  ThemeMode get themeMode => ThemeMode.values.firstWhere((element) => element.name == _get(THEME_MODE)?.value, orElse: () => ThemeMode.system);

  bool get useSearchHistory => _get(USE_SEARCH_HISTORY)?.value == 'true';

  List<HomeDataSource> get appLayout => (_get(APP_LAYOUT)?.value ?? HomeDataSource.defaultSettings().map((e) => e.name).join(","))
      .split(',')
      .where((element) => element.isNotEmpty)
      .map((e) => HomeDataSource.values.firstWhere((element) => element.name == e))
      .toList();

  NavigationDestinationLabelBehavior get navigationBarLabelBehavior =>
      NavigationDestinationLabelBehavior.values.firstWhere((e) => e.name == (_get(NAVIGATION_BAR_LABEL_BEHAVIOR)?.value ?? NavigationDestinationLabelBehavior.onlyShowSelected.name));

  bool get distractionFreeMode => _get(DISTRACTION_FREE_MODE)?.value == "true";

  bool get backgroundNotifications => _get(BACKGROUND_NOTIFICATIONS)?.value == 'true';

  bool get subscriptionsNotifications => _get(SUBSCRIPTION_NOTIFICATIONS)?.value == 'true';

  int get backgroundNotificationFrequency => int.parse(_get(BACKGROUND_CHECK_FREQUENCY)?.value ?? "1");

  bool get subtitlesBackground => _get(SUBTITLE_BACKGROUND)?.value == 'true';

  bool get dearrow => _get(DEARROW)?.value == 'true';

  bool get dearrowThumbnails => _get(DEARROW_THUMBNAILS)?.value == 'true';

  SettingsValue? _get(String settingName) {
    if (settings.containsKey(settingName)) {
      return settings[settingName];
    } else {
      return null;
    }
  }


  const SettingsState._();
}
