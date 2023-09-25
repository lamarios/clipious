import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../app/states/app.dart';
import '../../globals.dart';
import '../models/db/server.dart';

part 'server_list_settings.g.dart';

const pingTimeout = 3;

enum PublicServerErrors { none, couldNotGetList }

final log = Logger('ManagerServerView');

class ServerListSettingsCubit extends Cubit<ServerListSettingsState> {
  final AppCubit appCubit;

  ServerListSettingsCubit(super.initialState, this.appCubit) {
    refreshServers();
    getPublicServers();
  }

  @override
  close() async {
    state.onClose();
    super.close();
  }

  upsertServer(Server server) {
    db.upsertServer(server);

    refreshServers();
  }

  refreshServers() {
    var state = this.state.copyWith();
    var servers =
        state.publicServers.where((s) => state.dbServers.indexWhere((element) => element.url == s.url) == -1).toList();

    state.dbServers = db.getServers();
    state.publicServers = servers;

    emit(state);
  }

  getPublicServers() async {
    var state = this.state.copyWith();
    state.pinging = true;
    state.publicServersError = PublicServerErrors.none;

    emit(state);
    try {
      var public = await service.getPublicServers();

      var servers = public.map((e) {
        var s = Server(url: e.uri);
        s.flag = e.flag;
        s.region = e.region;

        return s;
      }).toList();
      int progress = 0;
      List<Server?> pingedServers = await Future.wait(servers.map((e) async {
        try {
          var progressState = this.state.copyWith();
          e.ping = await service
              .pingServer(e.url)
              .timeout(const Duration(seconds: pingTimeout), onTimeout: () => const Duration(seconds: pingTimeout));
          progress++;
          progressState.publicServerProgress = progress / servers.length;
          emit(progressState);
          return e;
        } catch (err, stacktrace) {
          log.severe('couldn\'t reach server ${e.url}', err, stacktrace);
          return null;
        }
      }));

      List<Server> successfullyPingedServers =
          pingedServers.where((element) => element != null).map((e) => e!).toList();

      successfullyPingedServers.sort((a, b) =>
          (a.ping ?? const Duration(seconds: pingTimeout)).compareTo(b.ping ?? const Duration(seconds: pingTimeout)));

      state = this.state.copyWith();
      state.pinging = false;
      state.publicServers = successfullyPingedServers;
      state.publicServersError = PublicServerErrors.none;
      if (!isClosed) {
        emit(state);
      }
    } catch (err) {
      log.severe("couldn't get public playlist", err);
      if (!isClosed) {
        emit(this.state.copyWith(publicServersError: PublicServerErrors.couldNotGetList));
      }
      rethrow;
    }
  }

  bool isLoggedInToServer(String url) {
    Server server = state.dbServers.firstWhere((s) => s.url == url, orElse: () => Server(url: 'notFound'));

    return (server.authToken?.isNotEmpty ?? false) || (server.sidCookie?.isNotEmpty ?? false);
  }

  saveServer() async {
    var serverUrl = state.addServerController.value.text;
    if (serverUrl.endsWith("/")) {
      serverUrl = serverUrl.substring(0, serverUrl.length - 1);
    }

    bool isValidServer = false;
    try {
      isValidServer = await service.isValidServer(serverUrl);
    } catch (err) {
      isValidServer = false;
    }

    if (isValidServer) {
      Server server = Server(url: serverUrl);
      db.upsertServer(server);
      state.addServerController.text = 'https://';
      if (state.dbServers.isEmpty) {
        switchServer(server);
      }
      refreshServers();
    } else {
      throw Error();
    }
  }

  switchServer(Server s) {
    db.useServer(s);
    refreshServers();
    appCubit.setServer(s);
  }
}

@CopyWith(constructor: "_")
class ServerListSettingsState {
  ServerListSettingsState(
      {required this.dbServers, required this.publicServers, this.publicServerProgress = 0, this.pinging = true});

  List<Server> dbServers;
  List<Server> publicServers;
  double publicServerProgress;
  TextEditingController addServerController = TextEditingController(text: 'https://');

  bool pinging;

  PublicServerErrors publicServersError = PublicServerErrors.none;

  void onClose() {
    addServerController.dispose();
  }

  ServerListSettingsState._(this.dbServers, this.publicServers, this.publicServerProgress, this.addServerController,
      this.pinging, this.publicServersError);
}
