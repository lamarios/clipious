import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../globals.dart';
import '../models/db/app_logs.dart';

part 'app_logs.freezed.dart';

class AppLogsCubit extends Cubit<AppLogsState> {
  AppLogsCubit(super.initialState);

  void selectLog(String id, bool? add) {
    var selected = List<String>.from(state.selected);
    if (add ?? false) {
      selected.add(id);
    } else {
      selected.remove(id);
    }
    emit(state.copyWith(selected: selected));
  }

  void copySelectedLogsToClipboard() {
    var selected = List<String>.from(state.selected);
    selected.sort();
    String toClipboard = state.logs
        .where((element) => selected.contains(element.uuid))
        .map((e) =>
            '[${e.level}] [${e.logger}] - ${e.time} - ${e.message} ${e.stacktrace != null ? '\n${e.stacktrace}' : ''}')
        .toList()
        .reversed
        .join("\n");

    Clipboard.setData(ClipboardData(text: toClipboard));

    emit(state.copyWith(selected: []));
  }

  void selectAll() {
    var state = this.state.copyWith();
    if (state.selected.isEmpty) {
      emit(state.copyWith(selected: state.logs.map((e) => e.uuid).toList()));
    } else {
      emit(state.copyWith(selected: []));
    }
  }
}

@freezed
sealed class AppLogsState with _$AppLogsState {
  const factory AppLogsState(
      {@Default([]) List<AppLog> logs,
      @Default([]) List<String> selected}) = _AppLogsState;

  static AppLogsState init() {
    return AppLogsState(logs: db.getAppLogs().reversed.toList());
  }
}
