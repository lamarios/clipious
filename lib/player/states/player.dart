import 'dart:async';
import 'dart:collection';

import 'package:audio_service/audio_service.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/models/mediaCommand.dart';
import 'package:invidious/player/models/mediaEvent.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/models/image_object.dart';
import 'package:logging/logging.dart';
import 'package:simple_pip_mode/simple_pip.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../main.dart';
import '../../mediaHander.dart';
import '../../settings/states/settings.dart';
import '../../utils/models/pair.dart';
import '../../videos/models/base_video.dart';
import '../../videos/models/db/progress.dart' as db_progress;
import '../../videos/models/sponsor_segment.dart';
import '../../videos/models/sponsor_segment_types.dart';
import '../../videos/models/video.dart';

part 'player.freezed.dart';

const double targetHeight = 69;
const double miniPlayerThreshold = 300;
const skipToVideoThrottleName = 'skip-to-video';
const double bigPlayerThreshold = 700;
const defaultStep = 10;
const stepMultiplier = 1.15;

var log = Logger('MiniPlayerController');

enum PlayerRepeat { noRepeat, repeatAll, repeatOne }

class PlayerCubit extends Cubit<PlayerState> with WidgetsBindingObserver {
  final SettingsCubit settings;
  late Orientation orientation;

  PlayerCubit(super.initialState, this.settings) {
    orientation = _orientation;
    onReady();
  }

  setEvent(MediaEvent event) {
    handleMediaEvent(event);
    mapMediaEventToMediaHandler(event);

    emit(state.copyWith(mediaEvent: event));
  }

  Orientation get _orientation => (WidgetsBinding.instance.platformDispatcher
                  .implicitView?.physicalSize.aspectRatio ??
              1) >
          1
      ? Orientation.landscape
      : Orientation.portrait;

  @override
  void didChangeMetrics() {
    var newOrientation = _orientation;
    if (newOrientation != orientation) {
      orientation = newOrientation;
      onOrientationChange();
    }
  }

  mapMediaEventToMediaHandler(MediaEvent event) {
    if (!isTv && event.type != MediaEventType.progress) {
      log.fine("Event state: ${event.state}, ${event.type}");
      var playbackState = PlaybackState(
        controls: [
          state.hasQueue ? MediaControl.skipToPrevious : MediaControl.rewind,
          if (state.isPlaying) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
          state.hasQueue ? MediaControl.skipToNext : MediaControl.fastForward,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
          MediaAction.setShuffleMode,
          MediaAction.setRepeatMode
        },
        androidCompactActionIndices: const [0, 1, 3],
        processingState: const {
              MediaState.idle: AudioProcessingState.idle,
              MediaState.loading: AudioProcessingState.loading,
              MediaState.buffering: AudioProcessingState.buffering,
              MediaState.ready: AudioProcessingState.ready,
              MediaState.completed: AudioProcessingState.completed,
              MediaState.playing: AudioProcessingState.ready,
            }[event.state] ??
            AudioProcessingState.ready,
        playing: event.state == MediaState.idle ||
                event.state == MediaState.completed
            ? false
            : state.isPlaying,
        updatePosition: state.position,
        bufferedPosition: state.bufferedPosition,
        speed: state.speed,
        queueIndex: currentIndex,
      );

      mediaHandler.playbackState.add(playbackState);
    }
  }

  int get currentIndex {
    String? currentVideoId = state.currentlyPlaying?.videoId ??
        state.offlineCurrentlyPlaying?.videoId;
    return (state.videos.isNotEmpty ? state.videos : state.offlineVideos)
        .indexWhere((element) => element.videoId == currentVideoId);
  }

