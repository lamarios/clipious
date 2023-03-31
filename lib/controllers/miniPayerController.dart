import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import '../models/video.dart';
import '../views/video.dart';

const double targetHeight = 75;
const double navigationBarHeight = 75;

class MiniPlayerController extends GetxController {
  static MiniPlayerController? to() => safeGet();
  var log = Logger('MiniPlayerController');
  double bottom = 0;
  int currentIndex = 0;
  List<Video> videos = List.empty(growable: true);
  double height = targetHeight;
  bool isMini = true;
  double? top;
  bool isDragging = false;
  int selectedFullScreenIndex = 0;
  bool isPip = false;
  bool isHidden = true;
  double progress = 0;

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

  setVideos(List<Video> videos) {
    this.videos = videos;
    update();
  }

  selectTab(int index) {
    selectedFullScreenIndex = index;
    update();
  }

  show() {
    bottom = navigationBarHeight;
    update();
  }

  hide() {
    isMini = true;
    top = null;
    height = targetHeight;
    isHidden = true;
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

  double get getBottom => isHidden
      ? -targetHeight
      : isMini
          ? bottom
          : 0;

  Video showVideo() {
    var video = videos[currentIndex];
    hide();
    return video;
  }

  queueVideos(List<Video> videos) {
    if (videos.isNotEmpty) {
      this.videos.addAll(videos);
    }
    log.info('Videos in queue ${videos.length}');
    update();
  }

  showBigPlayer() {
    isMini = false;
    top = 0;
    isHidden = false;
    PlayerController.to()?.toggleControls(true);
    update();
  }

  showMiniPlayer() {
    isMini = true;
    top = null;
    isHidden = false;
    PlayerController.to()?.toggleControls(false);
    update();
  }

  playNext() {
    if (videos.length > 1) {
      currentIndex++;
      if (currentIndex >= videos.length) {
        currentIndex = 0;
      }
      PlayerController.to()?.switchVideo(videos[currentIndex]);
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
      PlayerController.to()?.switchVideo(videos[currentIndex]);
      PlayerController.to()?.toggleControls(!isMini);
      update();
    }
  }

  playVideo(Video video) {
    videos = [video];
    currentIndex = 0;
    selectedFullScreenIndex = 0;
    showBigPlayer();
    PlayerController.to()?.switchVideo(video);
  }

  switchToVideo(Video video) {
    int index = videos.indexWhere((element) => element.videoId == video.videoId);
    if (index >= 0 && index < videos.length) {
      currentIndex = index;
    } else {
      currentIndex = 0;
    }
    PlayerController.to()?.switchVideo(videos[currentIndex]);
    PlayerController.to()?.toggleControls(!isMini);
    update();
  }

  void videoDraggedDownEnd(DragEndDetails details) {
    isMini = (top ?? 0) > miniPlayerThreshold;
    if (isMini) {
      showMiniPlayer();
    } else {
      showBigPlayer();
    }
  }

  Video get currentVideo => videos[currentIndex];

  removeVideoFromQueue(Video video) {
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
    isDragging = true;
    top = details.globalPosition.dy;
    isMini = (top ?? miniPlayerThreshold) > miniPlayerThreshold;
    update();
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
