import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/app/states/app.dart';
import 'package:clipious/workmanager.dart';
import 'package:locale_names/locale_names.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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

var _log = Logger('SettingsController');

class SettingsCubit extends Cubit<SettingsState> {
  final AppCubit appCubit;

  SettingsCubit(super.initialState, this.appCubit) {
    onReady();
  }

  onReady() async {
    await getPackageInfo();
    await _getSubscriptionNotification();
  }

  toggleSponsorBlock(bool value) async {
    await setSponsorBlock(value);
  }

  toggleForceLandscapeFullScreen(bool value) async {
    await setForceLandscapeFullScreen(value);
  }

  toggleFillFullscreen(bool value) async {
    await setFillFullscreen(value);
  }

  toggleDynamicTheme(bool value) async {
    await setUseDynamicTheme(value);
    updateApp();
  }

  toggleDash(bool value) async {
    await setUseDash(value);
  }

  toggleProxy(bool value) async {
    await setUseProxy(value);
  }

  toggleAutoplayOnLoad(bool value) async {
    await setAutoplayVideoOnLoad(value);
  }

  toggleReturnYoutubeDislike(bool value) async {
    await setUseReturnYoutubeDislike(value);
  }

  toggleSearchHistory(bool value) async {
    await setUseSearchHistory(value);
    if (!value) {
      await db.clearSearchHistory();
    }
  }

  toggleRememberPlaybackSpeed(bool value) async {
    await setRememberPlayBackSpeed(value);
  }

  selectOnOpen(int index) async {
    await setOnOpen(index);
  }

  Future<void> selectCountry(String selected) async {
    await setCountry(countryCodes.firstWhere(
        (element) => element.name == selected,
        orElse: () => state.country));
  }

  serverChanged() {
    emit(state.copyWith());
  }

  toggleSslVerification(bool value) async {
    await setSkipSslVerification(value);
  }

  getPackageInfo() async {
    emit(state.copyWith(packageInfo: packageInfo!));
  }

  toggleBlackBackground(bool value) async {
    await setBlackBackground(value);
    appCubit.rebuildApp();
  }

  changeSkipStep({required bool increase}) async {
    int index = skipSteps.indexOf(state.skipStep);
    if (increase) {
      if (index < skipSteps.length - 1) {
        await setSkipStep(skipSteps[index + 1]);
      }
    } else {
      if (index > 0) {
        await setSkipStep(skipSteps[index - 1]);
      }
    }
  }

  changeSubtitleSize({required bool increase}) async {
    if (increase) {
      await _setSubtitleSize(state.subtitleSize + 1);
    } else {
      if (state.subtitleSize > 1) {
        await _setSubtitleSize(state.subtitleSize - 1);
      }
    }
  }

  setSubtitleSize(int value) async {
    if (value < 1) {
      await _setSubtitleSize(1);
    } else {
      await _setSubtitleSize(value.toDouble());
    }
  }

  toggleRememberSubtitles(bool value) async {
    await setRememberSubtitles(value);
  }

  changeSearchHistoryLimit({required bool increase}) async {
    if (increase) {
      if (state.searchHistoryLimit < 30) {
        await setSearchHistoryLimit(state.searchHistoryLimit + 1);
      }
    } else {
      if (state.searchHistoryLimit > 1) {
        await setSearchHistoryLimit(state.searchHistoryLimit - 1);
      }
    }
    if (!increase) {
      await db.clearExcessSearchHistory();
    }
  }

