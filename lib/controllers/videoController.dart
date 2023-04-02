import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoInnerViewController.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/errors/invidiousServiceError.dart';
import '../models/video.dart';
import 'miniPayerController.dart';

const String coulnotLoadVideos = 'cannot-load-videos';

class VideoController extends GetxController {
  final log = Logger('Video');
  Video? video;
  bool loadingVideo = true;

  int selectedIndex = 0;
  String videoId;
  bool isLoggedIn = service.isLoggedIn();

  double opacity = 1;

  String error = '';

  VideoController({required this.videoId});

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

  void playVideo() {
    if (video != null) {
      MiniPlayerController.to()?.playVideo([video!], goBack: true);
    }
  }
}
