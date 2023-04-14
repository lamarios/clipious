import 'package:get/get.dart';
import 'package:invidious/controllers/homeController.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../database.dart';
import '../globals.dart';
import '../models/country.dart';
import '../models/db/server.dart';
import '../models/db/settings.dart';
import '../utils.dart';

const String subtitleDefaultSize = '14';

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
  bool blackBackground = db.getSettings(BLACK_BACKGROUND)?.value == 'true';
  double subtitleSize = double.parse(db.getSettings(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize);

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

  toggleDynamicTheme(bool value) {
    db.saveSetting(SettingsValue(DYNAMIC_THEME, value.toString()));
    useDynamicTheme = value;
    update();
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

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    this.packageInfo = packageInfo;
    update();
  }

  toggleBlackBackground(bool value) {
    db.saveSetting(SettingsValue(BLACK_BACKGROUND, value.toString()));
    blackBackground = value;
    update();
  }

  changeSubtitleSize({required bool increase}) {
    if(increase){
        subtitleSize++;
    }else {
      if (subtitleSize > 1) {
        subtitleSize--;
      }
    }
    update();
    db.saveSetting(SettingsValue(SUBTITLE_SIZE, subtitleSize.toString()));
  }
}
