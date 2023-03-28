import 'package:flutter/material.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/views/video/player.dart';

class VideoPlayerFullScreenView {
  static List<Widget> build(BuildContext context, MiniPlayerController controller) {
    return [Text(controller.videos[controller.currentIndex].title)];
  }
}
