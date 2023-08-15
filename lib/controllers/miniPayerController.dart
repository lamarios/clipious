import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:better_player/better_player.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/audioPlayerController.dart';
import 'package:invidious/controllers/miniPlayerAwareController.dart';
import 'package:invidious/controllers/miniPlayerProgressController.dart';
import 'package:invidious/controllers/miniplayerControlsController.dart';
import 'package:invidious/controllers/videoInListController.dart';
import 'package:invidious/controllers/videoLikeController.dart';
import 'package:invidious/controllers/videoPlayerController.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/mediaEvent.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import '../../models/db/progress.dart' as dbProgress;
import '../main.dart';
import '../models/baseVideo.dart';
import '../models/db/downloadedVideo.dart';
import '../models/pair.dart';
import '../models/sponsorSegment.dart';
import '../models/sponsorSegmentTypes.dart';
import '../models/video.dart';
import 'interfaces/playerController.dart';

const double targetHeight = 69;
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
  DownloadedVideo? offlineCurrentlyPlaying;
  double opacity = 0;
  double dragDistance = 0;
  bool dragStartMini = true;
  bool isShowingOverflow = false;
  PlayerRepeat repeat = PlayerRepeat.values[int.parse(db.getSettings(PLAYER_REPEAT)?.value ?? '0')];
  bool shuffle = db.getSettings(PLAYER_SHUFFLE)?.value == 'true';
  List<String> playedVideos = [];
  Offset offset = Offset.zero;
  bool isAudio = true;
  Duration? startAt;

  // sponsor block variables
  int previousSponsorCheck = 0;
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);

  // end of sponsor block variables

  List<DownloadedVideo> offlineVideos = [];

  MiniPlayerController();

  MiniPlayerController.withVideos(this.videos);

  final eventStream = StreamController<MediaEvent>.broadcast();

  bool get isPlaying => playerController?.isPlaying() ?? false;

  bool get hasVideo => currentlyPlaying != null || offlineCurrentlyPlaying != null;

  bool get hasQueue => offlineVideos.length > 1 || videos.length > 1;

  PlayerController? get playerController {
    if (isTv) return VideoPlayerController.to();

    var playerController = isAudio ? AudioPlayerController.to() : VideoPlayerController.to();
    return playerController;
  }

  @override
  onReady() {
    super.onReady();

    if (!isTv) {
      BackButtonInterceptor.add(handleBackButton, name: 'miniPlayer', zIndex: 2);

      eventStream.stream
          .map((event) {
            handleMediaEvent(event);

            return event;
          })
          .where((event) => event.type != MediaEventType.progress)
          .map((event) {
            log.fine("Event state: ${event.state}");
            var state = PlaybackState(
              controls: [
                hasQueue ? MediaControl.skipToPrevious : MediaControl.rewind,
                if (isPlaying) MediaControl.pause else MediaControl.play,
                MediaControl.stop,
                hasQueue ? MediaControl.skipToNext : MediaControl.fastForward,
              ],
              systemActions: const {MediaAction.seek, MediaAction.seekForward, MediaAction.seekBackward, MediaAction.setShuffleMode, MediaAction.setRepeatMode},
              androidCompactActionIndices: const [0, 1, 3],
              processingState: const {
                MediaState.idle: AudioProcessingState.idle,
                MediaState.loading: AudioProcessingState.loading,
                MediaState.buffering: AudioProcessingState.buffering,
                MediaState.ready: AudioProcessingState.ready,
                MediaState.completed: AudioProcessingState.completed,
                MediaState.playing: AudioProcessingState.ready,
              }[event.state]!,
              playing: event.state == MediaState.idle || event.state == MediaState.completed ? false : isPlaying,
              updatePosition: playerController?.position() ?? Duration.zero,
              bufferedPosition: playerController?.bufferedPosition() ?? Duration.zero,
              speed: playerController?.speed() ?? 1,
              queueIndex: currentIndex,
            );

            return state;
          })
          .pipe(mediaHandler.playbackState);
    } else {
      eventStream.stream.listen(handleMediaEvent);
    }
  }

  handleMediaEvent(MediaEvent event) {
    switch (event.state) {
      case MediaState.completed:
        if (currentlyPlaying != null) {
          saveProgress(currentlyPlaying!.lengthSeconds);
        }
        playNext();
        break;
      default:
        break;
    }

    switch (event.type) {
      case MediaEventType.progress:
        onProgress();
        break;
      default:
        break;
    }
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
    this.videos = videos.where((element) => !element.filtered).toList();
    offlineVideos = [];
    update();
  }

  selectTab(int index) {
    selectedFullScreenIndex = index;
    update();
  }

  setAudio(bool? newValue) {
    newValue ??= false;
    if (newValue != isAudio) {
      playerController?.disposeControllers();
    }

    isAudio = newValue;
    update();
  }

  hide() {
    isMini = true;
    eventStream.add(MediaEvent(state: MediaState.miniDisplayChanged));
    top = null;
    height = targetHeight;
    isHidden = true;
    videos = [];
    playedVideos = [];
    currentlyPlaying = null;
    offlineCurrentlyPlaying = null;
    offlineVideos = [];
    opacity = 0;
    MiniPlayerAwareController.to()?.setPadding(false);
    eventStream.add(MediaEvent(state: MediaState.idle));
    update();
  }

  double get getBottom => isHidden ? -targetHeight : 0;

  BaseVideo showVideo() {
    var video = videos[currentIndex];
    hide();
    return video;
  }

  saveProgress(int timeInSeconds) {
    if (currentlyPlaying != null) {
      int currentPosition = timeInSeconds;
      // saving progress
      var progress = dbProgress.Progress.named(progress: currentPosition / currentlyPlaying!.lengthSeconds, videoId: currentlyPlaying!.videoId);
      db.saveProgress(progress);

      if (progress.progress > 0.5) {
        EasyDebounce.debounce('invidious-progress-sync-${progress.videoId}', const Duration(seconds: 5), () {
          if (service.isLoggedIn()) {
            service.addToUserHistory(progress.videoId);
          }
        });
      }

      VideoInListController.to(progress.videoId)?.updateProgress();
    }
  }

  queueVideos(List<BaseVideo> videos) {
    offlineVideos = [];
    if (videos.isNotEmpty) {
      //removing videos that are already in the queue
      this.videos.addAll(videos.where((v) => this.videos.indexWhere((v2) => v2.videoId == v.videoId) == -1).where((element) => !element.filtered));
    } else {
      playVideo(videos);
    }
    log.fine('Videos in queue ${videos.length}');
    update();
  }

  showBigPlayer() {
    isMini = false;
    eventStream.add(MediaEvent(state: MediaState.miniDisplayChanged));
    top = 0;
    opacity = 1;
    isHidden = false;
    playerController?.toggleControls(true);
    MiniPlayerAwareController.to()?.setPadding(false);
    update();
  }

  showMiniPlayer() {
    if (currentlyPlaying != null || offlineCurrentlyPlaying != null) {
      isMini = true;
      eventStream.add(MediaEvent(state: MediaState.miniDisplayChanged));
      top = null;
      isHidden = false;
      opacity = 1;
      playerController?.toggleControls(false);
      MiniPlayerAwareController.to()?.setPadding(true);
      update();
    }
  }

  onProgress() {
    if (playerController != null) {
      var pc = playerController!;

      int currentPosition = pc.position().inSeconds;
      if (currentPosition > previousSponsorCheck + 1) {
        // saving progress
        saveProgress(currentPosition);
        log.fine("video event");

        if (sponsorSegments.isNotEmpty) {
          double positionInMs = currentPosition * 1000;
          Pair<int> nextSegment = sponsorSegments.firstWhere((e) => e.first <= positionInMs && positionInMs <= e.last, orElse: () => Pair<int>(-1, -1));
          if (nextSegment.first != -1) {
            pc.seek(Duration(milliseconds: nextSegment.last + 1000));
            final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;

            if (scaffold != null) {
              var locals = AppLocalizations.of(scaffold.context)!;
              scaffold.showSnackBar(SnackBar(
                content: Text(locals.sponsorSkipped),
                duration: const Duration(seconds: 1),
              ));
            }
          }
        }

        previousSponsorCheck = currentPosition;
      } else if (currentPosition + 2 < previousSponsorCheck) {
        // if we're more than 2 seconds behind, means we probably seek backward manually far away
        // so we reset the position
        previousSponsorCheck = currentPosition;
      }
    }
  }

  playNext() {
    if (videos.isNotEmpty || offlineVideos.isNotEmpty) {
      var listToUpdate = videos.isNotEmpty ? videos : offlineVideos;

      log.fine('Play next: played length: ${playedVideos.length} videos: ${videos.length} Repeat mode: $repeat');
      if (repeat == PlayerRepeat.repeatOne) {
        if (videos.isNotEmpty) {
          switchToVideo(currentlyPlaying!);
        } else if (offlineVideos.isNotEmpty) {
          switchToOfflineVideo(offlineCurrentlyPlaying!);
        }
      } else {
        if (playedVideos.length >= listToUpdate.length) {
          if (repeat == PlayerRepeat.repeatAll) {
            playedVideos = [];
            currentIndex = 0;
          } else {
            return;
          }
        } else {
          if (!shuffle) {
            // making sure we play something that can be played
            if (currentIndex + 1 < listToUpdate.length) {
              currentIndex++;
            } else if (repeat == PlayerRepeat.repeatAll) {
              // we might reach here if user changes repeat mode and play with previous/next buttons
              currentIndex = 0;
              playedVideos = [];
            } else {
              return;
            }
          } else {
            if (videos.isNotEmpty) {
              List<BaseVideo> availableVideos = videos.where((e) => !playedVideos.contains(e.videoId)).toList();
              String nextVideoId = availableVideos[Random().nextInt(availableVideos.length)].videoId;
              currentIndex = videos.indexWhere((e) => e.videoId == nextVideoId);
            } else {
              List<DownloadedVideo> availableVideos = offlineVideos.where((e) => !playedVideos.contains(e.videoId)).toList();
              String nextVideoId = availableVideos[Random().nextInt(availableVideos.length)].videoId;
              currentIndex = offlineVideos.indexWhere((e) => e.videoId == nextVideoId);
            }
          }
        }
        if (videos.isNotEmpty) {
          switchToVideo(videos[currentIndex]);
        } else if (offlineVideos.isNotEmpty) {
          switchToOfflineVideo(offlineVideos[currentIndex]);
        }
        playerController?.toggleControls(!isMini);
        update();
      }
    }
  }

  playPrevious() {
    var listToUpdate = videos.isNotEmpty ? videos : offlineVideos;
    if (listToUpdate.length > 1) {
      currentIndex--;
      if (currentIndex < 0) {
        currentIndex = videos.length - 1;
      }

      if (videos.isNotEmpty) {
        switchToVideo(videos[currentIndex]);
      } else if (offlineVideos.isNotEmpty) {
        switchToOfflineVideo(offlineVideos[currentIndex]);
      }

      playerController?.toggleControls(!isMini);
      update();
    }
  }

  _playVideos(List<IdedVideo> vids, {Duration? startAt}) async {
    if (vids.isNotEmpty) {
      this.startAt = startAt;
      bool isOffline = vids[0] is DownloadedVideo;

      eventStream.add(MediaEvent(state: MediaState.loading));

      if (isOffline) {
        videos = [];
        offlineVideos = List.from(vids, growable: true);
      } else {
        offlineVideos = [];
        videos = List.from(vids, growable: true);
      }

      playedVideos = [];
      currentIndex = 0;
      selectedFullScreenIndex = 0;
      if (vids.length > 1) {
        selectedFullScreenIndex = 3;
      }
      opacity = 0;
      top = 500;
      update();

      showBigPlayer();
      if (isOffline) {
        await switchToOfflineVideo(offlineVideos[0]);
      } else {
        await switchToVideo(videos[0], startAt: startAt);
      }
    }
  }

  _switchToVideo(IdedVideo video, {Duration? startAt}) async {
    bool isOffline = video is DownloadedVideo;

    eventStream.add(MediaEvent(state: MediaState.loading));

    if (isOffline) {
      videos = [];
      currentlyPlaying = null;
    } else {
      offlineVideos = [];
      offlineCurrentlyPlaying = null;
    }

    List<IdedVideo> toCheck = isOffline ? offlineVideos : videos;

    int index = toCheck.indexWhere((element) => element.videoId == video.videoId);
    if (index >= 0 && index < toCheck.length) {
      currentIndex = index;
    } else {
      currentIndex = 0;
    }

    if (!isOffline) {
      late Video v;
      if (video is Video) {
        v = video;
      } else {
        v = await service.getVideo(video.videoId);
      }
      currentlyPlaying = v;
      setSponsorBlock();
      playerController?.switchVideo(v, startAt: startAt);
    } else {
      offlineCurrentlyPlaying = video;
      playerController?.switchToOfflineVideo(video);
    }

    // if we already have a full Video, no need to call the backend again

    if (!playedVideos.contains(video.videoId)) {
      playedVideos.add(video.videoId);
    }
    progress = 0;
    playerController?.toggleControls(!isMini);
    update();

    VideoLikeButtonController.to(tag: VideoLikeButtonController.tags(video.videoId))?.checkVideoLikeStatus();
    MiniPlayerControlsController.to()?.setVideo(video.videoId);

    mediaHandler.skipToQueueItem(currentIndex);
  }

  playOfflineVideos(List<DownloadedVideo> offlineVids) async {
    log.fine('Playing ${offlineVids.length} offline videos');
    await _playVideos(offlineVids);
  }

  playVideo(List<BaseVideo> v, {bool? goBack, bool? audio, Duration? startAt}) async {
    List<BaseVideo> videos = v.where((element) => !element.filtered).toList();
    if (goBack ?? false) navigatorKey.currentState?.pop();
    log.fine('Playing ${videos.length} videos');

    setAudio(audio);

    await _playVideos(videos, startAt: startAt);
  }

  switchToOfflineVideo(DownloadedVideo video) async {
    setAudio(video.audioOnly);
    await _switchToVideo(video);
  }

  switchToVideo(BaseVideo video, {Duration? startAt}) async {
    await _switchToVideo(video, startAt: startAt);
  }

  void togglePlaying() {
    isPlaying ? pause() : play();
  }

  play() {
    playerController?.play();
  }

  pause() {
    playerController?.pause();
  }

  BaseVideo? get currentVideo => videos.isNotEmpty ? videos[currentIndex] : null;

  removeVideoFromQueue(String videoId) {
    var listToUpdate = videos.isNotEmpty ? videos : offlineVideos;
    if (listToUpdate.length == 1) {
      hide();
    } else {
      int index = videos.isNotEmpty ? videos.indexWhere((element) => element.videoId == videoId) : offlineVideos.indexWhere((element) => element.videoId == videoId);
      playedVideos.remove(videoId);
      if (index >= 0) {
        if (index < currentIndex) {
          currentIndex--;
        }
        listToUpdate.removeAt(index);
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
      eventStream.add(MediaEvent(state: MediaState.miniDisplayChanged));
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

  onQueueReorder(int oldItemIndex, int newItemIndex) {
    log.fine('Dragged video');
    var listToUpdate = videos.isNotEmpty ? videos : offlineVideos;
    var movedItem = listToUpdate.removeAt(oldItemIndex);
    listToUpdate.insert(newItemIndex, movedItem);
    log.fine('Reordered list: $oldItemIndex new index: ${listToUpdate.indexOf(movedItem)}');
    if (oldItemIndex == currentIndex) {
      currentIndex = newItemIndex;
    } else if (oldItemIndex > currentIndex && newItemIndex <= currentIndex) {
      currentIndex++;
    } else if (oldItemIndex < currentIndex && newItemIndex >= currentIndex) {
      currentIndex--;
    }

    update();
  }

  void playVideoNext(BaseVideo video) {
    if (videos.isEmpty) {
      playVideo([video]);
    } else {
      int newIndex = currentIndex + 1;
      int oldIndex = videos.indexWhere((element) => element.videoId == video.videoId);
      if (oldIndex == -1) {
        videos.insert(newIndex, video);
      } else {
        onQueueReorder(oldIndex, newIndex);
      }

      update();
    }
  }

  setSponsorBlock() async {
    if (currentlyPlaying != null) {
      List<SponsorSegmentType> types = SponsorSegmentType.values.where((e) => db.getSettings(e.settingsName())?.value == 'true').toList();

      if (types.isNotEmpty) {
        List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(currentlyPlaying!.videoId, types);
        List<Pair<int>> segments = List.from(sponsorSegments.map((e) {
          Duration start = Duration(seconds: e.segment[0].floor());
          Duration end = Duration(seconds: e.segment[1].floor());
          Pair<int> segment = Pair(start.inMilliseconds, end.inMilliseconds);
          return segment;
        }));

        this.sponsorSegments = segments;
        log.fine('we found ${segments.length} segments to skip');
      } else {
        sponsorSegments = [];
      }
    }
  }

  /// Offline video management

  void fastForward() {
    Duration newDuration = Duration(seconds: (playerController?.position().inSeconds ?? 0) + 10);
    playerController?.seek(newDuration);
  }

  void rewind() {
    Duration newDuration = Duration(seconds: (playerController?.position().inSeconds ?? 0) - 10);
    playerController?.seek(newDuration);
  }

  Future<MediaItem?> getMediaItem(int index) async {
    if (videos.isNotEmpty) {
      var e = videos[index];
      return MediaItem(
          id: e.videoId, title: e.title, artist: e.author, duration: Duration(seconds: e.lengthSeconds), album: '', artUri: Uri.parse(ImageObject.getBestThumbnail(e.videoThumbnails)?.url ?? ''));
    } else if (offlineVideos.isNotEmpty) {
      var e = offlineVideos[index];
      var path = await e.thumbnailPath;
      return MediaItem(id: e.videoId, title: e.title, artist: e.author, duration: Duration(seconds: e.lengthSeconds), album: '', artUri: Uri.file(path));
    }
    return null;
  }
}
