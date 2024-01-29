import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

final _logs = Logger('Migration utils');

Future<bool> needsReset() async {
  var dir = await getApplicationDocumentsDirectory();
  var files = dir.listSync();
  var count =
      files.where((element) => element.path.contains("impuc-data")).length;
  _logs.fine('Found legacy folder, we need to reset the app');
  return count > 0;
}

Future<void> clearIsar() async {}
