import 'package:flutter/material.dart';
import 'package:invidious/controllers/channelController.dart';
import 'package:invidious/globals.dart';

class TvChannelController extends ChannelController {
  final ScrollController scrollController = ScrollController();

  TvChannelController(super.channelId);

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
}
