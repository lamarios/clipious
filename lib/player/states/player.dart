import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/models/mediaCommand.dart';
import 'package:invidious/player/models/mediaEvent.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:invidious/utils/models/image_object.dart';
import 'package:logging/logging.dart';
import 'package:simple_pip_mode/simple_pip.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../main.dart';
import '../../mediaHander.dart';
import '../../settings/states/settings.dart';
import '../../utils/models/pair.dart';
import '../../videos/models/base_video.dart';
import '../../videos/models/db/progress.dart' as dbProgress;
import '../../videos/models/sponsor_segment.dart';
import '../../videos/models/sponsor_segment_types.dart';
import '../../videos/models/video.dart';

part 'player.g.dart';

const double targetHeight = 69;
const double miniPlayerThreshold = 300;
const skipToVideoThrottleName = 'skip-to-video';
const double bigPlayerThreshold = 700;
const defaultStep = 9;
const stepMultiplier = 0.15;

var log = Logger('MiniPlayerController');

enum PlayerRepeat { noRepeat, repeatAll, repeatOne }

class PlayerCubit extends Cubit<PlayerState> {
  final SettingsCubit settings;

  PlayerCubit(super.initialState, this.settings) {
    onReady();
  }

  setEvent(MediaEvent event) {
    handleMediaEvent(event);
    mapMediaEventToMediaHandler(event);
    var state = this.state.copyWith();
    state.mediaEvent = event;
    emit(state);
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
        systemActions: const {MediaAction.seek, MediaAction.seekForward, MediaAction.seekBackward, MediaAction.setShuffleMode, MediaAction.setRepeatMode},
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
        playing: event.state == MediaState.idle || event.state == MediaState.completed ? false : state.isPlaying,
        updatePosition: state.position,
        bufferedPosition: state.bufferedPosition,
        speed: state.speed,
        queueIndex: state.currentIndex,
      );

