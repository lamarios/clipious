import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/app_logs.dart';
import 'package:invidious/settings/states/app_logs.dart';
import 'package:invidious/utils/sembast_sqflite_database.dart';


Future<void> main() async {

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    db = await SembastSqfDb.createInMemory();
  });

  tearDown(() async => await db.close());
  test('test logs', () async {
    // inserting more than expected ot make sure old stuff is culled
    for (int i = 0; i < 200; i++) {
      await db.insertLogs(AppLog(message: i.toString(), level: "info", logger: 'test_log', time: DateTime.now()));
    }

    // we should be cutting old stuff
    var cubit = AppLogsCubit(AppLogsState.init());
    // we don't exactly know when the logs are going to be cleaned up
    expect(cubit.state.logs.isEmpty, false);

    cubit.selectLog(cubit.state.logs[10].uuid, true);
    expect(cubit.state.selected.length, 1);
    cubit.selectLog(cubit.state.logs[10].uuid, false);
    expect(cubit.state.selected.length, 0);

    cubit.selectAll();
    expect(cubit.state.selected.length, cubit.state.logs.length);
  });
}
