import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/router.dart';
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
        ReceiveSharingIntent.instance.getMediaStream().listen((shared) {
      final String? value = shared
          .where((element) => element.type == SharedMediaType.url)
          .map((e) => e.path)
          .firstOrNull;
      if (value != null) {
        openAppLink(value, false);
      }
    }, onError: (err) {
      log.warning("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then((shared) {
      final String? value = shared
          .where((element) => element.type == SharedMediaType.url)
          .map((e) => e.path)
          .firstOrNull;
      if (value != null) {
        openAppLink(value, true);
      }
      ReceiveSharingIntent.instance.reset();
    });

    service.syncHistory();
  }

  @override
  close() async {
    intentDataStreamSubscription.cancel();
    super.close();
  }

  void openAppLink(String url, bool fullStack) {
    try {
      log.fine('opening $url, full stack: $fullStack');
      Uri uri = Uri.parse(url);
      String? videoId;
      if (youtubeHosts.contains(uri.host)) {
        if (uri.pathSegments.length == 1 &&
            uri.pathSegments.contains("watch") &&
            uri.queryParameters.containsKey('v')) {
          videoId = uri.queryParameters['v']!;
        }
        if (uri.host == 'youtu.be' && uri.pathSegments.length == 1) {
          videoId = uri.pathSegments[0];
        }

        if (videoId != null) {
          if (fullStack) {
            appRouter.replaceAll([
              MainRoute(children: [
                const MainContentRoute(),
                VideoRoute(videoId: videoId)
              ])
            ]);
          } else {
            appRouter.push(VideoRoute(videoId: videoId));
          }
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
