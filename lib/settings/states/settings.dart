import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/controllers/homeController.dart';
import 'package:locale_names/locale_names.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../models/country.dart';
import '../models/db/server.dart';
import '../models/db/settings.dart';
import '../../utils.dart';
import '../../controllers/appController.dart';

part 'settings.g.dart';

const String subtitleDefaultSize = '14';
const String searchHistoryDefaultLength = '12';

var log = Logger('SettingsController');

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(super.initialState) {
    onReady();
  }

  onReady() {
    getPackageInfo();
    getSettings();
  }

  emit(SettingsState state) {
    super.emit(state.copyWith());
  }

  toggleSponsorBlock(bool value) {
    state.sponsorBlock = value;
    emit(state);
  }

  toggleForceLandscapeFullScreen(bool value) {
    state.forceLandscapeFullScreen = value;
    emit(state);
  }

  toggleFillFullscreen(bool value) {
    state.fillFullscreen = value;
    emit(state);
  }

  toggleDynamicTheme(bool value) {
    state.useDynamicTheme = value;
    emit(state);
    updateApp();
  }

  toggleDash(bool value) {
    state.useDash = value;
    emit(state);
  }

  toggleProxy(bool value) {
    state.useProxy = value;
    emit(state);
  }

  toggleAutoplayOnLoad(bool value) {
    state.autoplayVideoOnLoad = value;
    emit(state);
  }

  toggleReturnYoutubeDislike(bool value) {
    state.useReturnYoutubeDislike = value;
    emit(state);
  }

  toggleSearchHistory(bool value) {
    state.useSearchHistory = value;
    emit(state);
    if (!value) {
      db.clearSearchHistory();
    }
  }

  toggleRememberPlaybackSpeed(bool value) {
    state.rememberPlayBackSpeed = value;
    emit(state);
  }

  selectOnOpen(String selected, List<String> categories) {
    int selectedIndex = categories.indexOf(selected);
    state.onOpen = selectedIndex;
    emit(state);
  }

  void selectCountry(String selected) {
    state.country = countryCodes.firstWhere((element) => element.name == selected, orElse: () => state.country);
    emit(state);
  }

  serverChanged() {
    state.currentServer = db.getCurrentlySelectedServer();
    emit(state);
    HomeController.to()?.serverChanged();
  }

  toggleSslVerification(bool value) {
    state.skipSslVerification = value;
    emit(state);
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    state.packageInfo = packageInfo;
    emit(state);
  }

  toggleBlackBackground(bool value) {
    state.blackBackground = value;
    emit(state);
    AppController.to()?.update();
  }

  changeSubtitleSize({required bool increase}) {
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
    if (value < 1) {
      state.subtitleSize = 1;
    } else {
      state.subtitleSize = value.toDouble();
    }

    emit(state);
  }

  toggleRememberSubtitles(bool value) {
    state.rememberSubtitles = value;
    emit(state);
  }

  changeSearchHistoryLimit({required bool increase}) {
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
    if (theme != null) {
      state.themeMode = theme;
    }
    emit(state);
    updateApp();
  }

  setLocale(List<Locale> locals, List<String> localStrings, String? locale) {
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

  getSettings() async {
    var allSettings = await db.getAllSettings();
    state.settings = {for (var s in allSettings) s.name: s};
    emit(state);
  }

  updateApp() {
    AppController.to()?.update();
  }

  String? getLocaleDisplayName() {
    List<String>? localeString = state.locale?.split('_');
    Locale? l = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

    return l?.nativeDisplayLanguageScript;
  }
}

@CopyWith()
class SettingsState {
  Map<String, SettingsValue> settings;
  List<Server> dbServers;
  PackageInfo packageInfo;

  Server currentServer;

  bool get sponsorBlock => _get(USE_SPONSORBLOCK)?.value == 'true';

  Country get country => getCountryFromCode(_get(BROWSING_COUNTRY)?.value ?? 'US');

  int get onOpen => int.parse(_get(ON_OPEN)?.value ?? '0');

  bool get useDynamicTheme => _get(DYNAMIC_THEME)?.value == 'true';

