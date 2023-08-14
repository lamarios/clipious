import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

part 'settingsController.g.dart';

const String subtitleDefaultSize = '14';
const String searchHistoryDefaultLength = '12';

var log = Logger('SettingsController');

class SettingsCubit extends Cubit<SettingsController> {
  SettingsCubit(super.initialState) {
    onReady();
  }

  onReady() {
    getPackageInfo();
  }

  emit(SettingsController state) {
    super.emit(state.copyWith());
  }

  toggleSponsorBlock(bool value) {
    db.saveSetting(SettingsValue(USE_SPONSORBLOCK, value.toString()));
    state.sponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
    emit(state);
  }

  toggleForceLandscapeFullScreen(bool value) {
    db.saveSetting(SettingsValue(LOCK_ORIENTATION_FULLSCREEN, value.toString()));
    state.forceLandscapeFullScreen = db.getSettings(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';
    emit(state);
  }

  toggleFillFullscreen(bool value) {
    db.saveSetting(SettingsValue(FILL_FULLSCREEN, value.toString()));
    state.fillFullscreen = db.getSettings(FILL_FULLSCREEN)?.value == 'true';
    emit(state);
  }

  toggleDynamicTheme(bool value) {
    db.saveSetting(SettingsValue(DYNAMIC_THEME, value.toString()));
    state.useDynamicTheme = value;
    emit(state);
    updateApp();
  }

  toggleDash(bool value) {
    db.saveSetting(SettingsValue(USE_DASH, value.toString()));
    state.useDash = value;
    emit(state);
  }

  toggleProxy(bool value) {
    db.saveSetting(SettingsValue(USE_PROXY, value.toString()));
    state.useProxy = value;
    emit(state);
  }

  toggleAutoplayOnLoad(bool value) {
    db.saveSetting(SettingsValue(PLAYER_AUTOPLAY_ON_LOAD, value.toString()));
    state.autoplayVideoOnLoad = value;
    emit(state);
  }

  toggleReturnYoutubeDislike(bool value) {
    db.saveSetting(SettingsValue(USE_RETURN_YOUTUBE_DISLIKE, value.toString()));
    state.useReturnYoutubeDislike = value;
    emit(state);
  }

  toggleSearchHistory(bool value) {
    db.saveSetting(SettingsValue(USE_SEARCH_HISTORY, value.toString()));
    state.useSearchHistory = value;
    emit(state);
    if (!value) {
      db.clearSearchHistory();
    }
  }

  toggleRememberPlaybackSpeed(bool value) {
    db.saveSetting(SettingsValue(REMEMBER_PLAYBACK_SPEED, value.toString()));
    state.rememberPlayBackSpeed = value;
    emit(state);
  }

  selectOnOpen(String selected, List<String> categories) {
    int selectedIndex = categories.indexOf(selected);
    db.saveSetting(SettingsValue(ON_OPEN, selectedIndex.toString()));
    state.onOpen = selectedIndex;
    emit(state);
  }

  void selectCountry(String selected) {
    String code = countryCodes.firstWhere((element) => element.name == selected, orElse: () => state.country).code;
    db.saveSetting(SettingsValue(BROWSING_COUNTRY, code));
    state.country = getCountryFromCode(code);
    emit(state);
  }

  serverChanged() {
    state.currentServer = db.getCurrentlySelectedServer();
    emit(state);
    HomeController.to()?.serverChanged();
  }

  toggleSslVerification(bool value) {
    db.saveSetting(SettingsValue(SKIP_SSL_VERIFICATION, value.toString()));
    state.skipSslVerification = value;
    emit(state);
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    state.packageInfo = packageInfo;
    emit(state);
  }

  toggleBlackBackground(bool value) {
    db.saveSetting(SettingsValue(BLACK_BACKGROUND, value.toString()));
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
    db.saveSetting(SettingsValue(SUBTITLE_SIZE, state.subtitleSize.toString()));
  }

  setSubtitleSize(int value) {
    if (value < 1) {
      state.subtitleSize = 1;
    } else {
      state.subtitleSize = value.toDouble();
    }

    emit(state);
    db.saveSetting(SettingsValue(SUBTITLE_SIZE, state.subtitleSize.toString()));
  }

  toggleRememberSubtitles(bool value) {
    db.saveSetting(SettingsValue(REMEMBER_LAST_SUBTITLE, value.toString()));
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
    db.saveSetting(SettingsValue(SEARCH_HISTORY_LIMIT, state.searchHistoryLimit.toString()));
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
    db.saveSetting(SettingsValue(SEARCH_HISTORY_LIMIT, state.searchHistoryLimit.toString()));
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
      db.saveSetting(SettingsValue(THEME_MODE, theme.name));
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
      db.saveSetting(SettingsValue(LOCALE, toSave));
    }
    emit(state);
    updateApp();
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
class SettingsController {
  List<Server> dbServers;

  Server currentServer;

  bool sponsorBlock;

  Country country;

  PackageInfo packageInfo;

  int onOpen;

  bool useDynamicTheme;

  bool useDash;

  bool useProxy;

  bool autoplayVideoOnLoad;

  bool useReturnYoutubeDislike;

  bool blackBackground;

  double subtitleSize;

  bool rememberSubtitles;

  bool skipSslVerification;

  bool rememberPlayBackSpeed;

  bool forceLandscapeFullScreen;

  bool fillFullscreen;

  ThemeMode themeMode;

  String? locale;

  bool useSearchHistory;

  int searchHistoryLimit;

  SettingsController({
    List<Server>? dbServers,
    Server? currentServer,
    bool? sponsorBlock,
    Country? country,
    PackageInfo? packageInfo,
    int? onOpen,
    bool? useDynamicTheme,
    bool? useDash,
    bool? useProxy,
    bool? autoplayVideoOnLoad,
    bool? useReturnYoutubeDislike,
    bool? blackBackground,
    double? subtitleSize,
    bool? rememberSubtitles,
    bool? skipSslVerification,
    bool? rememberPlayBackSpeed,
    bool? forceLandscapeFullScreen,
    bool? fillFullscreen,
    ThemeMode? themeMode,
    String? locale,
    bool? useSearchHistory,
    int? searchHistoryLimit,
  })  : dbServers = dbServers ?? db.getServers(),
        currentServer = currentServer ?? db.getCurrentlySelectedServer(),
        sponsorBlock = sponsorBlock ?? db.getSettings(USE_SPONSORBLOCK)?.value == 'true',
        country = country ?? getCountryFromCode(db.getSettings(BROWSING_COUNTRY)?.value ?? 'US'),
        packageInfo = packageInfo ?? PackageInfo(appName: '', packageName: '', version: '', buildNumber: ''),
        onOpen = onOpen ?? int.parse(db.getSettings(ON_OPEN)?.value ?? '0'),
        useDynamicTheme = useDynamicTheme ?? db.getSettings(DYNAMIC_THEME)?.value == 'true',
        useDash = useDash ?? db.getSettings(USE_DASH)?.value == 'true',
        useProxy = useProxy ?? db.getSettings(USE_PROXY)?.value == 'true',
        autoplayVideoOnLoad = autoplayVideoOnLoad ?? db.getSettings(PLAYER_AUTOPLAY_ON_LOAD)?.value == 'true',
        useReturnYoutubeDislike = useReturnYoutubeDislike ?? db.getSettings(USE_RETURN_YOUTUBE_DISLIKE)?.value == 'true',
        blackBackground = blackBackground ?? db.getSettings(BLACK_BACKGROUND)?.value == 'true',
        subtitleSize = subtitleSize ?? double.parse(db.getSettings(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize),
        rememberSubtitles = rememberSubtitles ?? db.getSettings(REMEMBER_LAST_SUBTITLE)?.value == 'true',
        skipSslVerification = skipSslVerification ?? db.getSettings(SKIP_SSL_VERIFICATION)?.value == 'true',
        rememberPlayBackSpeed = rememberPlayBackSpeed ?? db.getSettings(REMEMBER_PLAYBACK_SPEED)?.value == 'true',
        forceLandscapeFullScreen = forceLandscapeFullScreen ?? db.getSettings(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true',
        fillFullscreen = fillFullscreen ?? db.getSettings(FILL_FULLSCREEN)?.value == 'true',
        themeMode = themeMode ?? ThemeMode.values.firstWhere((element) => element.name == db.getSettings(THEME_MODE)?.value, orElse: () => ThemeMode.system),
        locale = locale ?? db.getSettings(LOCALE)?.value,
        useSearchHistory = useSearchHistory ?? db.getSettings(USE_SEARCH_HISTORY)?.value == 'true',
        searchHistoryLimit = searchHistoryLimit ?? int.parse(db.getSettings(SEARCH_HISTORY_LIMIT)?.value ?? searchHistoryDefaultLength);
}