  onReady() async {
    if (!isTv) {
      WidgetsBinding.instance.addObserver(this);

      mediaHandler = await AudioService.init(
        builder: () => MediaHandler(this),
        config: const AudioServiceConfig(
          androidNotificationChannelId:
              'com.github.lamarios.clipious.channel.audio',
          androidNotificationChannelName: 'Video playback',
          androidNotificationOngoing: true,
        ),
      );
      BackButtonInterceptor.add(handleBackButton,
          name: 'miniPlayer', zIndex: 2, ifNotYetIntercepted: true);
    } else if (isTv && state.videos.isNotEmpty) {
      await switchToVideo(state.videos[0]);
      generatePlayQueue();
    }
  }

  handleMediaEvent(MediaEvent event) {
    switch (event.state) {
      case MediaState.completed:
        if (state.currentlyPlaying != null) {
          saveProgress(state.currentlyPlaying!.lengthSeconds);
        }
        playNext();
        _setPlaying(false);
        break;
      default:
        break;
    }

    switch (event.type) {
      case MediaEventType.enteredPip:
        _setPip(true);
        break;
      case MediaEventType.exitedPip:
        _setPip(false);
        break;
      case MediaEventType.progress:
        onProgress(event.value);
        break;
      case MediaEventType.play:
        _setPlaying(true);
        break;
      case MediaEventType.pause:
        _setPlaying(false);
        break;
      case MediaEventType.volumeChanged:
        _setMuted(!event.value);
        break;
      case MediaEventType.aspectRatioChanged:
        emit(state.copyWith(aspectRatio: event.value));
        break;
      default:
        break;
    }
  }

  _setPip(bool pip) {
    emit(state.copyWith(isPip: pip));
  }

  _setMuted(bool muted) {
    emit(state.copyWith(muted: muted));
  }

  @override
  close() async {
    BackButtonInterceptor.removeByName('miniPlayer');
    WidgetsBinding.instance.removeObserver(this);
    super.close();
  }

  bool handleBackButton(bool stopDefaultButtonEvent, RouteInfo info) {
    if (state.fullScreenState == FullScreenState.fullScreen) {
      setFullScreen(FullScreenState.notFullScreen);
      return true;
    } else if (!state.isMini) {
      // we block the backbutton behavior and we make the player small
      showMiniPlayer();
      return true;
    } else {
      return false;
    }
  }

  setVideos(List<BaseVideo> videos) {
    var newVideos = videos.where((element) => !element.filtered).toList();
    emit(state.copyWith(videos: newVideos, offlineVideos: []));
  }

  selectTab(int index) {
    emit(state.copyWith(selectedFullScreenIndex: index));
  }

  setAudio(bool? newValue) {
    emit(state.copyWith(isAudio: newValue ?? false));
  }

  hide() {
    var mediaEvent = MediaEvent(
        state: MediaState.playing,
        type: MediaEventType.miniDisplayChanged,
        value: state.isMini);

    emit(state.copyWith(
        isMini: true,
        mediaEvent: mediaEvent,
        top: null,
        height: targetHeight,
        isHidden: true,
        videos: [],
        playedVideos: [],
        currentlyPlaying: null,
        offlineCurrentlyPlaying: null,
        offlineVideos: [],
        opacity: 0));
    setEvent(const MediaEvent(state: MediaState.idle));
  }

  double get getBottom => state.isHidden ? -targetHeight : 0;

/*
  BaseVideo showVideo() {
    var video = state.videos[state.currentIndex];
    hide();
    return video;
  }
*/

  saveProgress(int timeInSeconds) {
    if (state.currentlyPlaying != null) {
      int currentPosition = timeInSeconds;
      // saving progress
      var currentProgress =
          currentPosition / state.currentlyPlaying!.lengthSeconds;
      if (currentProgress >= 0.9)
        currentProgress =
            1; // we consider a video with 90%+ progress as watched
      var progress = db_progress.Progress.named(
          progress: currentProgress, videoId: state.currentlyPlaying!.videoId);

      db.saveProgress(progress);

      if (progress.progress > 0.1) {
        EasyThrottle.throttle('invidious-progress-sync-${progress.videoId}',
            const Duration(minutes: 10), () {
          if (service.isLoggedIn()) {
            service.addToUserHistory(progress.videoId);
          }
        });
      }
    }
  }

