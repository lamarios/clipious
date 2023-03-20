import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:logging/logging.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../database.dart';
import '../globals.dart';
import '../main.dart';
import '../views/video.dart';

class HomeController extends GetxController {
  static HomeController to() => Get.find();

  final log = Logger('Home controller');
  late int selectedIndex;
  bool isLoggedIn = db.isLoggedInToCurrentServer();
  late StreamSubscription _intentDataStreamSubscription;

  HomeController() {
    selectedIndex = int.parse(db.getSettings(ON_OPEN)?.value ?? '0');
    if (!isLoggedIn && selectedIndex > 1) {
      selectedIndex = 0;
    }

    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.getTextStream().listen((String value) {
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
  onClose() {
    _intentDataStreamSubscription.cancel();
    super.onClose();
  }

  serverChanged() {
    selectedIndex = 0;
    isLoggedIn = db.isLoggedInToCurrentServer();
    log.info('logged in ? ${isLoggedIn}');
    update();
    try {
      VideoListController.to(VideoListController.popularTag).refreshVideos();
    }catch(err){
      log.info('popular video list not ready ?');
    }
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
      update();
    } catch (err) {
      // not a url;
    }
  }

  selectIndex(int index) {
    selectedIndex = index;
    update();
  }
}
