import 'package:bloc/bloc.dart';

import '../../app/states/app.dart';
import '../../database.dart';
import '../../globals.dart';
import '../models/db/server.dart';

class ServerSettingsCubit extends Cubit<Server> {
  final AppCubit app;

  ServerSettingsCubit(super.initialState, this.app);

  useServer(bool value) {
    db.useServer(state);
    state.inUse = true;
    emit(state);
    app.setServer(state);
  }

  void logOut() {
    Server s = state;
    s.sidCookie = null;
    s.authToken = null;
    db.upsertServer(s);
    emit(s);
    // we only refresh the app if the app is currently on this server
    if (app.state.server?.url == s.url) {
      app.setServer(s.copyWith());
    }
  }

  Future<void> logInWithToken() async {
    await service.logIn(state.url);
    Server server = db.getServer(state.url)!;
    emit(server);
    // we only refresh the app if the app is currently on this server
    if (app.state.server?.url == server.url) {
      app.setServer(server.copyWith());
    }
  }

  Future<void> logInWithCookie(String username, String password) async {
    var state = this.state.copyWith();
    String cookie = await service.loginWithCookies(state.url, username, password);

    state.sidCookie = cookie;
    db.upsertServer(state);
    emit(state);
    // we only refresh the app if the app is currently on this server
    if (app.state.server?.url == state.url) {
      app.setServer(state.copyWith());
    }
  }

  deleteServer() {
    db.deleteServer(state);
    // widget.refreshServers();

    Server currentServer = db.getCurrentlySelectedServer();
    emit(state);
    app.setServer(currentServer);
  }

  bool get canDelete => db.getServers().length > 1;
}

/*
class ServerSettingsController {
  late Server server;


  ServerSettingsController(this.server);

}
*/
