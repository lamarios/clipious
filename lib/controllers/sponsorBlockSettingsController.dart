import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/models/sponsorSegmentTypes.dart';

class SponsorBlockSettingsController extends GetxController {
  bool value(SponsorSegmentType t) => db.getSettings(t.settingsName())?.value == 'true';

  setValue(SponsorSegmentType t, bool value) {
    db.saveSetting(SettingsValue(t.settingsName(), value.toString()));
    update();
  }
}
