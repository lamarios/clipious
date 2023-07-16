import 'package:flutter/material.dart';
import 'package:invidious/controllers/videoController.dart';
import 'package:invidious/globals.dart';

class TvVideoController extends VideoController {
  final ScrollController scrollController = ScrollController();

  TvVideoController({required super.videoId});

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  scrollUp() {
    scrollController.animateTo(0, duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
  }
}
