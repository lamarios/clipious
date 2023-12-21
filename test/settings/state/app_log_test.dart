import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/app_logs.dart';
import 'package:invidious/settings/states/app_logs.dart';
import 'package:logging/logging.dart';

import '../../utils/memorydb.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  db = MemoryDB();
  test('test logs', () {
    // inserting more than expected ot make sure old stuff is culled
    for (int i = 0; i < 200; i++) {
      db.insertLogs(AppLog(message: i.toString(), level: "info", logger: 'test_log', time: DateTime.now()));
    }

    // we should be cutting old stuff
    var cubit = AppLogsCubit(AppLogsState.init());
    expect(cubit.state.logs.length, 20);

    cubit.selectLog(cubit.state.logs[10].id, true);
    expect(cubit.state.selected.length, 1);
    cubit.selectLog(cubit.state.logs[10].id, false);
    expect(cubit.state.selected.length, 0);

    cubit.selectAll();
    expect(cubit.state.selected.length, cubit.state.logs.length);
  });
}
