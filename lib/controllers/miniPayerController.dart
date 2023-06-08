import 'dart:math';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPlayerAwareController.dart';
import 'package:invidious/controllers/miniPlayerProgressController.dart';
import 'package:invidious/controllers/miniplayerControlsController.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:invidious/controllers/videoLikeController.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import '../main.dart';
import '../models/baseVideo.dart';
import '../models/video.dart';
import '../views/video.dart';

const double targetHeight = 75;
const double miniPlayerThreshold = 300;
const double bigPlayerThreshold = 700;

enum PlayerRepeat { noRepeat, repeatAll, repeatOne }

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
  bool isFullScreen = false;
  double progress = 0;
  Video? currentlyPlaying;
  double opacity = 0;
  double dragDistance = 0;
  bool dragStartMini = true;
  bool isShowingOverflow = false;
  PlayerRepeat repeat = PlayerRepeat.values[int.parse(db.getSettings(PLAYER_REPEAT)?.value ?? '0')];
  bool shuffle = db.getSettings(PLAYER_SHUFFLE)?.value == 'true';
  List<String> playedVideos = [];
  Offset offset = Offset.zero;

  MiniPlayerController();

  @override
  onReady() {
    super.onReady();
    BackButtonInterceptor.add(handleBackButton, name: 'miniPlayer', zIndex: 2);
    // show();
  }

  @override
  void onClose() {
    BackButtonInterceptor.removeByName('miniPlayer');
    super.onClose();
  }

  bool handleBackButton(bool stopDefaultButtonEvent, RouteInfo info) {
    if (isFullScreen) {
      isFullScreen = false;
      update();
      globalNavigator.currentState?.pop();
      return true;
    } else if (!isMini) {
      // we block the backbutton behavior and we make the player small
      showMiniPlayer();
      return true;
    } else {
      return false;
    }
  }

  toggleShuffle() {
    shuffle = !shuffle;
    db.saveSetting(SettingsValue(PLAYER_SHUFFLE, this.shuffle.toString()));
    update();
  }

  setNextRepeatMode() {
    switch (repeat) {
      case PlayerRepeat.noRepeat:
        repeat = PlayerRepeat.repeatAll;
        break;
      case PlayerRepeat.repeatAll:
        repeat = PlayerRepeat.repeatOne;
        break;
      case PlayerRepeat.repeatOne:
        repeat = PlayerRepeat.noRepeat;
        break;
    }

    db.saveSetting(SettingsValue(PLAYER_REPEAT, PlayerRepeat.values.indexOf(repeat).toString()));
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
    playedVideos = [];
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
    } else {
      playVideo(videos);
    }
    log.fine('Videos in queue ${videos.length}');
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
    if (videos.isNotEmpty) {
      log.fine('Play next: played length: ${playedVideos.length} videos: ${videos.length} Repeat mode: $repeat');
      if (repeat == PlayerRepeat.repeatOne) {
        switchToVideo(currentlyPlaying!);
      } else {
        if (playedVideos.length >= videos.length) {
          if (repeat == PlayerRepeat.repeatAll) {
            playedVideos = [];
            currentIndex = 0;
          } else {
            return;
          }
        } else {
          if (!shuffle) {
            // making sure we play something that can be played
            if (currentIndex + 1 < videos.length) {
              currentIndex++;
            } else if (repeat == PlayerRepeat.repeatAll) {
              // we might reach here if user changes repeat mode and play with previous/next buttons
              currentIndex = 0;
              playedVideos = [];
            } else {
              return;
            }
          } else {
            List<BaseVideo> availableVideos = videos.where((e) => !playedVideos.contains(e.videoId)).toList();
            String nextVideoId = availableVideos[Random().nextInt(availableVideos.length)].videoId;
            currentIndex = videos.indexWhere((e) => e.videoId == nextVideoId);
          }
        }
        switchToVideo(videos[currentIndex]);
        PlayerController.to()?.toggleControls(!isMini);
        update();
      }
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
    if (goBack ?? false) navigatorKey.currentState?.pop();
    log.fine('Playing ${videos.length} videos');
    if (videos.isNotEmpty) {
      this.videos = List.from(videos, growable: true);
      playedVideos = [];
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

    late Video v;
    if (video is Video) {
      v = video;
    } else {
      v = await service.getVideo(video.videoId);
    }
    // if we already have a full Video, no need to call the backend again
    currentlyPlaying = v;

    if (!playedVideos.contains(v.videoId)) {
      playedVideos.add(v.videoId);
    }
    progress = 0;
    PlayerController.to()?.switchVideo(v);
    PlayerController.to()?.toggleControls(!isMini);
    update();
    VideoLikeButtonController.to(tag: VideoLikeButtonController.tags(v.videoId))?.checkVideoLikeStatus();
    MiniPlayerControlsController.to()?.setVideo(v.videoId);
  }

  BaseVideo get currentVideo => videos[currentIndex];

  removeVideoFromQueue(BaseVideo video) {
    if (videos.length == 1) {
      hide();
    } else {
      int index = videos.indexWhere((element) => element.videoId == video.videoId);
      playedVideos.remove(video.videoId);
      if (index >= 0) {
        if (index < currentIndex) {
          currentIndex--;
        }
        videos.removeAt(index);
      }
    }
    update();
  }

  void videoDragged(DragUpdateDetails details) {
    // log.info('delta: ${details.delta.dy}, local: ${details.localPosition.dy}, global: ${details.globalPosition.dy}');
    isDragging = true;
    top = details.globalPosition.dy;
    // we  change the display mode if there's a big enough drag movement to avoid jittery behavior when dragging slow
    if (details.delta.dy.abs() > 3) {
      isMini = details.delta.dy > 0;
    }
    dragDistance += details.delta.dy;
    // we're going down, putting threshold high easier to switch to mini player
    update();
  }

  void videoDraggedEnd(DragEndDetails details) {
    bool showMini = dragDistance.abs() > 200 ? isMini : dragStartMini;
    if (showMini) {
      showMiniPlayer();
    } else {
      showBigPlayer();
    }
  }

  void videoDragStarted(DragStartDetails details) {
    dragDistance = 0;
    dragStartMini = isMini;
  }

  bool isVideoInQueue(Video video) {
    return videos.indexWhere((element) => element.videoId == video.videoId) >= 0;
  }

  void handleVideoEvent(BetterPlayerEvent event) {
    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.progress:
        if (isMini) {
          int currentPosition = (event.parameters?['progress'] as Duration).inSeconds;
          progress = currentPosition / currentVideo.lengthSeconds;
          MiniPlayerProgressController.to()?.setProgress(progress);
        }
        break;
      case BetterPlayerEventType.finished:
        playNext();
        break;
      case BetterPlayerEventType.pipStart:
        isPip = true;
        update();
        break;
      case BetterPlayerEventType.pipStop:
        isPip = false;
        update();
        break;
      case BetterPlayerEventType.openFullscreen:
        isFullScreen = true;
        update();
        break;
      case BetterPlayerEventType.hideFullscreen:
        isFullScreen = false;
        update();
        break;
      default:
        break;
    }
  }

  onQueueReorder(int oldItemIndex, int newItemIndex) {
    log.fine('Dragged video');
    var movedItem = videos.removeAt(oldItemIndex);
    videos.insert(newItemIndex, movedItem);
    log.fine('Reordered list: $oldItemIndex new index: ${videos.indexOf(movedItem)}');
    if (oldItemIndex == currentIndex) {
      currentIndex = newItemIndex;
    } else if (oldItemIndex > currentIndex && newItemIndex <= currentIndex) {
      currentIndex++;
    } else if (oldItemIndex < currentIndex && newItemIndex >= currentIndex) {
      currentIndex--;
    }

    update();
  }
}
