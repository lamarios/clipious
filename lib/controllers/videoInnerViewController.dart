import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/utils.dart';

import '../globals.dart';

class VideoInnerViewController extends GetxController {
  static VideoInnerViewController? to({String? tag}) => safeGet(tag: tag);
  ScrollController scrollController = ScrollController();

  static getControllerTags(String videoId) {
    return 'video-innerview-$videoId';
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  scrollUp() {
    scrollController.animateTo(0,
        duration: animationDuration, curve: Curves.easeInOutQuad);
  }
}
