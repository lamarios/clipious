import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/states/settings.dart';

import '../../test_app_cubit.dart';
import '../../test_settings_cubit.dart';
import '../../utils/memorydb.dart';

Future<void> main() async {
  late SettingsCubit settingsCubit;
  setUp(() {
    db = MemoryDB();
    var appCubit = TestAppCubit(AppState.init());
    settingsCubit = TestSettingsCubit(SettingsState.init(), appCubit);
  });

  test('setting and reading settings', () {
    // testing boolean setting
    settingsCubit.useSearchHistory = true;
    expect(settingsCubit.state.useSearchHistory, true);

    // testing numbers
    settingsCubit.subtitleSize = 10;
    expect(settingsCubit.state.subtitleSize, 10);

    //testing strings
    settingsCubit.locale = "en_US";
    expect(settingsCubit.state.locale, "en_US");

    // testing skip steps
    settingsCubit.skipStep = skipSteps.first;
    expect(settingsCubit.state.skipStep, skipSteps.first);

    for (int i = 1; i < skipSteps.length; i++) {
      settingsCubit.changeSkipStep(increase: true);
      expect(settingsCubit.state.skipStep, skipSteps[i]);
    }

    settingsCubit.changeSkipStep(increase: true);
    // should remain to the max
    expect(settingsCubit.state.skipStep, skipSteps.last);

    settingsCubit.skipStep = skipSteps.last;
    expect(settingsCubit.state.skipStep, skipSteps.last);
    for (int i = skipSteps.length - 2; i > 0; i--) {
      settingsCubit.changeSkipStep(increase: false);
      expect(settingsCubit.state.skipStep, skipSteps[i]);
    }
  });

  test('Generic set settings method', () {
    var setting = db.getSettings('test');
    expect(setting, null);

    SettingsValue s = SettingsValue('test', 'yo');
    settingsCubit.saveSetting(s);
    expect(db.getSettings('test')?.value, 'yo');

  });
}
