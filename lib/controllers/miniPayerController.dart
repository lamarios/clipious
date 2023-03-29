import 'dart:math';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playerController.dart';
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
  bool isMini = true;
  double? top;
  bool isDragging = false;

  Offset offset = Offset.zero;

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

  Video showVideo() {
    var video = videos[currentIndex];
    hide();
    return video;
  }

  showBigPlayer() {
    isMini = false;
    opacity = 1;
    bottom = 0;
    top = 0;
    update();
  }

  showMiniPlayer() {
    isMini = true;
    bottom = 0;
    opacity = 1;
    top = null;
    update();
  }

  playVideo(Video video) {
    videos = [video];
    currentIndex = 0;
    showBigPlayer();
    PlayerController.to()?.switchVideo(video);
  }

  void videoDraggedDownEnd(DragEndDetails details) {
    isMini = (top ?? 0) > miniPlayerThreshold;
    top = isMini ? null : 0;
    isDragging = false;
    update();
  }

  void videoDraggedDown(DragUpdateDetails details) {
    isDragging = true;
    top = details.globalPosition.dy;
    isMini = (top ?? miniPlayerThreshold) > miniPlayerThreshold;
    update();
  }
}
