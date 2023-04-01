import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPlayerAwareController.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import '../models/baseVideo.dart';
import '../models/video.dart';
import '../views/video.dart';

const double targetHeight = 75;
const double miniPlayerThreshold = 300;
const double bigPlayerThreshold = 700;

class MiniPlayerController extends GetxController {
  static MiniPlayerController? to() => safeGet();
  var log = Logger('MiniPlayerController');
  int currentIndex = 0;
  List<BaseVideo> videos = List.empty(growable: true);
  double height = targetHeight;
  bool isMini = true;
  double? top;
  bool isDragging = false;
  int selectedFullScreenIndex = 0;
  bool isPip = false;
  bool isHidden = true;
  double progress = 0;
  Video? currentlyPlaying;
  double opacity = 0;

  Offset offset = Offset.zero;

  MiniPlayerController();

  @override
  onReady() {
    super.onReady();
    BackButtonInterceptor.add(handleBackButton, name: 'miniPlayer');
    // show();
  }

  @override
  void onClose() {
    BackButtonInterceptor.removeByName('miniPlayer');
    super.onClose();
  }

  bool handleBackButton(bool stopDefaultButtonEvent, RouteInfo info) {
    if (!isMini) {
      // we block the backbutton behavior and we make the player small
      showMiniPlayer();
      return true;
    } else {
      return false;
    }
  }

  setVideos(List<BaseVideo> videos) {
    this.videos = videos;
    update();
  }

  selectTab(int index) {
    selectedFullScreenIndex = index;
    update();
  }

  hide() {
    isMini = true;
    top = null;
    height = targetHeight;
    isHidden = true;
    videos = [];
    currentlyPlaying = null;
    opacity = 0;
    MiniPlayerAwareController.to()?.setPadding(false);
    update();
  }

  double get getBottom => isHidden ? -targetHeight : 0;

  BaseVideo showVideo() {
    var video = videos[currentIndex];
    hide();
    return video;
  }

  queueVideos(List<BaseVideo> videos) {
    if (videos.isNotEmpty) {
      //removing videos that are already in the queue
      this.videos.addAll(videos.where((v) => this.videos.indexWhere((v2) => v2.videoId == v.videoId) == -1));
    }
    log.info('Videos in queue ${videos.length}');
    update();
  }

  showBigPlayer() {
    isMini = false;
    top = 0;
    opacity = 1;
    isHidden = false;
    PlayerController.to()?.toggleControls(true);
    MiniPlayerAwareController.to()?.setPadding(false);
    update();
  }

  showMiniPlayer() {
    if (currentlyPlaying != null) {
      isMini = true;
      top = null;
      isHidden = false;
      opacity = 1;
      PlayerController.to()?.toggleControls(false);
      MiniPlayerAwareController.to()?.setPadding(true);
      update();
    }
  }

  playNext() {
    if (videos.length > 1) {
      currentIndex++;
      if (currentIndex >= videos.length) {
        currentIndex = 0;
      }
      switchToVideo(videos[currentIndex]);
      PlayerController.to()?.toggleControls(!isMini);
      update();
    }
  }

  playPrevious() {
    if (videos.length > 1) {
      currentIndex--;
      if (currentIndex < 0) {
        currentIndex = videos.length - 1;
      }
      switchToVideo(videos[currentIndex]);
      PlayerController.to()?.toggleControls(!isMini);
      update();
    }
  }

  playVideo(List<BaseVideo> videos, {bool? goBack}) {
    if (goBack ?? false) Get.back();

    if (videos.isNotEmpty) {
      this.videos = videos;
      currentIndex = 0;
      selectedFullScreenIndex = 0;
      if (videos.length > 1) {
        selectedFullScreenIndex = 3;
      }
      opacity = 0;
      top = 500;
      update();

      showBigPlayer();
      switchToVideo(videos[0]);
    }
  }

  switchToVideo(BaseVideo video) async {
    int index = videos.indexWhere((element) => element.videoId == video.videoId);
    if (index >= 0 && index < videos.length) {
      currentIndex = index;
    } else {
      currentIndex = 0;
    }

    Video v = await service.getVideo(video.videoId);
    currentlyPlaying = v;

    progress = 0;
    PlayerController.to()?.switchVideo(v);
    PlayerController.to()?.toggleControls(!isMini);
    update();
  }

  BaseVideo get currentVideo => videos[currentIndex];

  removeVideoFromQueue(BaseVideo video) {
    if (videos.length == 1) {
      hide();
    } else {
      int index = videos.indexWhere((element) => element.videoId == video.videoId);
      if (index >= 0) {
        videos.removeAt(index);
        if (index == currentIndex) {
          switchToVideo(videos[currentIndex]);
        }
      }
    }
    update();
  }

  void videoDraggedDown(DragUpdateDetails details) {
    // log.info('delta: ${details.delta.dy}, local: ${details.localPosition.dy}, global: ${details.globalPosition.dy}');
    isDragging = true;
    top = details.globalPosition.dy;
    isMini = details.delta.dy > 0;
    // we're going down, puttin threshold high easier to switch to mini player
    update();
  }

  void videoDraggedDownEnd(DragEndDetails details) {
    if (isMini) {
      showMiniPlayer();
    } else {
      showBigPlayer();
    }
  }

  bool isVideoInQueue(Video video) {
    return videos.indexWhere((element) => element.videoId == video.videoId) >= 0;
  }

  void handleVideoEvent(BetterPlayerEvent event) {
    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.progress:
        int currentPosition = (event.parameters?['progress'] as Duration).inSeconds;
        progress = currentPosition / currentVideo.lengthSeconds;
        break;
      case BetterPlayerEventType.finished:
        playNext();
        break;
      case BetterPlayerEventType.pipStart:
        isPip = true;
        break;
      case BetterPlayerEventType.pipStop:
        isPip = false;
        break;
      default:
        break;
    }
    update();
  }
}