  queueVideos(List<BaseVideo> videos) {
    var stateVideos = List<BaseVideo>.from(state.videos);
    if (videos.isNotEmpty) {
      //removing videos that are already in the queue
      stateVideos.addAll(videos
          .where((v) =>
              state.videos.indexWhere((v2) => v2.videoId == v.videoId) == -1)
          .where((element) => !element.filtered));
    } else {
      playVideo(videos);
    }
    log.fine('Videos in queue ${videos.length}');
    emit(state.copyWith(offlineVideos: [], videos: stateVideos));
    generatePlayQueue();
  }

  showBigPlayer() {
    var mediaEvent = MediaEvent(
        state: MediaState.playing,
        type: MediaEventType.miniDisplayChanged,
        value: state.isMini);

    emit(state.copyWith(
        isMini: false,
        mediaEvent: mediaEvent,
        top: 0,
        opacity: 1,
        isHidden: false));
    onOrientationChange();
  }

  showMiniPlayer() {
    if (state.currentlyPlaying != null ||
        state.offlineCurrentlyPlaying != null) {
      var mediaEvent = MediaEvent(
          state: MediaState.playing,
          type: MediaEventType.miniDisplayChanged,
          value: state.isMini);
      emit(state.copyWith(
          isMini: true,
          mediaEvent: mediaEvent,
          top: null,
          isHidden: false,
          opacity: 1));
    }
  }

  onProgress(Duration? position) {
    var newPosition = position ?? Duration.zero;
    int currentPosition = newPosition.inSeconds;
    saveProgress(currentPosition);
    log.fine("video event");

    emit(state.copyWith(position: newPosition));

    if (state.sponsorSegments.isNotEmpty) {
      double positionInMs = currentPosition * 1000;
      Pair<int> nextSegment = state.sponsorSegments.firstWhere(
          (e) => e.first <= positionInMs && positionInMs <= e.last,
          orElse: () => const Pair<int>(-1, -1));
      if (nextSegment.first != -1) {
        emit(state.copyWith(
            mediaEvent: const MediaEvent(
                state: MediaState.playing,
                type: MediaEventType.sponsorSkipped)));
        //for some reasons this needs to be last
        seek(Duration(milliseconds: nextSegment.last + 1000));
/*
        final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;


        if (scaffold != null) {
          var locals = AppLocalizations.of(scaffold.context)!;
          scaffold.showSnackBar(SnackBar(
            content: Text(locals.sponsorSkipped),
            duration: const Duration(seconds: 1),
          ));
        }
*/

        // log.info('SPONSOR SKIPPED');
      }
    }
  }

  _playNextNow() async {
    if (settings.state.playerRepeatMode == PlayerRepeat.repeatOne) {
      seek(Duration.zero);
      play();
    } else if (state.videos.isNotEmpty || state.offlineVideos.isNotEmpty) {
      //moving current video to played list
      String? currentVideoId = state.currentlyPlaying?.videoId ??
          state.offlineCurrentlyPlaying?.videoId;
      if (currentVideoId != null) {
        // state.playedVideos.remove(currentVideoId);
        var newPlayedVideos = List<String>.from(state.playedVideos)
          ..add(currentVideoId);
        emit(state.copyWith(playedVideos: newPlayedVideos));
      }

      if (state.playQueue.isNotEmpty) {
        String toPlay = state.playQueue.removeFirst();
        if (state.videos.isNotEmpty) {
          await switchToVideo(
              state.videos.firstWhere((element) => element.videoId == toPlay));
        } else {
          await switchToOfflineVideo(state.offlineVideos
              .firstWhere((element) => element.videoId == toPlay));
        }
      } else if (settings.state.playerRepeatMode == PlayerRepeat.repeatAll) {
        emit(state.copyWith(playedVideos: [], playQueue: ListQueue.from([])));
        if (state.videos.isNotEmpty) {
          await switchToVideo(state.videos[0]);
        } else {
          await switchToOfflineVideo(state.offlineVideos[0]);
        }
        generatePlayQueue();
      }
    }
  }

