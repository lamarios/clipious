import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/homeController.dart';
import 'package:locale_names/locale_names.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../database.dart';
import '../globals.dart';
import '../models/country.dart';
import '../models/db/server.dart';
import '../models/db/settings.dart';
import '../utils.dart';
import 'appController.dart';

const String subtitleDefaultSize = '14';
const String searchHistoryDefaultLength = '12';

class SettingsController extends GetxController {
  static SettingsController? to() => safeGet();
  var log = Logger('SettingsController');
  List<Server> dbServers = db.getServers();
  Server currentServer = db.getCurrentlySelectedServer();
  bool sponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  Country country = getCountryFromCode(db.getSettings(BROWSING_COUNTRY)?.value ?? 'US');
  PackageInfo packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');
  int onOpen = int.parse(db.getSettings(ON_OPEN)?.value ?? '0');
  bool useDynamicTheme = db.getSettings(DYNAMIC_THEME)?.value == 'true';
  bool useDash = db.getSettings(USE_DASH)?.value == 'true';
  bool useProxy = db.getSettings(USE_PROXY)?.value == 'true';
  bool autoplayVideoOnLoad = db.getSettings(PLAYER_AUTOPLAY_ON_LOAD)?.value == 'true';
  bool useReturnYoutubeDislike = db.getSettings(USE_RETURN_YOUTUBE_DISLIKE)?.value == 'true';
  bool blackBackground = db.getSettings(BLACK_BACKGROUND)?.value == 'true';
  double subtitleSize = double.parse(db.getSettings(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize);
  bool rememberSubtitles = db.getSettings(REMEMBER_LAST_SUBTITLE)?.value == 'true';
  bool skipSslVerification = db.getSettings(SKIP_SSL_VERIFICATION)?.value == 'true';
  bool rememberPlayBackSpeed = db.getSettings(REMEMBER_PLAYBACK_SPEED)?.value == 'true';
  bool forceLandscapeFullScreen = db.getSettings(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';
  bool fillFullscreen = db.getSettings(FILL_FULLSCREEN)?.value == 'true';
  ThemeMode themeMode = ThemeMode.values.firstWhere((element) => element.name == db.getSettings(THEME_MODE)?.value, orElse: () => ThemeMode.system);
  String? locale = db.getSettings(LOCALE)?.value;
  bool useSearchHistory = db.getSettings(USE_SEARCH_HISTORY)?.value == 'true';
  int searchHistoryLimit = int.parse(db.getSettings(SEARCH_HISTORY_LIMIT)?.value ?? searchHistoryDefaultLength);

  @override
  onReady() {
    super.onReady();
    getPackageInfo();
  }

  toggleSponsorBlock(bool value) {
    db.saveSetting(SettingsValue(USE_SPONSORBLOCK, value.toString()));
    sponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
    update();
  }

  toggleForceLandscapeFullScreen(bool value) {
    db.saveSetting(SettingsValue(LOCK_ORIENTATION_FULLSCREEN, value.toString()));
    forceLandscapeFullScreen = db.getSettings(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';
    update();
  }

  toggleFillFullscreen(bool value){
    db.saveSetting(SettingsValue(FILL_FULLSCREEN, value.toString()));
    fillFullscreen = db.getSettings(FILL_FULLSCREEN)?.value == 'true';
    update();
  }

  toggleDynamicTheme(bool value) {
    db.saveSetting(SettingsValue(DYNAMIC_THEME, value.toString()));
    useDynamicTheme = value;
    update();
    updateApp();
  }

  toggleDash(bool value) {
    db.saveSetting(SettingsValue(USE_DASH, value.toString()));
    useDash = value;
    update();
  }

  toggleProxy(bool value) {
    db.saveSetting(SettingsValue(USE_PROXY, value.toString()));
    useProxy = value;
    update();
  }

  toggleAutoplayOnLoad(bool value) {
    db.saveSetting(SettingsValue(PLAYER_AUTOPLAY_ON_LOAD, value.toString()));
    autoplayVideoOnLoad = value;
    update();
  }

  toggleReturnYoutubeDislike(bool value) {
    db.saveSetting(SettingsValue(USE_RETURN_YOUTUBE_DISLIKE, value.toString()));
    useReturnYoutubeDislike = value;
    update();
  }

  toggleSearchHistory(bool value) {
    db.saveSetting(SettingsValue(USE_SEARCH_HISTORY, value.toString()));
    useSearchHistory = value;
    update();
    if (!value) {
      db.clearSearchHistory();
    }
  }

  toggleRememberPlaybackSpeed(bool value) {
    db.saveSetting(SettingsValue(REMEMBER_PLAYBACK_SPEED, value.toString()));
    rememberPlayBackSpeed = value;
    update();
  }

  selectOnOpen(String selected, List<String> categories) {
    int selectedIndex = categories.indexOf(selected);
    db.saveSetting(SettingsValue(ON_OPEN, selectedIndex.toString()));
    onOpen = selectedIndex;
    update();
  }

  void selectCountry(String selected) {
    String code = countryCodes.firstWhere((element) => element.name == selected, orElse: () => country).code;
    db.saveSetting(SettingsValue(BROWSING_COUNTRY, code));
    country = getCountryFromCode(code);
    update();
  }

  serverChanged() {
    currentServer = db.getCurrentlySelectedServer();
    update();
    HomeController.to()?.serverChanged();
  }

  toggleSslVerification(bool value) {
    db.saveSetting(SettingsValue(SKIP_SSL_VERIFICATION, value.toString()));
    skipSslVerification = value;
    update();
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    this.packageInfo = packageInfo;
    update();
  }

  toggleBlackBackground(bool value) {
    db.saveSetting(SettingsValue(BLACK_BACKGROUND, value.toString()));
    blackBackground = value;
    update();
    AppController.to()?.update();
  }

  changeSubtitleSize({required bool increase}) {
    if (increase) {
      subtitleSize++;
    } else {
      if (subtitleSize > 1) {
        subtitleSize--;
      }
    }
    update();
    db.saveSetting(SettingsValue(SUBTITLE_SIZE, subtitleSize.toString()));
  }

  setSubtitleSize(int value) {
    if (value < 1) {
      subtitleSize = 1;
    } else {
      subtitleSize = value.toDouble();
    }

    update();
    db.saveSetting(SettingsValue(SUBTITLE_SIZE, subtitleSize.toString()));
  }

  toggleRememberSubtitles(bool value) {
    db.saveSetting(SettingsValue(REMEMBER_LAST_SUBTITLE, value.toString()));
    rememberSubtitles = value;
    update();
  }

  changeSearchHistoryLimit({required bool increase}) {
    if (increase) {
      if (searchHistoryLimit < 30) {
        searchHistoryLimit++;
      }
    } else {
      if (searchHistoryLimit > 1) {
        searchHistoryLimit--;
      }
    }
    update();
    db.saveSetting(SettingsValue(SEARCH_HISTORY_LIMIT, searchHistoryLimit.toString()));
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

    update();
    db.saveSetting(SettingsValue(SEARCH_HISTORY_LIMIT, searchHistoryLimit.toString()));
    if (value < searchHistoryLimit) {
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
      db.saveSetting(SettingsValue(THEME_MODE, theme.name));
    }
    update();
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
      db.saveSetting(SettingsValue(LOCALE, toSave));
    }
    update();
    updateApp();
  }

  updateApp() {
    AppController.to()?.update();
  }

  String? getLocaleDisplayName() {
    List<String>? localeString = locale?.split('_');
    Locale? l = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

    return l?.nativeDisplayLanguageScript;
  }
}
