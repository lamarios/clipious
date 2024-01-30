import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/utils/sembast_sqflite_database.dart';

import '../../test_app_cubit.dart';
import '../../test_settings_cubit.dart';

Future<void> main() async {
  late SettingsCubit settingsCubit;
  setUp(() async {
    db = await SembastSqfDb.createInMemory();
    var appCubit = TestAppCubit(AppState(0, null, HomeLayout()));
    await appCubit.initState();
    settingsCubit = TestSettingsCubit(SettingsState.init(), appCubit);
  });
  tearDown(() async => await db.close());

  test('setting and reading settings', () async {
    // testing boolean setting
    await settingsCubit.setUseSearchHistory (true);
    expect(settingsCubit.state.useSearchHistory, true);

    // testing numbers
await    settingsCubit.setSubtitleSize (10);
    expect(settingsCubit.state.subtitleSize, 10);

    //testing strings
    await settingsCubit.setLastSubtitle("en_US");
    expect(settingsCubit.state.lastSubtitles, "en_US");

    // testing skip steps
 await   settingsCubit.setSkipStep(skipSteps.first);
    expect(settingsCubit.state.skipStep, skipSteps.first);

    for (int i = 1; i < skipSteps.length; i++) {
     await settingsCubit.changeSkipStep(increase: true);
      expect(settingsCubit.state.skipStep, skipSteps[i]);
    }

    await settingsCubit.changeSkipStep(increase: true);
    // should remain to the max
    expect(settingsCubit.state.skipStep, skipSteps.last);

    await settingsCubit.setSkipStep ( skipSteps.last);
    expect(settingsCubit.state.skipStep, skipSteps.last);
    for (int i = skipSteps.length - 2; i > 0; i--) {
     await settingsCubit.changeSkipStep(increase: false);
      expect(settingsCubit.state.skipStep, skipSteps[i]);
    }
  });

  test('Generic set settings method', () async {
    var setting = db.getSettings('test');
    expect(setting, null);

    SettingsValue s = SettingsValue('test', 'yo');
    await settingsCubit.saveSetting(s);
    expect(db.getSettings('test')?.value, 'yo');

  });
}