  playNext() {
    EasyThrottle.throttle(
        skipToVideoThrottleName, const Duration(seconds: 1), _playNextNow);
  }

  playPrevious() {
    EasyThrottle.throttle(skipToVideoThrottleName, const Duration(seconds: 1),
        () async {
      if (state.playedVideos.isNotEmpty) {
        // putting back current video in play queue
        String? currentVideoId = state.currentlyPlaying?.videoId ??
            state.offlineCurrentlyPlaying?.videoId;
        var playQueue = ListQueue<String>.from(state.playQueue);
        if (currentVideoId != null) {
          // state.playQueue.remove(currentVideoId);
          playQueue.addFirst(currentVideoId);
        }

        var playedVideos = List<String>.from(state.playedVideos);
        String toPlay = playedVideos.removeLast();
        if (state.videos.isNotEmpty) {
          await switchToVideo(
              state.videos.firstWhere((element) => element.videoId == toPlay));
        } else {
          await switchToOfflineVideo(state.offlineVideos
              .firstWhere((element) => element.videoId == toPlay));
        }
        emit(state.copyWith(playQueue: playQueue, playedVideos: playedVideos));
      } else {
        // if there's nothing to go back to, we just repeat the last video
        seek(Duration.zero);
        play();
      }
    });
  }

  _setPlaying(bool playing) {
    emit(state.copyWith(isPlaying: playing));
  }

  _playVideos(List<IdedVideo> vids, {Duration? startAt}) async {
    if (vids.isNotEmpty) {
      bool isOffline = vids[0] is DownloadedVideo;

      const mediaEvent = MediaEvent(state: MediaState.loading);

      late List<BaseVideo> videos;
      late List<DownloadedVideo> offlineVideos;
      if (isOffline) {
        videos = [];
        offlineVideos = List<DownloadedVideo>.from(vids, growable: true).cast();
      } else {
        offlineVideos = [];
        videos = List<BaseVideo>.from(vids, growable: true).cast();
      }

      var selectedFullScreenIndex = 0;
      if (vids.length > 1) {
        selectedFullScreenIndex = 3;
      }
      emit(state.copyWith(
          offlineVideos: offlineVideos,
          videos: videos,
          startAt: startAt,
          mediaEvent: mediaEvent,
          playedVideos: [],
          selectedFullScreenIndex: selectedFullScreenIndex,
          opacity: 0,
          top: 500));

      showBigPlayer();
      if (isOffline) {
        await switchToOfflineVideo(state.offlineVideos[0]);
      } else {
        await switchToVideo(state.videos[0], startAt: startAt);
      }
      generatePlayQueue();
    }
  }

  /// skip to queue video of index
  /// if we're not shuffling, we also rebuild the playnext and played previously queue
  skipToVideo(int index) {
    var listToCheckAgainst =
        state.videos.isNotEmpty ? state.videos : state.offlineVideos;
    if (index < 0 || index >= listToCheckAgainst.length) {
      return;
    }

    if (settings.state.playerShuffleMode) {
    } else {
      List<String> played = [];
      List<String> playNext = [];
      for (int i = 0; i < listToCheckAgainst.length; i++) {
        var v = listToCheckAgainst[i];
        if (i < index) {
          played.add(v.videoId);
        } else if (i > index) {
          playNext.add(v.videoId);
        }
      }
      emit(state.copyWith(
          playedVideos: played, playQueue: ListQueue.from(playNext)));
    }
    _switchToVideo(listToCheckAgainst[index]);
  }

