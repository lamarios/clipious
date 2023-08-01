import 'package:flutter/material.dart';
import 'package:invidious/controllers/channelController.dart';
import 'package:invidious/globals.dart';

class TvChannelController extends ChannelController {
  final ScrollController scrollController = ScrollController();
  bool showBackground = false;

  TvChannelController(super.channelId);

  @override
  Future<void> onReady() async {
    super.onReady();
    scrollController.addListener(onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  scrollToTop(bool scroll) {
    if (scroll) {
      scrollController.animateTo(0, duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
    }
  }

  void onScroll() {
    if (scrollController.offset == 0) {
      showBackground = false;
      update();
    } else if (!showBackground) {
      showBackground = true;
      update();
    }
  }
}
