import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../main.dart';
import '../../videos/views/screens/video.dart';

part 'app.g.dart';

final log = Logger('HomeState');

class AppCubit extends Cubit<AppState> {
  AppCubit(super.initialState) {
    onReady();
  }

  onReady() {
    state.intentDataStreamSubscription = ReceiveSharingIntent.getTextStream().listen((String value) {
      openAppLink(value);
    }, onError: (err) {
      log.warning("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((value) {
      openAppLink((value ?? ''));
    });
  }

  @override
  close() async {
    state.intentDataStreamSubscription.cancel();
    super.close();
  }

  serverChanged() {
    var state = this.state.copyWith();
    state.selectedIndex = 0;
    state.isLoggedIn = db.isLoggedInToCurrentServer();
    log.fine('logged in ? ${state.isLoggedIn}');
    emit(state);
    // VideoListController.to(VideoListController.popularTag)?.refreshItems();
  }

  void openAppLink(String url) {
    try {
      Uri uri = Uri.parse(url);
      if (YOUTUBE_HOSTS.contains(uri.host)) {
        if (uri.pathSegments.length == 1 && uri.pathSegments.contains("watch") && uri.queryParameters.containsKey('v')) {
          String videoId = uri.queryParameters['v']!;
          navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) => VideoView(
                    videoId: videoId,
                  )));
        }
        if (uri.host == 'youtu.be' && uri.pathSegments.length == 1) {
          String videoId = uri.pathSegments[0];
          navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) => VideoView(
                    videoId: videoId,
                  )));
        }
      }
    } catch (err, stacktrace) {
      // not a url;
      log.severe('Couldn\'t open external url: ${url}', err, stacktrace);
    }
  }

  selectIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  rebuildApp() {
    emit(state.copyWith());
  }
}

@CopyWith(constructor: "_")
class AppState {
  late int selectedIndex;
  bool isLoggedIn = db.isLoggedInToCurrentServer();
  late StreamSubscription intentDataStreamSubscription;

  AppState() {
    selectedIndex = int.parse(db.getSettings(ON_OPEN)?.value ?? '0');
    if (!isLoggedIn && selectedIndex > 1) {
      selectedIndex = 0;
    }
    // For sharing or opening urls/text coming from outside the app while the app is in the memory
  }

  AppState._(this.selectedIndex, this.isLoggedIn, this.intentDataStreamSubscription);
}