  /// Switches to a video without changing the queue
  _switchToVideo(IdedVideo video, {Duration? startAt}) async {
    try {
      // we move the existing video to the stack of played video

      bool isOffline = video is DownloadedVideo;
      // we want to switch to audio mode as soon as we can to prevent problems when switching from audio to video or the other way
      if (isOffline) {
        setAudio(video.audioOnly);
      }

      const mediaEvent = MediaEvent(state: MediaState.loading);

      List<BaseVideo> videos = List.from(state.videos);
      List<DownloadedVideo> offlineVideos = List.from(state.offlineVideos);
      var currentlyPlaying = state.currentlyPlaying;
      var offlineCurrentlyPlaying = state.offlineCurrentlyPlaying;
      if (isOffline) {
        videos = [];
        currentlyPlaying = null;
      } else {
        offlineVideos = [];
        offlineCurrentlyPlaying = null;
      }

      // List<IdedVideo> toCheck = isOffline ? state.offlineVideos : state.videos;

      emit(state.copyWith(
          mediaEvent: mediaEvent,
          videos: videos,
          currentlyPlaying: currentlyPlaying,
          offlineVideos: offlineVideos,
          offlineCurrentlyPlaying: offlineCurrentlyPlaying));

      late MediaCommand mediaCommand;
      currentlyPlaying = state.currentlyPlaying;
      offlineCurrentlyPlaying = state.offlineCurrentlyPlaying;
      if (!isOffline) {
        late Video v;
        if (video is Video) {
          v = video;
        } else {
          v = await service.getVideo(video.videoId);
        }
        currentlyPlaying = v;
        mediaCommand = MediaCommand(MediaCommandType.switchVideo,
            value: SwitchVideoValue(video: v, startAt: startAt));
      } else {
        offlineCurrentlyPlaying = video;
        mediaCommand =
            MediaCommand(MediaCommandType.switchToOfflineVideo, value: video);
      }

      emit(state.copyWith(
          position: Duration.zero,
          forwardStep: defaultStep,
          rewindStep: defaultStep,
          mediaCommand: mediaCommand,
          currentlyPlaying: currentlyPlaying,
          offlineCurrentlyPlaying: offlineCurrentlyPlaying));

      await setSponsorBlock();

      if (!isTv) {
        mediaHandler.skipToQueueItem(currentIndex);
      }
    } catch (err) {
      if (state.videos.length == 1) {
        // if we can't get video details, we need to stop everything
        log.severe(
            "Couldn't play video  '${video.videoId}', stopping player to avoid app crash");
        hide();
      } else {
        // if we have more than 1 video
        log.severe(
            "Couldn't play video  '${video.videoId}', removing it from the queue");

        removeVideoFromQueue(video.videoId);
        _playNextNow();
      }
    }
  }

  playOfflineVideos(List<DownloadedVideo> offlineVids) async {
    log.fine('Playing ${offlineVids.length} offline videos');
    await _playVideos(offlineVids);
  }

  playVideo(List<BaseVideo> v, {bool? audio, Duration? startAt}) async {
    List<BaseVideo> videos = v.where((element) => !element.filtered).toList();
    // TODO: find how to do this with auto router
    log.fine('Playing ${videos.length} videos');

    setAudio(audio);

    await _playVideos(videos, startAt: startAt);
  }

  switchToOfflineVideo(DownloadedVideo video) async {
    await _switchToVideo(video);
  }

  switchToVideo(BaseVideo video, {Duration? startAt}) async {
    await _switchToVideo(video, startAt: startAt);
  }

  void togglePlaying() {
    state.isPlaying ? pause() : play();
  }

  play() {
    emit(state.copyWith(
        mediaCommand: const MediaCommand(MediaCommandType.play)));
  }

  pause() {
    emit(state.copyWith(
        mediaCommand: const MediaCommand(MediaCommandType.pause)));
  }

  removeVideoFromQueue(String videoId) {
    var videos = List<BaseVideo>.from(state.videos);
    var offlineVideos = List<DownloadedVideo>.from(state.offlineVideos);
    var listToUpdate = videos.isNotEmpty ? videos : offlineVideos;
    if (listToUpdate.length == 1) {
      hide();
    } else {
      var playQueue = ListQueue<String>.from(state.playQueue)
        ..removeWhere((element) => element == videoId);
      var playedVideos = List<String>.from(state.playedVideos)
        ..removeWhere((element) => element == videoId);
      listToUpdate.removeWhere((element) => element.videoId == videoId);
      emit(state.copyWith(
          videos: videos,
          offlineVideos: offlineVideos,
          playQueue: playQueue,
          playedVideos: playedVideos));
    }
  }