  bool get useDash => _get(USE_DASH)?.value == 'true';

  bool get useProxy => _get(USE_PROXY)?.value == 'true';

  bool get autoplayVideoOnLoad => _get(PLAYER_AUTOPLAY_ON_LOAD)?.value == 'true';

  bool get useReturnYoutubeDislike => _get(USE_RETURN_YOUTUBE_DISLIKE)?.value == 'true';

  bool get blackBackground => _get(BLACK_BACKGROUND)?.value == 'true';

  double get subtitleSize => double.parse(_get(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize);

  bool get rememberSubtitles => _get(REMEMBER_LAST_SUBTITLE)?.value == 'true';

  bool get skipSslVerification => _get(SKIP_SSL_VERIFICATION)?.value == 'true';

  bool get rememberPlayBackSpeed => _get(REMEMBER_PLAYBACK_SPEED)?.value == 'true';

  bool get forceLandscapeFullScreen => _get(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';

  bool get fillFullscreen => _get(FILL_FULLSCREEN)?.value == 'true';

  ThemeMode get themeMode => ThemeMode.values.firstWhere((element) => element.name == _get(THEME_MODE)?.value, orElse: () => ThemeMode.system);

  String? get locale => _get(LOCALE)?.value;

  bool get useSearchHistory => _get(USE_SEARCH_HISTORY)?.value == 'true';

  int get searchHistoryLimit => int.parse(_get(SEARCH_HISTORY_LIMIT)?.value ?? searchHistoryDefaultLength);

  set sponsorBlock(bool b) => _set(USE_SPONSORBLOCK, b);

  set country(Country c) {
    String code = countryCodes.firstWhere((element) => element.name == c.name, orElse: () => country).code;
    _set(BROWSING_COUNTRY, code);
  }

  set onOpen(int i) => _set(ON_OPEN, i);

  set useDynamicTheme(bool b) => _set(DYNAMIC_THEME, b);

  set useDash(bool b) => _set(USE_DASH, b);

  set useProxy(bool b) => _set(USE_PROXY, b);

  set autoplayVideoOnLoad(bool b) => _set(PLAYER_AUTOPLAY_ON_LOAD, b);

  set useReturnYoutubeDislike(bool b) => _set(USE_RETURN_YOUTUBE_DISLIKE, b);

  set blackBackground(bool b) => _set(BLACK_BACKGROUND, b);

  set subtitleSize(double d) => _set(SUBTITLE_SIZE, d);

  set rememberSubtitles(bool b) => _set(REMEMBER_LAST_SUBTITLE, b);

  set skipSslVerification(bool b) => _set(SKIP_SSL_VERIFICATION, b);

  set rememberPlayBackSpeed(bool b) => _set(REMEMBER_PLAYBACK_SPEED, b);

  set forceLandscapeFullScreen(bool b) => _set(LOCK_ORIENTATION_FULLSCREEN, b);

  set fillFullscreen(bool b) => _set(FILL_FULLSCREEN, b);

  set themeMode(ThemeMode t) => _set(THEME_MODE, t.name);

  set locale(String? s) => _set(LOCALE, s);

  set useSearchHistory(bool b) => _set(USE_SEARCH_HISTORY, b);

  set searchHistoryLimit(int b) => _set(SEARCH_HISTORY_LIMIT, b);

  void _set<T>(String name, T value) {
    var settingsValue = SettingsValue(name, value.toString());
    settings[name] = settingsValue;
    db.saveSetting(settingsValue);
  }

  SettingsValue? _get(String settingName) {
    if (settings.containsKey(settingName)) {
      return settings[settingName];
    } else {
      return null;
    }
  }

  SettingsState({Map<String, SettingsValue>? settings, List<Server>? dbServers, Server? currentServer, PackageInfo? packageInfo})
      : packageInfo = packageInfo ?? PackageInfo(appName: '', packageName: '', version: '', buildNumber: ''),
        settings = settings ?? {},
        dbServers = dbServers ?? db.getServers(),
        currentServer = currentServer ?? db.getCurrentlySelectedServer();
}
