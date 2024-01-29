import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../../settings/models/db/video_filter.dart';

part 'reset.freezed.dart';

final _log = Logger('DbResetCubit');

class DbResetCubit extends Cubit<DbResetState> {
  DbResetCubit(super.initialState) {
    init();
  }

  init() {
    // we don't want the user to be able to exit while the DB is migrating
    BackButtonInterceptor.add((stopDefaultButtonEvent, RouteInfo routeInfo) {
      return true;
    }, name: 'migrationInterceptor', zIndex: 0, ifNotYetIntercepted: true);
  }

  resetDb() async {
    try {
      emit(state.copyWith(loading: true));

      _log.fine('Starting to delete everything');

      // deleting everything from current app directory
      var appDir = await getApplicationDocumentsDirectory();

      await appDir.delete(recursive: true);

      _log.fine('Deletion complete');

      emit(state.copyWith(loading: false));
      exit(0);
    } catch (e) {
      log.severe("Error running migrations", e);
    }
  }

  _renameOldDb(String oldPath) {
    var db = Directory(oldPath);
    db.renameSync('$oldPath-old-${DateTime.now().millisecondsSinceEpoch}');
  }
}

@freezed
class DbResetState with _$DbResetState {
  const factory DbResetState({@Default(false) bool loading}) = _DbResetState;
}