  void videoDragged(DragUpdateDetails details) {
    // we  change the display mode if there's a big enough drag movement to avoid jittery behavior when dragging slow
    var isMini = state.isMini;
    var mediaEvent = state.mediaEvent;
    if (details.delta.dy.abs() > 3) {
      isMini = details.delta.dy > 0;
      mediaEvent = MediaEvent(
          state: MediaState.playing,
          type: MediaEventType.miniDisplayChanged,
          value: state.isMini);
    }
    var dragDistance = state.dragDistance + details.delta.dy;
    // we're going down, putting threshold high easier to switch to mini player
    emit(state.copyWith(
        isDragging: true,
        top: details.globalPosition.dy,
        dragDistance: dragDistance,
        isMini: isMini,
        mediaEvent: mediaEvent));
  }

  void videoDraggedEnd(DragEndDetails details) {
    bool showMini =
        state.dragDistance.abs() > 200 ? state.isMini : state.dragStartMini;
    if (showMini) {
      showMiniPlayer();
    } else {
      showBigPlayer();
    }
  }

  void videoDragStarted(DragStartDetails details) {
    emit(state.copyWith(dragDistance: 0, dragStartMini: state.isMini));
  }

  bool isVideoInQueue(Video video) {
    return state.videos
            .indexWhere((element) => element.videoId == video.videoId) >=
        0;
  }

  onQueueReorder(int oldItemIndex, int newItemIndex) {
    log.fine('Dragged video');
    var videos = List<BaseVideo>.from(state.videos);
    var offlineVideos = List<DownloadedVideo>.from(state.offlineVideos);
    var listToUpdate = videos.isNotEmpty ? videos : offlineVideos;
    var movedItem = listToUpdate.removeAt(oldItemIndex);

    listToUpdate.insert(newItemIndex, movedItem);
    log.fine(
        'Reordered list: $oldItemIndex new index: ${listToUpdate.indexOf(movedItem)}');
    var playedVideos = List<String>.from(state.playedVideos);
    if (newItemIndex <= currentIndex) {
      playedVideos.add(listToUpdate[newItemIndex].videoId);
    }
/*
    if (oldItemIndex == state.currentIndex) {
      state.currentIndex = newItemIndex;
    } else if (oldItemIndex > state.currentIndex && newItemIndex <= state.currentIndex) {
      state.currentIndex++;
    } else if (oldItemIndex < state.currentIndex && newItemIndex >= state.currentIndex) {
      state.currentIndex--;
    }
*/

    emit(state.copyWith(
        playedVideos: playedVideos,
        videos: videos,
        offlineVideos: offlineVideos));
    generatePlayQueue();
  }

  void playVideoNext(BaseVideo video) {
    if (state.videos.isEmpty) {
      playVideo([video]);
    } else {
      var videos = List<BaseVideo>.from(state.videos)..add(video);
      var playQueue = ListQueue<String>.from(state.playQueue)
        ..addFirst(video.videoId);
      emit(state.copyWith(videos: videos, playQueue: playQueue));
    }
  }

  setSponsorBlock() async {
    List<Pair<int>> newSegments = [];
    if (state.currentlyPlaying != null) {
      List<SponsorSegmentType> types = SponsorSegmentType.values
          .where((e) => db.getSettings(e.settingsName())?.value == 'true')
          .toList();

      if (types.isNotEmpty) {
        List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(
            state.currentlyPlaying!.videoId, types);
        List<Pair<int>> segments = List.from(sponsorSegments.map((e) {
          Duration start = Duration(seconds: e.segment[0].floor());
          Duration end = Duration(seconds: e.segment[1].floor());
          Pair<int> segment = Pair(start.inMilliseconds, end.inMilliseconds);
          return segment;
        }));

        newSegments = segments;
        log.fine('we found ${segments.length} segments to skip');
      }
    }
    emit(state.copyWith(sponsorSegments: newSegments));
  }

