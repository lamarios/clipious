import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoInnerViewController.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/errors/invidiousServiceError.dart';
import '../models/video.dart';

const String coulnotLoadVideos = 'cannot-load-videos';

class VideoController extends GetxController {
  final log = Logger('Video');
  Video? video;
  bool loadingVideo = true;
  double miniPlayerThreshold;

  int selectedIndex = 0;
  String videoId;
  bool isLoggedIn = service.isLoggedIn();

  Offset offset = Offset.zero;
  double opacity = 1;

  String error = '';
  Function(List<Video> videos) showMiniPlayer;

  VideoController({required this.miniPlayerThreshold, required this.videoId, required this.showMiniPlayer});

  void videoDraggedEnd(DragEndDetails details) {
    if (offset.dy > miniPlayerThreshold) {
      showMiniPlayer([video!]);
    } else {
      offset = Offset.zero;
      opacity = 1;
      update();
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      Video video = await service.getVideo(videoId);
      this.video = video;
      loadingVideo = false;
      update();
    } catch (err) {
      if (err is InvidiousServiceError) {
        error = (err).message;
      } else {
        error = coulnotLoadVideos;
      }
      loadingVideo = false;
      update();
      rethrow;
    }
  }

  selectIndex(int index) {
    selectedIndex = index;
    update();
    VideoInnerViewController.to(tag: VideoInnerViewController.getControllerTags(video?.videoId ?? ''))?.scrollUp();
  }

  void videoDragged(DragUpdateDetails details) {
    double opacity = 1 - min(1, (details.localPosition.dy / miniPlayerThreshold));
    offset = Offset(0, max(0, details.localPosition.dy));
    this.opacity = max(0, opacity);
    update();
  }
}
