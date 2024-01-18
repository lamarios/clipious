import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../app/states/app.dart';
import '../../globals.dart';
import '../models/db/server.dart';

part 'server_settings.freezed.dart';

class ServerSettingsCubit extends Cubit<ServerSettingsState> {
  final AppCubit app;

  ServerSettingsCubit(super.initialState, this.app) {
    canDelete();
  }

  useServer(bool value) async {
    await db.useServer(state.server);
    await fileDb.useServer(state.server);
    Server s = state.server.copyWith(inUse: true);
    s.inUse = true;
    emit(state.copyWith(server: s));
    app.setServer(state.server);
  }

  Future<void> logOut() async {
    Server s = state.server.copyWith();
    s.sidCookie = null;
    s.authToken = null;
    await db.upsertServer(s);
    if (s.inUse) {
      await fileDb.useServer(s);
    }
    emit(state.copyWith(server: s));
    // we only refresh the app if the app is currently on this server
    if (app.state.server?.url == s.url) {
      app.setServer(s.copyWith());
    }
  }

  Future<void> logInWithToken() async {
    var s = state.server.copyWith();
    await service.logIn(s.url);
    Server server = db.getServer(s.url)!;
    emit(state.copyWith(server: s));
    // we only refresh the app if the app is currently on this server
    if (app.state.server?.url == server.url) {
      app.setServer(server.copyWith());
    }
  }

  Future<void> logInWithCookie(String username, String password) async {
    var s = state.server.copyWith();
    String cookie = await service.loginWithCookies(s.url, username, password);

    s.sidCookie = cookie;
    await db.upsertServer(s);
    if (s.inUse) {
      fileDb.useServer(s);
    }
    emit(state.copyWith(server: s));
    // we only refresh the app if the app is currently on this server
    if (app.state.server?.url == s.url) {
      app.setServer(s);
    }
  }

  deleteServer() async {
    await db.deleteServer(state.server);

    Server currentServer = await db.getCurrentlySelectedServer();
    emit(state.copyWith());
    app.setServer(currentServer);
  }

  Future<void> canDelete() async {
    bool canDelete = (await db.getServers()).length > 1;
    emit(state.copyWith(canDelete: canDelete));
  }
}

/*
class ServerSettingsController {
  late Server server;


  ServerSettingsController(this.server);

}
*/

@freezed
class ServerSettingsState with _$ServerSettingsState {
  const factory ServerSettingsState(
      {required Server server,
      @Default(false) bool canDelete}) = _ServerSettingsState;
}