  seek(Duration duration) {
    if (duration.inSeconds < 0) {
      duration = Duration.zero;
    }

    var videoLength = state.currentlyPlaying?.lengthSeconds ??
        state.offlineCurrentlyPlaying?.lengthSeconds ??
        1;
    if (duration.inSeconds > (videoLength)) {
      duration = Duration(seconds: videoLength);
    }

    emit(state.copyWith(
        position: duration,
        mediaCommand: MediaCommand(MediaCommandType.seek, value: duration)));
  }

  void fastForward() {
    var newPosition = state.position + Duration(seconds: state.forwardStep);
    seek(newPosition);
    log.info('fast forward $newPosition - step: ${state.forwardStep}');
    emit(state.copyWith(
      totalFastForward: state.totalFastForward + state.forwardStep,
      forwardStep: (state.forwardStep * stepMultiplier).floor(),
    ));
    EasyDebounce.debounce('fast-forward-step', const Duration(seconds: 1), () {
      emit(state.copyWith(
        forwardStep: defaultStep,
        totalFastForward: 0,
      ));
    });
  }

  void rewind() {
    seek(state.position - Duration(seconds: state.rewindStep));
    emit(state.copyWith(
      totalRewind: state.totalRewind + state.rewindStep,
      rewindStep: (state.rewindStep * stepMultiplier).floor(),
    ));
    EasyDebounce.debounce('fast-rewind-step', const Duration(seconds: 1), () {
      emit(state.copyWith(
        rewindStep: defaultStep,
        totalRewind: 0,
      ));
    });
  }

  Future<MediaItem?> getMediaItem(int index) async {
    if (state.videos.isNotEmpty) {
      var e = state.videos[index];
      return MediaItem(
          id: e.videoId,
          title: e.title,
          artist: e.author,
          duration: Duration(seconds: e.lengthSeconds),
          album: '',
          artUri: Uri.parse(
              ImageObject.getBestThumbnail(e.videoThumbnails)?.url ?? ''));
    } else if (state.offlineVideos.isNotEmpty) {
      var e = state.offlineVideos[index];
      var path = await e.thumbnailPath;
      return MediaItem(
          id: e.videoId,
          title: e.title,
          artist: e.author,
          duration: Duration(seconds: e.lengthSeconds),
          album: '',
          artUri: Uri.file(path));
    }
    return null;
  }

  void setSpeed(double d) {
    emit(state.copyWith(
        mediaCommand: MediaCommand(MediaCommandType.speed, value: d)));
  }

