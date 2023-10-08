import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

part 'settings.g.dart';

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
    var state = this.state.copyWith();
    state.sponsorBlock = value;
    emit(state);
  }

  toggleForceLandscapeFullScreen(bool value) {
    var state = this.state.copyWith();
    state.forceLandscapeFullScreen = value;
    emit(state);
  }

  toggleFillFullscreen(bool value) {
    var state = this.state.copyWith();
    state.fillFullscreen = value;
    emit(state);
  }

  toggleDynamicTheme(bool value) {
    var state = this.state.copyWith();
    state.useDynamicTheme = value;
    emit(state);
    updateApp();
  }

  toggleDash(bool value) {
    var state = this.state.copyWith();
    state.useDash = value;
    emit(state);
  }

  toggleProxy(bool value) {
    var state = this.state.copyWith();
    state.useProxy = value;
    emit(state);
  }

  toggleAutoplayOnLoad(bool value) {
    var state = this.state.copyWith();
    state.autoplayVideoOnLoad = value;
    emit(state);
  }

  toggleReturnYoutubeDislike(bool value) {
    var state = this.state.copyWith();
    state.useReturnYoutubeDislike = value;
    emit(state);
  }

  toggleSearchHistory(bool value) {
    var state = this.state.copyWith();
    state.useSearchHistory = value;
    emit(state);
    if (!value) {
      db.clearSearchHistory();
    }
  }

  toggleRememberPlaybackSpeed(bool value) {
    var state = this.state.copyWith();
    state.rememberPlayBackSpeed = value;
    emit(state);
  }

  selectOnOpen(int index) {
    var state = this.state.copyWith();
    state.onOpen = index;
    emit(state);
  }

  void selectCountry(String selected) {
    var state = this.state.copyWith();
    state.country = countryCodes.firstWhere((element) => element.name == selected, orElse: () => state.country);
    emit(state);
  }

  serverChanged() {
    emit(state.copyWith());
  }

  toggleSslVerification(bool value) {
    var state = this.state.copyWith();
    state.skipSslVerification = value;
    emit(state);
  }

  getPackageInfo() async {
    var state = this.state.copyWith();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    state.packageInfo = packageInfo;
    emit(state);
  }

  toggleBlackBackground(bool value) {
    var state = this.state.copyWith();
    state.blackBackground = value;
    emit(state);
    appCubit.rebuildApp();
  }

  changeSubtitleSize({required bool increase}) {
    var state = this.state.copyWith();
    if (increase) {
      state.subtitleSize++;
    } else {
      if (state.subtitleSize > 1) {
        state.subtitleSize--;
      }
    }
    emit(state);
  }

  setSubtitleSize(int value) {
    var state = this.state.copyWith();
    if (value < 1) {
      state.subtitleSize = 1;
    } else {
      state.subtitleSize = value.toDouble();
    }

    emit(state);
  }

  toggleRememberSubtitles(bool value) {
    var state = this.state.copyWith();
    state.rememberSubtitles = value;
    emit(state);
  }

  changeSearchHistoryLimit({required bool increase}) {
    var state = this.state.copyWith();
    if (increase) {
      if (state.searchHistoryLimit < 30) {
        state.searchHistoryLimit++;
      }
    } else {
      if (state.searchHistoryLimit > 1) {
        state.searchHistoryLimit--;
      }
    }
    emit(state);
    if (!increase) {
      db.clearExcessSearchHistory();
    }
  }

  setHistoryLimit(int value) {
    var state = this.state.copyWith();
    if (value < 1) {
      state.searchHistoryLimit = 1;
    } else if (value <= 30) {
      state.searchHistoryLimit = value;
    }

    emit(state);
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
    var state = this.state.copyWith();
    if (theme != null) {
      state.themeMode = theme;
    }
    emit(state);
    updateApp();
  }

  setLocale(List<Locale> locals, List<String> localStrings, String? locale) {
    var state = this.state.copyWith();
    if (locale == null) {
      db.deleteSetting(LOCALE);
      state.locale = null;
    } else {
      var selectedIndex = localStrings.indexOf(locale);

      Locale selectedLocale = locals[selectedIndex];

      String toSave = selectedLocale.languageCode;
      if (selectedLocale.scriptCode != null) {
        toSave += '_${selectedLocale.scriptCode}';
      }

      state.locale = toSave;
    }
    emit(state);
    updateApp();
  }

  updateApp() {
    appCubit.rebuildApp();
  }

  setLastSpeed(double d) {
    var state = this.state.copyWith();
    state.lastSpeed = d;
    emit(state);
  }

  setShuffle(bool b) {
    var state = this.state.copyWith();
    state.playerShuffleMode = b;
    emit(state);
  }

  setRepeatMode(PlayerRepeat repeat) {
    var state = this.state.copyWith();
    state.playerRepeatMode = repeat;
    emit(state);
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
    var state = this.state.copyWith();
    state.lastSubtitles = s;
    emit(state);
  }

  setPlayRecommendedNext(bool b) {
    var state = this.state.copyWith();
    state.playRecommendedNext = b;
    emit(state);
  }

  setDistractionFreeMode(bool b) {
    var state = this.state.copyWith();
    state.distractionFreeMode = b;
    emit(state);
  }

  setSubtitlesBackground(bool b) {
    var state = this.state.copyWith();
    state.subtitlesBackground = b;
    emit(state);
  }

  String? getLocaleDisplayName() {
    List<String>? localeString = state.locale?.split('_');
    Locale? l = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

    return l?.nativeDisplayLanguageScript;
  }

  setAppLayout(List<HomeDataSource> layout) {
    var state = this.state.copyWith();
    state.appLayout = layout;
    emit(state);
  }

  setNavigationBarLabelBehavior(NavigationDestinationLabelBehavior behavior) {
    var state = this.state.copyWith();
    state.navigationBarLabelBehavior = behavior;
    emit(state);
  }

  Future<EnableBackGroundNotificationResponse> setBackgroundNotifications(bool b) async {
    if (!b) {
      var state = this.state.copyWith();
      state.backgroundNotifications = b;
      await stopTasks();
      emit(state);
    } else {
      var isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        var allowed = await AwesomeNotifications().requestPermissionToSendNotifications();
        if (!allowed) {
          return EnableBackGroundNotificationResponse.notificationsNotAllowed;
        }
      }

      var state = this.state.copyWith();
      state.backgroundNotifications = b;
      await configureBackgroundService(this);
      await setupTasks(this);
      emit(state);
      return EnableBackGroundNotificationResponse.ok;
    }

    return EnableBackGroundNotificationResponse.ok;
  }

  setSubscriptionsNotifications(bool b) {
    var state = this.state.copyWith();
    state.subscriptionsNotifications = b;
    emit(state);
  }

  setDearrow(bool b) {
    var state = this.state.copyWith();
    state.dearrow = b;
    emit(state);
  }

  setDearrowThumbnail(bool b) {
    var state = this.state.copyWith();
    state.dearrowThumbnails = b;
    emit(state);
  }

  setBackgroundCheckFrequency(int i) {
    if (i > 0 && i <= 24) {
      var state = this.state.copyWith();
      state.backgroundNotificationFrequency = i;
      emit(state);
      EasyDebounce.debounce('restarting-background-service', const Duration(seconds: 2), () {
        setupTasks(this);
      });
    }
  }
}

