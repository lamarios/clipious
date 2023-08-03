import 'package:flutter/material.dart';
import 'package:invidious/controllers/channelController.dart';
import 'package:invidious/globals.dart';

class TvChannelController extends ChannelController {
  final ScrollController scrollController = ScrollController();
  bool showBackground = false;
  bool hasShorts = false, hasStreams = false, hasVideos = false, hasPlaylist = false;

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

  // we only update those values if is false because with continuation there could be no new values but we still want to display those
  // meaning we expect it to be modified once.
  setHasPlaylists(bool value) {
    if (!hasPlaylist) {
      hasPlaylist = value;
      update();
    }
  }

  setHasStreams(bool value) {
    if (!hasStreams) {
      hasStreams = value;
      update();
    }
  }

  setHasVideos(bool value) {
    if (!hasVideos) {
      hasVideos = value;
      update();
    }
  }

  setHasShorts(bool value) {
    if (!hasShorts) {
      hasShorts = value;
      update();
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
