import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:invidious/router.dart';
import 'package:logging/logging.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../../settings/models/db/settings.dart';
import '../../utils/obox_database.dart';
import '../../globals.dart';
import '../../home/models/db/home_layout.dart';
import '../../settings/models/db/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

    var selectedIndex =
        int.parse(db.getSettings(onOpenSettingName)?.value ?? '0');
    if (!isLoggedIn && selectedIndex > 1 || selectedIndex < 0) {
      selectedIndex = 0;
    }
    emit(state.copyWith(
        selectedIndex: selectedIndex, homeLayout: homeLayout, server: server));
  }

  onReady() async {
    intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      openAppLink(value);
    }, onError: (err) {
      log.warning("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((value) {
      openAppLink((value ?? ''));
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
    emit(state.copyWith(selectedIndex: index));
  }

  rebuildApp() {
    emit(state.copyWith());
  }

  setServer(Server s) {
    emit(state.copyWith(server: s, selectedIndex: 0));
  }

  updateLayout() {
    emit(state.copyWith(homeLayout: db.getHomeLayout()));
  }

  bool get isLoggedIn =>
      (state.server?.authToken?.isNotEmpty ?? false) ||
      (state.server?.sidCookie?.isNotEmpty ?? false);
}

@freezed
class AppState with _$AppState {
  const factory AppState(
      int selectedIndex, Server? server, HomeLayout homeLayout) = _AppState;
}
