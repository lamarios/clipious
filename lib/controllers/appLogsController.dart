import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../globals.dart';
import '../models/db/appLog.dart';

class AppLogsController extends GetxController {
  List<AppLog> logs = [];
  List<int> selected = [];

  @override
  void onInit() {
    super.onInit();
    logs = db.getAppLogs().reversed.toList();
  }

  void selectLog(int id, bool? value) {
    if (value ?? false) {
      selected.add(id);
    } else {
      selected.remove(id);
    }
    update();
  }

  void copySelectedLogsToClipboard() {
    selected.sort();
    String toClipboard = logs
        .where((element) => selected.contains(element.id))
        .map((e) => '[${e.level}] [${e.logger}] - ${e.time} - ${e.message} ${e.stacktrace != null ? '\n${e.stacktrace}' : ''}')
        .toList()
        .reversed
        .join("\n");

    Clipboard.setData(ClipboardData(text: toClipboard));
    selected = [];

    update();
  }

  void selectAll() {
    if (selected.isEmpty) {
      selected = logs.map((e) => e.id).toList(growable: true);
    } else {
      selected = [];
    }
    update();
  }
}
