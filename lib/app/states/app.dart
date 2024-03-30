import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/router.dart';
import 'package:logging/logging.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../../globals.dart';
import '../../home/models/db/home_layout.dart';
import '../../settings/models/db/server.dart';
import '../../settings/models/db/settings.dart';

part 'app.freezed.dart';

final log = Logger('HomeState');

class AppCubit extends Cubit<AppState> {
  late final StreamSubscription intentDataStreamSubscription;
  AppCubit(super.initialState) {
    onReady();
    initState();
  }

  initState() async {
    Server? server;
    try {
      server = await db.getCurrentlySelectedServer();
    } catch (e) {
      server = null;
    }
    HomeLayout homeLayout = db.getHomeLayout();
    bool isLoggedIn = (server?.authToken?.isNotEmpty ?? false) ||
        (server?.sidCookie?.isNotEmpty ?? false);

    var firstIndex = int.parse(db.getSettings(onOpenSettingName)?.value ?? '0');
    if (!isLoggedIn && firstIndex > 1 || firstIndex < 0) {
      firstIndex = 0;
    }
    emit(state.copyWith(
        firstIndex: firstIndex, homeLayout: homeLayout, server: server));
  }

  onReady() async {
    intentDataStreamSubscription =
        ReceiveSharingIntent.getMediaStream().listen((shared) {
      final String? value = shared
          .where((element) => element.type == SharedMediaType.file)
          .map((e) => e.message)
          .firstOrNull;
      if (value != null) {
        openAppLink(value);
      }
    }, onError: (err) {
      log.warning("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialMedia().then((shared) {
      final String? value = shared
          .where((element) => element.type == SharedMediaType.file)
          .map((e) => e.message)
          .firstOrNull;
      if (value != null) {
        openAppLink(value);
      }
      ReceiveSharingIntent.reset();
    });

    service.syncHistory();
  }

  @override
  close() async {
    intentDataStreamSubscription.cancel();
    super.close();
  }

  void openAppLink(String url) {
    try {
      Uri uri = Uri.parse(url);
      if (youtubeHosts.contains(uri.host)) {
        if (uri.pathSegments.length == 1 &&
            uri.pathSegments.contains("watch") &&
            uri.queryParameters.containsKey('v')) {
          String videoId = uri.queryParameters['v']!;
          appRouter.push(VideoRoute(videoId: videoId));
        }
        if (uri.host == 'youtu.be' && uri.pathSegments.length == 1) {
          String videoId = uri.pathSegments[0];
          appRouter.push(VideoRoute(videoId: videoId));
        }
      }
    } catch (err, stacktrace) {
      // not a url;
      log.severe('Couldn\'t open external url: $url', err, stacktrace);
    }
  }

  selectIndex(int index) {
    emit(state.copyWith(firstIndex: index));
  }

  rebuildApp() {
    emit(state.copyWith());
  }

  setServer(Server s) {
    emit(state.copyWith(server: s, firstIndex: 0));
  }

  updateLayout() {
    emit(state.copyWith(homeLayout: db.getHomeLayout()));
  }

  bool get isLoggedIn =>
      (state.server?.authToken?.isNotEmpty ?? false) ||
      (state.server?.sidCookie?.isNotEmpty ?? false);

  // Set the whole app in a loading state.
  setGlobalLoading(bool loading) {
    emit(state.copyWith(globalLoading: loading));
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState(int firstIndex, Server? server, HomeLayout homeLayout,
      {@Default(false) bool globalLoading}) = _AppState;
}