      mediaHandler.playbackState.add(playbackState);
    }
  }

  onReady() async {
    if (!isTv) {
      mediaHandler = await AudioService.init(
        builder: () => MediaHandler(this),
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'com.github.lamarios.clipious.channel.audio',
          androidNotificationChannelName: 'Video playback',
          androidNotificationOngoing: true,
        ),
      );
      BackButtonInterceptor.add(handleBackButton, name: 'miniPlayer', zIndex: 2, ifNotYetIntercepted: true);
    } else if (isTv && state.videos.isNotEmpty) {
      switchToVideo(state.videos[0]);
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
    var state = this.state.copyWith();
    state.isPip = pip;
    emit(state);
  }

  _setMuted(bool muted) {
    emit(state.copyWith(muted: muted));
  }

  @override
  close() async {
    BackButtonInterceptor.removeByName('miniPlayer');
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
    var state = this.state.copyWith();
    state.videos = videos.where((element) => !element.filtered).toList();
    state.offlineVideos = [];
    emit(state);
  }

  selectTab(int index) {
    var state = this.state.copyWith();
    state.selectedFullScreenIndex = index;
    emit(state);
  }

  setAudio(bool? newValue) {
    var state = this.state.copyWith();
    newValue ??= false;

    state.isAudio = newValue;
    emit(state);
  }

  hide() {
    var state = this.state.copyWith();
    state.isMini = true;
    state.mediaEvent = MediaEvent(state: MediaState.playing, type: MediaEventType.miniDisplayChanged, value: state.isMini);
    state.top = null;
    state.height = targetHeight;
    state.isHidden = true;
    state.videos = [];
    state.playedVideos = [];
    state.currentlyPlaying = null;
    state.offlineCurrentlyPlaying = null;
    state.offlineVideos = [];
    state.opacity = 0;
    emit(state);
    setEvent(MediaEvent(state: MediaState.idle));
  }

  double get getBottom => state.isHidden ? -targetHeight : 0;

  BaseVideo showVideo() {
    var video = state.videos[state.currentIndex];
    hide();
    return video;
  }

  saveProgress(int timeInSeconds) {
    if (state.currentlyPlaying != null) {
      int currentPosition = timeInSeconds;
      // saving progress
      var currentProgress = currentPosition / state.currentlyPlaying!.lengthSeconds;
      if (currentProgress >= 0.9) currentProgress = 1; // we consider a video with 90%+ progress as watched
      var progress = dbProgress.Progress.named(progress: currentProgress, videoId: state.currentlyPlaying!.videoId);

      db.saveProgress(progress);

      if (progress.progress > 0.5) {
        EasyDebounce.debounce('invidious-progress-sync-${progress.videoId}', const Duration(seconds: 5), () {
          if (service.isLoggedIn()) {
            service.addToUserHistory(progress.videoId);
          }
        });
      }
    }
  }

  queueVideos(List<BaseVideo> videos) {
    var state = this.state.copyWith();
    state.offlineVideos = [];
    if (videos.isNotEmpty) {
      //removing videos that are already in the queue
      state.videos.addAll(videos.where((v) => state.videos.indexWhere((v2) => v2.videoId == v.videoId) == -1).where((element) => !element.filtered));
    } else {
      playVideo(videos);
    }
    log.fine('Videos in queue ${videos.length}');
    emit(state);
  }

  showBigPlayer() {
    var state = this.state.copyWith();
    state.isMini = false;
    state.mediaEvent = MediaEvent(state: MediaState.playing, type: MediaEventType.miniDisplayChanged, value: state.isMini);
    state.top = 0;
    state.opacity = 1;
    state.isHidden = false;
    emit(state);
  }

  showMiniPlayer() {
    if (state.currentlyPlaying != null || state.offlineCurrentlyPlaying != null) {
      var state = this.state.copyWith();
      state.isMini = true;
      state.mediaEvent = MediaEvent(state: MediaState.playing, type: MediaEventType.miniDisplayChanged, value: state.isMini);
      state.top = null;
      state.isHidden = false;
      state.opacity = 1;
      emit(state);
    }
  }

  onProgress(Duration? position) {
    var state = this.state.copyWith();
    state.position = position ?? Duration.zero;
    int currentPosition = state.position.inSeconds;
    saveProgress(currentPosition);
    log.fine("video event");

    emit(state);

    if (state.sponsorSegments.isNotEmpty) {
      double positionInMs = currentPosition * 1000;
      Pair<int> nextSegment = state.sponsorSegments.firstWhere((e) => e.first <= positionInMs && positionInMs <= e.last, orElse: () => Pair<int>(-1, -1));
      if (nextSegment.first != -1) {
        seek(Duration(milliseconds: nextSegment.last + 1000));
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
  }

  playNext() {
    EasyThrottle.throttle(skipToVideoThrottleName, Duration(seconds: 1), () {
      if (state.videos.isNotEmpty || state.offlineVideos.isNotEmpty) {
        var state = this.state.copyWith();
        var allVideos = state.videos.isNotEmpty ? state.videos : state.offlineVideos;

        log.fine('Play next: played length: ${state.playedVideos.length} videos: ${state.videos.length} Repeat mode: ${settings.state.playerRepeatMode}');
        if (settings.state.playerRepeatMode == PlayerRepeat.repeatOne) {
          if (state.videos.isNotEmpty) {
            switchToVideo(state.currentlyPlaying!, startAt: Duration.zero);
          } else if (state.offlineVideos.isNotEmpty) {
            switchToOfflineVideo(state.offlineCurrentlyPlaying!);
          }
        } else {
          state = this.state.copyWith();

          // we get all the available videos to play ( played - all videos)

          var available = allVideos.where((element) => !state.playedVideos.contains(element.videoId)).toList();

          // if none left we restart if repeat, do nothing otherwise
          if (available.isEmpty) {
            if (settings.state.playerRepeatMode == PlayerRepeat.repeatAll) {
              state.playedVideos = [];
              state.currentIndex = 0;
            } else {
              return;
            }
          } else {
            // if remaining, we choose  either the enxt one or a random one if shuffle`
            late IdedVideo nextVid;
            if (settings.state.playerShuffleMode) {
              nextVid = available[Random().nextInt(available.length)];
            } else {
              // we play the first one
              nextVid = available[0];
            }
            state.currentIndex = allVideos.indexWhere((element) => element.videoId == nextVid.videoId);
          }

          emit(state);
          if (state.videos.isNotEmpty) {
            switchToVideo(state.videos[state.currentIndex]);
          } else if (state.offlineVideos.isNotEmpty) {
            switchToOfflineVideo(state.offlineVideos[state.currentIndex]);
          }
        }
      }
    });
  }

  playPrevious() {
    EasyThrottle.throttle(skipToVideoThrottleName, const Duration(seconds: 1), () {
      var state = this.state.copyWith();
      var allVideos = state.videos.isNotEmpty ? state.videos : state.offlineVideos;
      state.playedVideos.removeLast();
      // we remove the last video and see if there's anything else to play
      if (state.playedVideos.isEmpty) {
        state.currentIndex = 0;
      } else {
        String nextId = state.playedVideos.last;
        state.currentIndex = allVideos.indexWhere((element) => element.videoId == nextId);
      }

      emit(state);
      if (state.videos.isNotEmpty) {
        switchToVideo(state.videos[state.currentIndex], startAt: Duration.zero);
      } else if (state.offlineVideos.isNotEmpty) {
        switchToOfflineVideo(state.offlineVideos[state.currentIndex]);
      }
    });
  }

  _setPlaying(bool playing) {
    var state = this.state.copyWith();
    state.isPlaying = playing;
    emit(state);
  }

  _playVideos(List<IdedVideo> vids, {Duration? startAt}) async {
    if (vids.isNotEmpty) {
      var state = this.state.copyWith();
      state.startAt = startAt;
      bool isOffline = vids[0] is DownloadedVideo;

      state.mediaEvent = MediaEvent(state: MediaState.loading);

      if (isOffline) {
        state.videos = [];
        state.offlineVideos = List.from(vids, growable: true);
      } else {
        state.offlineVideos = [];
        state.videos = List.from(vids, growable: true);
      }

      state.playedVideos = [];
      state.currentIndex = 0;
      state.selectedFullScreenIndex = 0;
      if (vids.length > 1) {
        state.selectedFullScreenIndex = 3;
      }
      state.opacity = 0;
      state.top = 500;
      emit(state);

      showBigPlayer();
      if (isOffline) {
        await switchToOfflineVideo(state.offlineVideos[0]);
      } else {
        await switchToVideo(state.videos[0], startAt: startAt);
      }
    }
  }

  _switchToVideo(IdedVideo video, {Duration? startAt}) async {
    bool isOffline = video is DownloadedVideo;
    // we want to switch to audio mode as soon as we can to prevent problems when switching from audio to video or the other way
    if (isOffline) {
      setAudio(video.audioOnly);
    }

    var state = this.state.copyWith();

    state.mediaEvent = MediaEvent(state: MediaState.loading);

    if (isOffline) {
      state.videos = [];
      state.currentlyPlaying = null;
    } else {
      state.offlineVideos = [];
      state.offlineCurrentlyPlaying = null;
    }

    List<IdedVideo> toCheck = isOffline ? state.offlineVideos : state.videos;

    int index = toCheck.indexWhere((element) => element.videoId == video.videoId);
    if (index >= 0 && index < toCheck.length) {
      state.currentIndex = index;
    } else {
      state.currentIndex = 0;
    }

    emit(state);
    state = this.state.copyWith();

    if (!isOffline) {
      late Video v;
      if (video is Video) {
        v = video;
      } else {
        v = await service.getVideo(video.videoId);
      }
      state.currentlyPlaying = v;
      state.mediaCommand = MediaCommand(MediaCommandType.switchVideo, value: SwitchVideoValue(video: v, startAt: startAt));
    } else {
      state.offlineCurrentlyPlaying = video;
      state.mediaCommand = MediaCommand(MediaCommandType.switchToOfflineVideo, value: video);
    }

    //if we replay a video, we move it to the top of the played stack
    state.playedVideos.removeWhere((element) => element == video.videoId);
    state.playedVideos.add(video.videoId);
    state.position = Duration.zero;
    state.forwardStep = defaultStep;
    state.rewindStep = defaultStep;

    emit(state);

    setSponsorBlock();

    if (!isTv) {
      mediaHandler.skipToQueueItem(state.currentIndex);
    }
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
    await _switchToVideo(video);
  }

  switchToVideo(BaseVideo video, {Duration? startAt}) async {
    await _switchToVideo(video, startAt: startAt);
  }

  void togglePlaying() {
    state.isPlaying ? pause() : play();
  }

  play() {
    var state = this.state.copyWith();
    state.mediaCommand = MediaCommand(MediaCommandType.play);
    emit(state);
  }

  pause() {
    var state = this.state.copyWith();
    state.mediaCommand = MediaCommand(MediaCommandType.pause);
    emit(state);
  }

  BaseVideo? get currentVideo => state.videos.isNotEmpty ? state.videos[state.currentIndex] : null;

  removeVideoFromQueue(String videoId) {
    var state = this.state.copyWith();
    var listToUpdate = state.videos.isNotEmpty ? state.videos : state.offlineVideos;
    if (listToUpdate.length == 1) {
      hide();
    } else {
      int index = state.videos.isNotEmpty ? state.videos.indexWhere((element) => element.videoId == videoId) : state.offlineVideos.indexWhere((element) => element.videoId == videoId);
      state.playedVideos.remove(videoId);
      if (index >= 0) {
        if (index < state.currentIndex) {
          state.currentIndex--;
        }
        listToUpdate.removeAt(index);
      }
    }
    emit(state);
  }

  void videoDragged(DragUpdateDetails details) {
    var state = this.state.copyWith();
    // log.info('delta: ${details.delta.dy}, local: ${details.localPosition.dy}, global: ${details.globalPosition.dy}');
    state.isDragging = true;
    state.top = details.globalPosition.dy;
    // we  change the display mode if there's a big enough drag movement to avoid jittery behavior when dragging slow
    if (details.delta.dy.abs() > 3) {
      state.isMini = details.delta.dy > 0;
      state.mediaEvent = MediaEvent(state: MediaState.playing, type: MediaEventType.miniDisplayChanged, value: state.isMini);
    }
    state.dragDistance += details.delta.dy;
    // we're going down, putting threshold high easier to switch to mini player
    emit(state);
  }

  void videoDraggedEnd(DragEndDetails details) {
    bool showMini = state.dragDistance.abs() > 200 ? state.isMini : state.dragStartMini;
    if (showMini) {
      showMiniPlayer();
    } else {
      showBigPlayer();
    }
  }

  void videoDragStarted(DragStartDetails details) {
    state.dragDistance = 0;
    state.dragStartMini = state.isMini;
  }

  bool isVideoInQueue(Video video) {
    return state.videos.indexWhere((element) => element.videoId == video.videoId) >= 0;
  }

  onQueueReorder(int oldItemIndex, int newItemIndex) {
    var state = this.state.copyWith();
    log.fine('Dragged video');
    var listToUpdate = state.videos.isNotEmpty ? state.videos : state.offlineVideos;
    var movedItem = listToUpdate.removeAt(oldItemIndex);
    listToUpdate.insert(newItemIndex, movedItem);
    log.fine('Reordered list: $oldItemIndex new index: ${listToUpdate.indexOf(movedItem)}');
    if (oldItemIndex == state.currentIndex) {
      state.currentIndex = newItemIndex;
    } else if (oldItemIndex > state.currentIndex && newItemIndex <= state.currentIndex) {
      state.currentIndex++;
    } else if (oldItemIndex < state.currentIndex && newItemIndex >= state.currentIndex) {
      state.currentIndex--;
    }

    emit(state);
  }

  void playVideoNext(BaseVideo video) {
    if (state.videos.isEmpty) {
      playVideo([video]);
    } else {
      var state = this.state.copyWith();
      int newIndex = state.currentIndex + 1;
      int oldIndex = state.videos.indexWhere((element) => element.videoId == video.videoId);
      if (oldIndex == -1) {
        state.videos.insert(newIndex, video);
        emit(state);
      } else {
        onQueueReorder(oldIndex, newIndex);
      }
    }
  }

  setSponsorBlock() async {
    var state = this.state.copyWith();
    if (state.currentlyPlaying != null) {
      List<SponsorSegmentType> types = SponsorSegmentType.values.where((e) => db.getSettings(e.settingsName())?.value == 'true').toList();

      if (types.isNotEmpty) {
        List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(state.currentlyPlaying!.videoId, types);
        List<Pair<int>> segments = List.from(sponsorSegments.map((e) {
          Duration start = Duration(seconds: e.segment[0].floor());
          Duration end = Duration(seconds: e.segment[1].floor());
          Pair<int> segment = Pair(start.inMilliseconds, end.inMilliseconds);
          return segment;
        }));

        state.sponsorSegments = segments;
        log.fine('we found ${segments.length} segments to skip');
      } else {
        state.sponsorSegments = [];
      }
    } else {
      state.sponsorSegments = [];
    }
    emit(state);
  }

  seek(Duration duration) {
    if (duration.inSeconds < 0) {
      duration = Duration.zero;
    }

    var videoLength = this.state.currentlyPlaying?.lengthSeconds ?? this.state.offlineCurrentlyPlaying?.lengthSeconds ?? 1;
    if (duration.inSeconds > (videoLength)) {
      duration = Duration(seconds: videoLength);
    }

    var state = this.state.copyWith();
    state.position = duration;
    state.mediaCommand = MediaCommand(MediaCommandType.seek, value: duration);
    emit(state);
  }

  void fastForward() {
    state.forwardStep += (state.forwardStep * stepMultiplier).floor();
    seek(state.position + Duration(seconds: state.forwardStep));
    EasyDebounce.debounce('fast-forward-step', const Duration(seconds: 1), () {
      emit(state.copyWith(forwardStep: defaultStep));
    });
  }

  void rewind() {
    state.rewindStep += (state.rewindStep * stepMultiplier).floor();
    seek(state.position - Duration(seconds: state.rewindStep));
    EasyDebounce.debounce('fast-rewind-step', const Duration(seconds: 1), () {
      emit(state.copyWith(rewindStep: defaultStep));
    });
  }

  Future<MediaItem?> getMediaItem(int index) async {
    if (state.videos.isNotEmpty) {
      var e = state.videos[index];
      return MediaItem(
          id: e.videoId, title: e.title, artist: e.author, duration: Duration(seconds: e.lengthSeconds), album: '', artUri: Uri.parse(ImageObject.getBestThumbnail(e.videoThumbnails)?.url ?? ''));
    } else if (state.offlineVideos.isNotEmpty) {
      var e = state.offlineVideos[index];
      var path = await e.thumbnailPath;
      return MediaItem(id: e.videoId, title: e.title, artist: e.author, duration: Duration(seconds: e.lengthSeconds), album: '', artUri: Uri.file(path));
    }
    return null;
  }

  void setSpeed(double d) {
    var state = this.state.copyWith();
    state.mediaCommand = MediaCommand(MediaCommandType.speed, value: d);
    emit(state);
  }

  void setFullScreen(FullScreenState fsState) {
    // emit(state.copyWith(mediaCommand: MediaCommand(MediaCommandType.fullScreen, value: fsState)));
    emit(state.copyWith(
        fullScreenState: fsState,
        mediaCommand: MediaCommand(fsState == FullScreenState.notFullScreen ? MediaCommandType.exitFullScreen : MediaCommandType.enterFullScreen),
        mediaEvent: MediaEvent(state: state.mediaEvent.state, type: MediaEventType.fullScreenChanged, value: fsState)));

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
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        SystemChrome.setPreferredOrientations([]);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    }
  }

  void enterPip() {
    setFullScreen(FullScreenState.fullScreen);
    setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.enteredPip));
    SimplePip(
      onPipExited: () {
        setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.exitedPip));
        setFullScreen(FullScreenState.notFullScreen);
      },
    ).enterPipMode();
  }

  void setMuted(bool muted) {
    emit(state.copyWith(mediaCommand: MediaCommand(muted ? MediaCommandType.mute : MediaCommandType.unmute)));
  }

  void togglePlay() {
    if (state.isPlaying) {
      pause();
    } else {
      play();
    }
  }

  Duration get duration => Duration(seconds: (state.currentlyPlaying?.lengthSeconds ?? state.offlineCurrentlyPlaying?.lengthSeconds ?? 1));

  double get progress => state.position.inMilliseconds / duration.inMilliseconds;
}

