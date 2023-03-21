import 'dart:math';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/video.dart';
import '../views/video.dart';

const double targetHeight = 75;
const double navigationBarHeight = 75;

class MiniPlayerController extends GetxController {
  static MiniPlayerController? to() => safeGet();
  var log = Logger('MiniPlayerController');
  double opacity = 0;
  double bottom = -targetHeight;
  int currentIndex = 0;
  List<Video> videos = [];
  double height = targetHeight;
  bool showTitle = true;

  MiniPlayerController({required this.videos});

  @override
  onReady() {
    super.onReady();
    // show();
  }

  setVideos(List<Video> videos) {
    this.videos = videos;
    update();
  }

  show() {
    opacity = 1;
    bottom = navigationBarHeight;
    update();
  }

  hide() {
    FBroadcast.instance().broadcast(BROADCAST_STOP_MINI_PLAYER);

    opacity = 0;
    height = targetHeight;
    bottom = -targetHeight;
    videos = [];
    showTitle = true;
    update();
  }

  void move(bool aboveNavigation) {
    // if we're not hidden only we do something
    if (bottom >= 0) {
      log.info('Moving mini player above ? ${aboveNavigation} : ${navigationBarHeight} ');
      bottom = aboveNavigation ? navigationBarHeight : 0;
      update();
    }
  }

  onDragUpdate(DragUpdateDetails details) {
    double opacity = 1 - min(1, ((-details.localPosition.dy) / miniPlayerThreshold));
    double height = max(targetHeight, targetHeight + (-details.localPosition.dy));
    showTitle = false;
    this.height = height;
    this.opacity = min(1, opacity);
    update();
  }

  Video? onDragEnd(DragEndDetails details) {
    if (height > miniPlayerThreshold) {
      return showVideo();
    } else {
      showTitle = true;
      height = targetHeight;
      opacity = 1;
      update();
      return null;
    }
  }

  Video showVideo() {
    var video = videos[currentIndex];
    hide();
    return video;
  }
}