@CopyWith(constructor: "_")
class SettingsState {
  late Map<String, SettingsValue> settings;
  PackageInfo packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');

  bool get sponsorBlock => _get(USE_SPONSORBLOCK)?.value == 'true';

  set sponsorBlock(bool b) => _set(USE_SPONSORBLOCK, b);

  int get onOpen => int.parse(_get(ON_OPEN)?.value ?? '0');

  set onOpen(int i) => _set(ON_OPEN, i);

  bool get useProxy => _get(USE_PROXY)?.value == 'true';

  set useProxy(bool b) => _set(USE_PROXY, b);

  bool get blackBackground => _get(BLACK_BACKGROUND)?.value == 'true';

  set blackBackground(bool b) => _set(BLACK_BACKGROUND, b);

  bool get rememberSubtitles => _get(REMEMBER_LAST_SUBTITLE)?.value == 'true';

  set rememberSubtitles(bool b) => _set(REMEMBER_LAST_SUBTITLE, b);

  bool get rememberPlayBackSpeed => _get(REMEMBER_PLAYBACK_SPEED)?.value == 'true';

  set rememberPlayBackSpeed(bool b) => _set(REMEMBER_PLAYBACK_SPEED, b);

  bool get fillFullscreen => _get(FILL_FULLSCREEN)?.value == 'true';

  set fillFullscreen(bool b) => _set(FILL_FULLSCREEN, b);

  String? get locale => _get(LOCALE)?.value;

  set locale(String? s) => _set(LOCALE, s);

  int get searchHistoryLimit => int.parse(_get(SEARCH_HISTORY_LIMIT)?.value ?? searchHistoryDefaultLength);

  set searchHistoryLimit(int b) => _set(SEARCH_HISTORY_LIMIT, b);

  double get lastSpeed => double.parse(_get(LAST_SPEED)?.value ?? "1.0");

  set lastSpeed(double d) => _set(LAST_SPEED, d);

  bool get playerShuffleMode => _get(PLAYER_SHUFFLE)?.value == "true";

  set playerShuffleMode(bool b) => _set(PLAYER_SHUFFLE, b);

  PlayerRepeat get playerRepeatMode => PlayerRepeat.values[int.parse(_get(PLAYER_REPEAT)?.value ?? '0')];

  set playerRepeatMode(PlayerRepeat repeatMode) => _set(PLAYER_REPEAT, PlayerRepeat.values.indexOf(repeatMode));

  String get lastSubtitles => _get(LAST_SUBTITLE)?.value ?? '';

  set lastSubtitles(String s) => _set(LAST_SUBTITLE, s);

  bool get playRecommendedNext => _get(PLAY_RECOMMENDED_NEXT)?.value == "true";

  set playRecommendedNext(bool b) => _set(PLAY_RECOMMENDED_NEXT, b);