  setHistoryLimit(int value) async {
    if (value < 1) {
      await setSearchHistoryLimit(1);
    } else if (value <= 30) {
      await setSearchHistoryLimit(value);
    }

    if (value < state.searchHistoryLimit) {
      await db.clearExcessSearchHistory();
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

  setThemeMode(ThemeMode? theme) async {
    if (theme != null) {
      await _setThemeMode(theme);
    }
    updateApp();
  }

  setLocale(
      List<Locale> locals, List<String> localStrings, String? locale) async {
    if (locale == null) {
      await db.deleteSetting(localeSettingName);
      _setLocale(null);
    } else {
      var selectedIndex = localStrings.indexOf(locale);

      Locale selectedLocale = locals[selectedIndex];

      String toSave = selectedLocale.languageCode;
      if (selectedLocale.scriptCode != null) {
        toSave += '_${selectedLocale.scriptCode}';
      }

      _setLocale(toSave);
    }
    updateApp();
  }

  updateApp() {
    appCubit.rebuildApp();
  }

  setShuffle(bool b) async {
    await setPlayerShuffleMode(b);
  }

  setRepeatMode(PlayerRepeat repeat) async {
    await setPlayerRepeatMode(repeat);
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

  setLastSubtitle(String s) async {
    await setLastSubtitles(s);
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

  Future<EnableBackGroundNotificationResponse> setBackgroundNotifications(
      bool b) async {
    if (!b) {
      await stopTasks();
      await _setBackgroundNotifications(b);
    } else {
      var isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        var allowed =
            await AwesomeNotifications().requestPermissionToSendNotifications();
        if (!allowed) {
          return EnableBackGroundNotificationResponse.notificationsNotAllowed;
        }
      }

      await _setBackgroundNotifications(b);
      await configureBackgroundService(this);
      await setupTasks(this);
      return EnableBackGroundNotificationResponse.ok;
    }

    return EnableBackGroundNotificationResponse.ok;
  }

  setBackgroundCheckFrequency(int i) async {
    if (i > 0 && i <= 24) {
      await setBackgroundNotificationFrequency(i);
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

  saveSetting(SettingsValue settings) async {
    await db.saveSetting(settings);
    var newSettings = Map<String, SettingsValue>.from(state.settings);
    newSettings[settings.name] = settings;
    emit(state.copyWith(settings: newSettings));
  }

  setSponsorBlock(bool b) async => await _set(useSponsorBlock, b);

  setOnOpen(int i) async => await _set(onOpenSettingName, i);

  setUseProxy(bool b) async => await _set(useProxySettingName, b);

  setBlackBackground(bool b) async => await _set(blackBackgroundSettingName, b);

  setRememberSubtitles(bool b) async => await _set(rememberLastSubtitle, b);

  setRememberPlayBackSpeed(bool b) async => await _set(remeberPlaybackSpeed, b);

  setFillFullscreen(bool b) async => await _set(fillFullScreen, b);

  setForceTvUi(bool b) async => await _set(forceTvUiSettingName, b);

  _setLocale(String? s) async {
    await _set(localeSettingName, s);
    await fileDb.setLocale(s);
  }

  setSearchHistoryLimit(int b) async =>
      await _set(searchHistoryLimitSettingName, b);

  setLastSpeed(double d) async => await _set(lastSpeedSettingName, d);

  setPlayerShuffleMode(bool b) async => await _set(playerShuffle, b);

  setPlayerRepeatMode(PlayerRepeat repeatMode) async =>
      await _set(playerRepeat, PlayerRepeat.values.indexOf(repeatMode));

  setLastSubtitles(String s) async => await _set(lastSubtitle, s);

  setPlayRecommendedNext(bool b) async =>
      await _set(playRecommendedNextSettingName, b);

  setCountry(Country c) {
    String code = countryCodes
        .firstWhere((element) => element.name == c.name,
            orElse: () => state.country)
        .code;
    _set(browsingCountry, code);
  }

  setUseDynamicTheme(bool b) async => await _set(dynamicTheme, b);

  setUseDash(bool b) async => await _set(useDashSettingName, b);

  setAutoplayVideoOnLoad(bool b) async => await _set(playerAutoplayOnLoad, b);

  setUseReturnYoutubeDislike(bool b) async =>
      await _set(useReturnYoutubeDislikeSettingName, b);

  _setSubtitleSize(double d) async => await _set(subtitleSizeSettingName, d);

  setSkipSslVerification(bool b) async =>
      await _set(skipSslVerificationSettingName, b);

  setForceLandscapeFullScreen(bool b) async =>
      await _set(lockOrientationFullScreen, b);

  _setThemeMode(ThemeMode t) async => await _set(themeModeSettingName, t.name);

  setUseSearchHistory(bool b) async =>
      await _set(useSearchHistorySettingName, b);

  setAppLayout(List<HomeDataSource> layout) async {
    var layoutToString = layout.map((e) => e.name).join(",");
    await _set(appLayoutSettingName, layoutToString);
  }

  setNavigationBarLabelBehavior(
          NavigationDestinationLabelBehavior behavior) async =>
      await _set(navigationBarLabelBehaviorSettingName, behavior.name);

  setDistractionFreeMode(bool b) async =>
      await _set(distractionFreeModeSettingName, b);

  _setBackgroundNotifications(bool b) async =>
      await _set(backgroundNotificationsSettingName, b);

  setBackgroundNotificationFrequency(int i) async =>
      await _set(backgroundCheckFrequency, i);

  setSubtitlesBackground(bool b) async => await _set(subtitleBackground, b);

  setDearrow(bool b) async => await _set(dearrowSettingName, b);

  setDearrowThumbnails(bool b) async =>
      await _set(dearrowThumbnailsSettingName, b);

  setSkipStep(int s) async => await _set(skipStepSettingName, s);

  setSkipExponentially(bool b) async =>
      await _set(skipExponentialSettingName, b);

  setFullscreenOnRotate(bool b) async =>
      await _set(fullScreenOnLandscapeSettingName, b);

  setScreenControls(bool b) async => await _set(screenControlsSettingName, b);

  setReturnYoutubeDislikeUrl(String url) async =>
      await _set(returnYoutubeDislikeUrlSettingName, url);

  Future<void> _set<T>(String name, T value) async {
    var settings = Map<String, SettingsValue>.from(state.settings);
    if (value == null) {
      await db.deleteSetting(name);
      settings.remove(name);
    } else {
      var settingsValue = SettingsValue(name, value.toString());
      settings[name] = settingsValue;
      await db.saveSetting(settingsValue);
    }

    emit(state.copyWith(settings: settings));
  }

  setSubscriptionsNotifications(bool value) async {
    await fileDb.setSubscriptionNotifications(value);
    await _getSubscriptionNotification();
  }

  _getSubscriptionNotification() async {
    emit(state.copyWith(
        subscriptionNotifications:
            await fileDb.getSubscriptionNotifications()));
  }

  sendFeedBack(UserFeedback feedback) async {
    try {
      appCubit.setGlobalLoading(true);
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      final androidInfo = deviceInfo.version;

      final firstLine = feedback.text.split('\n')[0];

      String body =
          '**Runtime info:**\n[Device] Manufacturer: ${deviceInfo.manufacturer} / Brand: ${deviceInfo.brand} / Model: ${deviceInfo.model} / Hardware: ${deviceInfo.hardware}';
      body +=
          '\n[Android] Version: ${androidInfo.release}.${androidInfo.incremental} (${androidInfo.codename})';
      body +=
          '\n[Clipious] Version: ${state.packageInfo.version} Build: ${state.packageInfo.buildNumber}';

      body += '\n\n\n**Feedback:**\n${feedback.text}\n\n\n';

      String screenshotUrl =
          await service.uploadImageToImgur(base64Encode(feedback.screenshot));
      body += '\n**Screenshot:**\n![app screenshot]($screenshotUrl)';

      final url =
          'https://github.com/lamarios/clipious/issues/new?title=${Uri.encodeComponent('[App Feedback] $firstLine')}&body=${Uri.encodeComponent(body)}';
      await launchUrl(Uri.parse(url));
    } catch (err) {
      _log.severe("Issue while submitting feedback", err);
      rethrow;
    } finally {
      appCubit.setGlobalLoading(false);
    }
  }
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState(
      {required Map<String, SettingsValue> settings,
      required PackageInfo packageInfo,
      @Default(false) subscriptionNotifications}) = _SettingsState;

  static SettingsState init() {
    PackageInfo packageInfo =
        PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');
    var allSettings = db.getAllSettings();
    var settings = {for (var s in allSettings) s.name: s};

    return SettingsState(settings: settings, packageInfo: packageInfo);
  }

  //late Map<String, SettingsValue> settings;

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

  bool get useDash => (_get(useDashSettingName)?.value ?? 'true') == 'true';

  bool get autoplayVideoOnLoad => _get(playerAutoplayOnLoad)?.value == 'true';

  bool get useReturnYoutubeDislike =>
      _get(useReturnYoutubeDislikeSettingName)?.value == 'true';

  String get returnYoutubeDislikeUrl =>
      _get(returnYoutubeDislikeUrlSettingName)?.value ?? '';

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

  bool get screenControls =>
      (_get(screenControlsSettingName)?.value ?? 'true') == 'true';

  bool get forceTvUi =>
      (_get(forceTvUiSettingName)?.value ?? 'false') == 'true';

  List<HomeDataSource> get appLayout {
    var savedLayout = _get(appLayoutSettingName)?.value;
    // String? savedLayout;
    var defaultLayout = HomeDataSource.defaultSettings();
    return (savedLayout ?? defaultLayout.map((e) => e.name).join(","))
        .split(',')
        .where((element) => element.isNotEmpty)
        .map((e) =>
            HomeDataSource.values.firstWhere((element) => element.name == e))
        .toList();
  }

  NavigationDestinationLabelBehavior get navigationBarLabelBehavior =>
      NavigationDestinationLabelBehavior.values.firstWhere((e) =>
          e.name ==
          (_get(navigationBarLabelBehaviorSettingName)?.value ??
              NavigationDestinationLabelBehavior.onlyShowSelected.name));

  bool get distractionFreeMode =>
      _get(distractionFreeModeSettingName)?.value == "true";

  bool get backgroundNotifications =>
      _get(backgroundNotificationsSettingName)?.value == 'true';

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