  void setFullScreen(FullScreenState fsState) {
    // emit(state.copyWith(mediaCommand: MediaCommand(MediaCommandType.fullScreen, value: fsState)));
    emit(state.copyWith(
        fullScreenState: fsState,
        mediaCommand: MediaCommand(fsState == FullScreenState.notFullScreen
            ? MediaCommandType.exitFullScreen
            : MediaCommandType.enterFullScreen),
        mediaEvent: MediaEvent(
            state: state.mediaEvent.state,
            type: MediaEventType.fullScreenChanged,
            value: fsState)));

    switch (fsState) {
      case FullScreenState.fullScreen:
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
        // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.black));
        if (settings.state.forceLandscapeFullScreen && state.aspectRatio > 1) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
          ]);
        }
        break;
      default:
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
        SystemChrome.setPreferredOrientations([]);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    }
  }

  void enterPip() {
    setFullScreen(FullScreenState.fullScreen);
    setEvent(
        MediaEvent(state: MediaState.playing, type: MediaEventType.enteredPip));
    SimplePip(
      onPipExited: () {
        setEvent(MediaEvent(
            state: MediaState.playing, type: MediaEventType.exitedPip));
        setFullScreen(FullScreenState.notFullScreen);
      },
    ).enterPipMode();
  }

  void setMuted(bool muted) {
    emit(state.copyWith(
        mediaCommand: MediaCommand(
            muted ? MediaCommandType.mute : MediaCommandType.unmute)));
  }

  void togglePlay() {
    if (state.isPlaying) {
      pause();
    } else {
      play();
    }
  }

  Duration get duration => Duration(
      seconds: (state.currentlyPlaying?.lengthSeconds ??
          state.offlineCurrentlyPlaying?.lengthSeconds ??
          1));

  double get progress =>
      state.position.inMilliseconds / duration.inMilliseconds;

  void switchAudio(bool value) {
    if (state.currentlyPlaying != null) {
      emit(state.copyWith(isAudio: value));
      switchToVideo(state.currentlyPlaying!, startAt: state.position);
    }
  }

  void generatePlayQueue() {
    // get videos minus the one we already played and the currently playing video
    List<String> videos =
        (state.videos.isNotEmpty ? state.videos : state.offlineVideos)
            .where((element) => !state.playedVideos.contains(element.videoId))
            .where((element) =>
                element.videoId !=
                (state.currentlyPlaying?.videoId ??
                    state.offlineCurrentlyPlaying?.videoId))
            .map((e) => e.videoId)
            .toList();

    // if we're in shuffle mode, we shuffle the collection
    if (settings.state.playerShuffleMode) {
      videos.shuffle();
    }

    ListQueue<String> playQueue = ListQueue.from(videos);
    emit(state.copyWith(playQueue: playQueue));
  }

  void onOrientationChange() {
    if (getDeviceType() == DeviceType.phone &&
        (orientation == Orientation.landscape) &&
        !state.isMini) {
      setFullScreen(FullScreenState.fullScreen);
    }
  }
}

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    // player display properties
    @Default(true) bool isMini,
    double? top,
    @Default(false) bool isDragging,
    @Default(0) int selectedFullScreenIndex,
    @Default(true) bool isHidden,
    @Default(0) double opacity,
    @Default(0) double dragDistance,
    @Default(true) bool dragStartMini,
    @Default(targetHeight) double height,
    @Default(FullScreenState.notFullScreen) FullScreenState fullScreenState,
    @Default(false) bool muted,
    @Default(16 / 9) double aspectRatio,

    // videos to play
    Video? currentlyPlaying,
    DownloadedVideo? offlineCurrentlyPlaying,
    @Default([]) List<BaseVideo> videos,
    @Default([]) List<DownloadedVideo> offlineVideos,

    // playlist controls
    @Default([]) List<String> playedVideos,
    required ListQueue<String> playQueue,
    @Default(false) bool isAudio,

    // playing video data
    @Default(false) bool isPip,
    @Default(Offset.zero) Offset offset,
    Duration? startAt,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration bufferedPosition,
    @Default(false) bool isPlaying,
    @Default(1.0) double speed,

    // events
    // command we send down the stack, namely video / audio player
    MediaCommand? mediaCommand,

    // events we receive from bottom of stack
    @Default(MediaEvent(state: MediaState.idle)) MediaEvent mediaEvent,

    // sponsor block variables
    @Default([]) List<Pair<int>> sponsorSegments,
    @Default(Pair(0, 0)) Pair<int> nextSegment,

    // step in seconds when fast forawrd or fast rewind
    @Default(defaultStep) int forwardStep,
    @Default(defaultStep) rewindStep,
    @Default(0) int totalFastForward,
    @Default(0) totalRewind,
  }) = _PlayerState;

  bool get hasVideo =>
      currentlyPlaying != null || offlineCurrentlyPlaying != null;

  bool get hasQueue => offlineVideos.length > 1 || videos.length > 1;

  const PlayerState._();

//
  static PlayerState init(List<BaseVideo>? videos) {
    return PlayerState(videos: videos ?? [], playQueue: ListQueue.from([]));
  }
}