@CopyWith(constructor: "_")
class PlayerState {
  // player display properties
  bool isMini = true;
  double? top;
  bool isDragging = false;
  int selectedFullScreenIndex = 0;
  bool isHidden = true;
  double opacity = 0;
  double dragDistance = 0;
  bool dragStartMini = true;
  double height = targetHeight;
  FullScreenState fullScreenState = FullScreenState.notFullScreen;
  bool muted = false;
  double aspectRatio = 16 / 9;

  // videos to play
  Video? currentlyPlaying;

  bool get hasVideo => currentlyPlaying != null || offlineCurrentlyPlaying != null;
  DownloadedVideo? offlineCurrentlyPlaying;
  List<BaseVideo> videos = List.empty(growable: true);
  List<DownloadedVideo> offlineVideos = [];

  // playlist controls
  List<String> playedVideos = [];
  bool isAudio = false;

  // playing video data
  int currentIndex = 0;
  bool isPip = false;
  Offset offset = Offset.zero;
  Duration? startAt;
  Duration position = Duration.zero;
  Duration bufferedPosition = Duration.zero;
  bool isPlaying = false;

  bool get hasQueue => offlineVideos.length > 1 || videos.length > 1;

  double speed = 1.0;

  // events
  // command we send down the stack, namely video / audio player
  MediaCommand? mediaCommand;

  // events we receive from bottom of stack
  MediaEvent mediaEvent = MediaEvent(state: MediaState.idle);

  // sponsor block variables
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);

  // step in seconds when fast forawrd or fast rewind
  int forwardStep = defaultStep, rewindStep = defaultStep;

  PlayerState();

  PlayerState.withVideos(this.videos);

  PlayerState._(
      this.currentIndex,
      this.videos,
      this.height,
      this.isMini,
      this.top,
      this.isDragging,
      this.selectedFullScreenIndex,
      this.isPip,
      this.isHidden,
      this.speed,
      this.currentlyPlaying,
      this.offlineCurrentlyPlaying,
      this.opacity,
      this.aspectRatio,
      this.dragDistance,
      this.dragStartMini,
      this.bufferedPosition,
      this.playedVideos,
      this.offset,
      this.isAudio,
      this.startAt,
      this.isPlaying,
      this.sponsorSegments,
      this.nextSegment,
      this.offlineVideos,
      this.position,
      this.mediaCommand,
      this.fullScreenState,
      this.muted,
      this.forwardStep,
      this.rewindStep,
      this.mediaEvent);
}