  Country get country => getCountryFromCode(_get(BROWSING_COUNTRY)?.value ?? 'US');

  set country(Country c) {
    String code = countryCodes.firstWhere((element) => element.name == c.name, orElse: () => country).code;
    _set(BROWSING_COUNTRY, code);
  }

  bool get useDynamicTheme => _get(DYNAMIC_THEME)?.value == 'true';

  set useDynamicTheme(bool b) => _set(DYNAMIC_THEME, b);

  bool get useDash => _get(USE_DASH)?.value == 'true';

  set useDash(bool b) => _set(USE_DASH, b);

  bool get autoplayVideoOnLoad => _get(PLAYER_AUTOPLAY_ON_LOAD)?.value == 'true';

  set autoplayVideoOnLoad(bool b) => _set(PLAYER_AUTOPLAY_ON_LOAD, b);

  bool get useReturnYoutubeDislike => _get(USE_RETURN_YOUTUBE_DISLIKE)?.value == 'true';

  set useReturnYoutubeDislike(bool b) => _set(USE_RETURN_YOUTUBE_DISLIKE, b);

  double get subtitleSize => double.parse(_get(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize);

  set subtitleSize(double d) => _set(SUBTITLE_SIZE, d);

  bool get skipSslVerification => _get(SKIP_SSL_VERIFICATION)?.value == 'true';

  set skipSslVerification(bool b) => _set(SKIP_SSL_VERIFICATION, b);

  bool get forceLandscapeFullScreen => _get(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';

  set forceLandscapeFullScreen(bool b) => _set(LOCK_ORIENTATION_FULLSCREEN, b);

  ThemeMode get themeMode => ThemeMode.values.firstWhere((element) => element.name == _get(THEME_MODE)?.value, orElse: () => ThemeMode.system);

  set themeMode(ThemeMode t) => _set(THEME_MODE, t.name);

  bool get useSearchHistory => _get(USE_SEARCH_HISTORY)?.value == 'true';

  set useSearchHistory(bool b) => _set(USE_SEARCH_HISTORY, b);

  List<HomeDataSource> get appLayout => (_get(APP_LAYOUT)?.value ?? '${HomeDataSource.home.name},${HomeDataSource.subscription.name},${HomeDataSource.playlist.name},${HomeDataSource.history.name}')
      .split(',')
      .where((element) => element.isNotEmpty)
      .map((e) => HomeDataSource.values.firstWhere((element) => element.name == e))
      .toList();

  set appLayout(List<HomeDataSource> layout) => _set(APP_LAYOUT, layout.map((e) => e.name).join(","));

  NavigationDestinationLabelBehavior get navigationBarLabelBehavior =>
      NavigationDestinationLabelBehavior.values.firstWhere((e) => e.name == (_get(NAVIGATION_BAR_LABEL_BEHAVIOR)?.value ?? NavigationDestinationLabelBehavior.onlyShowSelected.name));

  set navigationBarLabelBehavior(NavigationDestinationLabelBehavior behavior) => _set(NAVIGATION_BAR_LABEL_BEHAVIOR, behavior.name);

  bool get distractionFreeMode => _get(DISTRACTION_FREE_MODE)?.value == "true";

  set distractionFreeMode(bool b) => _set(DISTRACTION_FREE_MODE, b);

  bool get backgroundNotifications => _get(BACKGROUND_NOTIFICATIONS)?.value == 'true';

  set backgroundNotifications(bool b) => _set(BACKGROUND_NOTIFICATIONS, b);

  bool get subscriptionsNotifications => _get(SUBSCRIPTION_NOTIFICATIONS)?.value == 'true';

  set subscriptionsNotifications(bool b) => _set(SUBSCRIPTION_NOTIFICATIONS, b);

  int get backgroundNotificationFrequency => int.parse(_get(BACKGROUND_CHECK_FREQUENCY)?.value ?? "1");

  set backgroundNotificationFrequency(int i) => _set(BACKGROUND_CHECK_FREQUENCY, i);

  bool get subtitlesBackground => _get(SUBTITLE_BACKGROUND)?.value == 'true';

  set subtitlesBackground(bool b) => _set(SUBTITLE_BACKGROUND, b);

  bool get dearrow => _get(DEARROW)?.value == 'true';

  set dearrow(bool b) => _set(DEARROW, b);

  bool get dearrowThumbnails => _get(DEARROW_THUMBNAILS)?.value == 'true';

  set dearrowThumbnails(bool b) => _set(DEARROW_THUMBNAILS, b);

  void _set<T>(String name, T value) {
    if (value == null) {
      db.deleteSetting(name);
      settings.remove(name);
    } else {
      var settingsValue = SettingsValue(name, value.toString());
      settings[name] = settingsValue;
      db.saveSetting(settingsValue);
    }
  }

  SettingsValue? _get(String settingName) {
    if (settings.containsKey(settingName)) {
      return settings[settingName];
    } else {
      return null;
    }
  }

  SettingsState() {
    var allSettings = db.getAllSettings();
    settings = {for (var s in allSettings) s.name: s};
  }

  SettingsState._(this.settings, this.packageInfo);
}
