import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/services.dart';

import '../../globals.dart';
import '../models/db/app_logs.dart';

part 'app_logs.g.dart';

class AppLogsCubit extends Cubit<AppLogsState> {
  AppLogsCubit(super.initialState) {
    onInit();
  }

  void onInit() {
    state.logs = db.getAppLogs().reversed.toList();
  }

  void selectLog(int id, bool? value) {
    var state = this.state.copyWith();
    if (value ?? false) {
      state.selected.add(id);
    } else {
      state.selected.remove(id);
    }
    emit(state);
  }

  void copySelectedLogsToClipboard() {
    var state = this.state.copyWith();
    state.selected.sort();
    String toClipboard = state.logs
        .where((element) => state.selected.contains(element.id))
        .map((e) => '[${e.level}] [${e.logger}] - ${e.time} - ${e.message} ${e.stacktrace != null ? '\n${e.stacktrace}' : ''}')
        .toList()
        .reversed
        .join("\n");

    Clipboard.setData(ClipboardData(text: toClipboard));
    state.selected = [];

    emit(state);
  }

  void selectAll() {
    var state = this.state.copyWith();
    if (state.selected.isEmpty) {
      state.selected = state.logs.map((e) => e.id).toList(growable: true);
    } else {
      state.selected = [];
    }
    emit(state);
  }
}

@CopyWith()
class AppLogsState {
  List<AppLog> logs;

  List<int> selected;

  AppLogsState({List<AppLog>? logs, List<int>? selected})
      : logs = logs ?? [],
        selected = selected ?? [];
}
