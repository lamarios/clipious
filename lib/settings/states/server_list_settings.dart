import 'package:bloc/bloc.dart';
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
  final AppCubit appCubit;

  ServerListSettingsCubit(super.initialState, this.appCubit) {
    refreshServers();
    // getPublicServers();
  }

  upsertServer(Server server) async {
    await db.upsertServer(server);

    await refreshServers();
  }

  refreshServers() async {
    var dbServers = await db.getServers();
    var servers = state.publicServers
        .where((s) =>
            dbServers.indexWhere((element) => element.url == s.url) == -1)
        .toList();

    emit(state.copyWith(dbServers: dbServers, publicServers: servers));
  }

/*
  getPublicServers() async {
    emit(state.copyWith(
        pinging: true, publicServersError: PublicServerErrors.none));
    try {
      var public = await service.getPublicServers();

      var servers = public.map((e) {
        return Server(url: e.uri, flag: e.flag, region: e.region);
      }).toList();
      int progress = 0;
      List<Server?> pingedServers = await Future.wait(servers.map((e) async {
        try {
          final ping = await service.pingServer(e.url).timeout(
              const Duration(seconds: pingTimeout),
              onTimeout: () => const Duration(seconds: pingTimeout));
          progress++;

          emit(state.copyWith(publicServerProgress: progress / servers.length));
          return e.copyWith(ping: ping);
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
*/

  bool isLoggedInToServer(String url) {
    Server server = state.dbServers.firstWhere((s) => s.url == url,
        orElse: () => const Server(url: 'notFound'));

    return (server.authToken?.isNotEmpty ?? false) ||
        (server.sidCookie?.isNotEmpty ?? false);
  }

  saveServer(Server server) async {
    await db.upsertServer(server);
    if (state.dbServers.isEmpty) {
      switchServer(server);
    }
    await refreshServers();
  }

  switchServer(Server s) async {
    await db.useServer(s);
    await fileDb.useServer(s);
    await refreshServers();
    appCubit.setServer(s);
  }
}

@freezed
sealed class ServerListSettingsState with _$ServerListSettingsState {
  const factory ServerListSettingsState(
      {required List<Server> dbServers,
      required List<Server> publicServers,
      @Default(0) double publicServerProgress,
      @Default(true) bool pinging,
      @Default(PublicServerErrors.none)
      PublicServerErrors publicServersError}) = _ServerListSettingsState;
}
