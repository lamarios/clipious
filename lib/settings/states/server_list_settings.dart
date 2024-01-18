import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

import '../../app/states/app.dart';
import '../../globals.dart';
import '../models/db/server.dart';

part 'server_list_settings.freezed.dart';

const pingTimeout = 3;

enum PublicServerErrors { none, couldNotGetList }

final log = Logger('ManagerServerView');

class ServerListSettingsCubit extends Cubit<ServerListSettingsState> {
  final TextEditingController addServerController =
      TextEditingController(text: 'https://');
  final AppCubit appCubit;

  ServerListSettingsCubit(super.initialState, this.appCubit) {
    refreshServers();
    getPublicServers();
  }

  @override
  close() async {
    addServerController.dispose();
    super.close();
  }

  upsertServer(Server server) async {
    await db.upsertServer(server);

    refreshServers();
  }

  refreshServers() async {
    var servers = state.publicServers
        .where((s) =>
            state.dbServers.indexWhere((element) => element.url == s.url) == -1)
        .toList();

    emit(state.copyWith(
        dbServers: await db.getServers(), publicServers: servers));
  }

  getPublicServers() async {
    emit(state.copyWith(
        pinging: true, publicServersError: PublicServerErrors.none));
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
          e.ping = await service.pingServer(e.url).timeout(
              const Duration(seconds: pingTimeout),
              onTimeout: () => const Duration(seconds: pingTimeout));
          progress++;

          emit(state.copyWith(publicServerProgress: progress / servers.length));
          return e;
        } catch (err, stacktrace) {
          log.severe('couldn\'t reach server ${e.url}', err, stacktrace);
          return null;
        }
      }));

      List<Server> successfullyPingedServers = pingedServers
          .where((element) => element != null)
          .map((e) => e!)
          .toList();

      successfullyPingedServers.sort((a, b) =>
          (a.ping ?? const Duration(seconds: pingTimeout))
              .compareTo(b.ping ?? const Duration(seconds: pingTimeout)));

      if (!isClosed) {
        emit(state.copyWith(
            pinging: false,
            publicServers: successfullyPingedServers,
            publicServersError: PublicServerErrors.none));
      }
    } catch (err) {
      log.severe("couldn't get public playlist", err);
      if (!isClosed) {
        emit(state.copyWith(
            publicServersError: PublicServerErrors.couldNotGetList));
      }
      rethrow;
    }
  }

  bool isLoggedInToServer(String url) {
    Server server = state.dbServers
        .firstWhere((s) => s.url == url, orElse: () => Server(url: 'notFound'));

    return (server.authToken?.isNotEmpty ?? false) ||
        (server.sidCookie?.isNotEmpty ?? false);
  }

  saveServer() async {
    var serverUrl = addServerController.value.text;
    if (serverUrl.endsWith("/")) {
      serverUrl = serverUrl.substring(0, serverUrl.length - 1);
    }

    await service.validateServer(serverUrl);

    Server server = Server(url: serverUrl);
    await db.upsertServer(server);
    addServerController.text = 'https://';
    if (state.dbServers.isEmpty) {
      switchServer(server);
    }
    refreshServers();
  }

  switchServer(Server s) async {
    await db.useServer(s);
    await fileDb.useServer(s);
    refreshServers();
    appCubit.setServer(s);
  }
}

@freezed
class ServerListSettingsState with _$ServerListSettingsState {
  const factory ServerListSettingsState(
      {required List<Server> dbServers,
      required List<Server> publicServers,
      @Default(0) double publicServerProgress,
      @Default(true) bool pinging,
      @Default(PublicServerErrors.none)
      PublicServerErrors publicServersError}) = _ServerListSettingsState;
}
