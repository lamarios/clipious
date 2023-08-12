import 'package:better_player/better_player.dart';
import 'package:better_player/src/video_player/video_player_platform_interface.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/controllers/settingsController.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/mediaEvent.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import 'package:wakelock/wakelock.dart';

import '../database.dart';
import '../globals.dart';
import '../main.dart';
import '../models/db/settings.dart';
import '../models/pair.dart';
import '../models/sponsorSegment.dart';
import '../models/sponsorSegmentTypes.dart';
import '../models/video.dart';
import '../views/videoPlayer/playerControls.dart';
import 'interfaces/playerController.dart';
import 'miniPayerController.dart';

class VideoPlayerController extends PlayerController {
  static VideoPlayerController? to() => safeGet();

  final log = Logger('VideoPlayer');
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);
  BetterPlayerController? videoController;
  int previousSponsorCheck = 0;
  bool useDash = db.getSettings(USE_DASH)?.value == 'true';
  AppLocalizations locals;
  final bool miniPlayer;
  final ColorScheme colors;
  final Color overFlowTextColor;
  final GlobalKey key;
  Duration? startAt;
  String selectedNonDashTrack = '';
  Duration? bufferPosition = Duration.zero;

  VideoPlayerController(
      {required this.colors,
      required this.overFlowTextColor,
      required this.key,
      Video? video,
      DownloadedVideo? offlineVideo,
      required this.miniPlayer,
      required this.locals,
      bool? disableControls,
      this.startAt})
      : super(video: video, offlineVideo: offlineVideo, disableControls: disableControls);

  @override
  void onInit() {
    super.onInit();
    if (miniPlayer) {
      FBroadcast.instance().register(BROADCAST_STOP_MINI_PLAYER, (value, callback) {
        disposeControllers();
      });
    } else {
      FBroadcast.instance().register(BROADCAST_STOP_PLAYING, (value, callback) {
        disposeControllers();
      });
    }
  }

  @override
  onReady() async {
    playVideo(offlineVideo != null, startAt: startAt);
  }

  @override
  onClose() {
    disposeControllers();
  }

  @override
  disposeControllers() {
    Wakelock.disable();
    log.fine("Disposing video controller");
    saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);
    videoController?.removeEventsListener(onVideoListener);
    videoController?.dispose();
    videoController = null;
  }

  @override
  saveProgress(int timeInSeconds) {
    if (video != null) {
      MiniPlayerController.to()?.saveProgress(video!.videoId, video!.lengthSeconds, timeInSeconds);
    }
  }

  onVideoListener(BetterPlayerEvent event) {
    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.progress:
        int currentPosition = (event.parameters?['progress'] as Duration).inSeconds;
        if (currentPosition > previousSponsorCheck + 1) {
          // saving progress
          saveProgress(currentPosition);
          log.fine("video event");

          if (sponsorSegments.isNotEmpty) {
            double positionInMs = currentPosition * 1000;
            Pair<int> nextSegment = sponsorSegments.firstWhere((e) => e.first <= positionInMs && positionInMs <= e.last, orElse: () => Pair<int>(-1, -1));
            if (nextSegment.first != -1) {
              videoController!.seekTo(Duration(milliseconds: nextSegment.last + 1000));
              final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
              scaffold?.showSnackBar(SnackBar(
                content: Text(locals.sponsorSkipped),
                duration: const Duration(seconds: 1),
              ));
            }
          }

          previousSponsorCheck = currentPosition;
          broadcastEvent(event);
        } else if (currentPosition + 2 < previousSponsorCheck) {
          // if we're more than 2 seconds behind, means we probably seek backward manually far away
          // so we reset the position
          previousSponsorCheck = currentPosition;
        }
        break;
      case BetterPlayerEventType.finished:
        if (video != null) {
          saveProgress(video!.lengthSeconds);
          // broadcastEvent(event);
        }
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.completed));
        break;
      case BetterPlayerEventType.initialized:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready));
        break;
      case BetterPlayerEventType.bufferingUpdate:
        List<DurationRange> durations = event.parameters?['buffered'] ?? [];
        bufferPosition = durations.sortBy((e) => e.end).map((e) => e.end).last;
        break;
      case BetterPlayerEventType.setupDataSource:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.loading));
        break;
      case BetterPlayerEventType.pipStart:
      case BetterPlayerEventType.pipStop:
      case BetterPlayerEventType.openFullscreen:
      case BetterPlayerEventType.hideFullscreen:
      case BetterPlayerEventType.overflowClosed:
      case BetterPlayerEventType.overflowOpened:
      case BetterPlayerEventType.initialized:
      case BetterPlayerEventType.bufferingEnd:
        broadcastEvent(event);
        break;
      case BetterPlayerEventType.seekTo:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.seek));
        broadcastEvent(event);
        break;
      case BetterPlayerEventType.bufferingStart:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.buffering));
        broadcastEvent(event);
        break;
      case BetterPlayerEventType.play:
        double speed = 1.0;
        if (db.getSettings(REMEMBER_PLAYBACK_SPEED)?.value == 'true') {
          speed = double.parse(db.getSettings(LAST_SPEED)?.value ?? '1.0');

          log.fine("Setting playback speed to $speed");
          videoController?.setSpeed(speed);
        }
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.play));
        broadcastEvent(event);
        break;
      case BetterPlayerEventType.pause:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.pause));
        break;
      case BetterPlayerEventType.changedSubtitles:
        db.saveSetting(SettingsValue(LAST_SUBTITLE, videoController?.betterPlayerSubtitlesSource?.name ?? ''));
        break;
      case BetterPlayerEventType.setSpeed:
        if (event.parameters?.containsKey("speed") ?? false) {
          db.saveSetting(SettingsValue(LAST_SPEED, event.parameters?["speed"].toString() ?? '1.0'));
        }
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.speedChanged));
        break;
      default:
        break;
    }
  }

  broadcastEvent(BetterPlayerEvent event) {
    isTv ? TvPlayerController.to()?.handleVideoEvent(event) : MiniPlayerController.to()?.handleVideoEvent(event);
  }

  toggleDash() {
    log.fine('toggle dash');
    // saving progress before we reload new video format
    saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);

    disposeControllers();

    db.saveSetting(SettingsValue(USE_DASH, (!useDash).toString()));
    useDash = !useDash;
    playVideo(false);
    update();
  }

  @override
  switchVideo(Video video, {Duration? startAt}) {
    videoController?.exitFullScreen();
    this.startAt = startAt;
    MiniPlayerController.to()?.handleVideoEvent(BetterPlayerEvent(BetterPlayerEventType.hideFullscreen));
    disposeControllers();
    this.video = video;
    playVideo(false, startAt: startAt);
  }

  @override
  togglePlaying() {
    if (videoController != null) {
      (videoController?.isPlaying() ?? false) ? videoController?.pause() : videoController?.play();
      update();
    }
  }

  @override
  toggleControls(bool visible) {
    videoController?.setControlsEnabled(visible);
  }

  @override
  playVideo(bool offline, {Duration? startAt}) async {
    // only used if the player is currently close because it is onReady that will actually play the video
    // need better way of handling this
    this.startAt = startAt;
    if (video != null || offlineVideo != null) {
      IdedVideo idedVideo = offline ? offlineVideo! : video!;
      videoController?.dispose();
      videoController = null;
      bufferPosition = Duration.zero;
      // we get segments if there are any, no need to wait.
      setSponsorBlock();

      if (startAt == null && !offline) {
        double progress = db.getVideoProgress(idedVideo.videoId);
        if (progress > 0 && progress < 0.90) {
          startAt = Duration(seconds: (offline ? offlineVideo!.lengthSeconds : video!.lengthSeconds * progress).floor());
        }
      }

      print('start at $startAt');

      late BetterPlayerDataSource betterPlayerDataSource;

      // getting data sources
      if (offline) {
        String videoPath = await offlineVideo!.mediaPath;

        betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.file,
          videoPath,
          videoFormat: BetterPlayerVideoFormat.other,
          liveStream: false,
        );
      } else {
        String baseUrl = db.getCurrentlySelectedServer().url;

        Map<String, String> resolutions = {};

        bool isHls = video!.hlsUrl != null;
        var formatStream = video!.formatStreams[video!.formatStreams.length - 1];
        String videoUrl = isHls
            ? '${video!.hlsUrl!}${service.useProxy() ? '?local=true' : ''}'
            : useDash
                ? '${video!.dashUrl}${service.useProxy() ? '?local=true' : ''}'
                : formatStream.url;
        if (!useDash) {
          selectedNonDashTrack = formatStream.resolution;
        }

        log.info('Playing url (dash ${useDash},  hasHls ? ${video!.hlsUrl != null})  ${videoUrl}');

        useDash = db.getSettings(USE_DASH)?.value == 'true';

        BetterPlayerVideoFormat format = isHls
            ? BetterPlayerVideoFormat.hls
            : useDash
                ? BetterPlayerVideoFormat.dash
                : BetterPlayerVideoFormat.other;

        if (format == BetterPlayerVideoFormat.other) {
          for (var value in video!.formatStreams) {
            resolutions[value.qualityLabel] = value.url;
          }
        }

        String lastSubtitle = '';
        if (db.getSettings(REMEMBER_LAST_SUBTITLE)?.value == 'true') {
          lastSubtitle = db.getSettings(LAST_SUBTITLE)?.value ?? '';
        }

        betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          videoUrl,
          videoFormat: format,
          liveStream: video!.liveNow,
          subtitles: video!.captions
              .map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['${baseUrl}${s.url}'], name: s.label, selectedByDefault: s.label == lastSubtitle))
              .toList(),
          resolutions: resolutions.isNotEmpty ? resolutions : null,
        );
      }

      Wakelock.enable();

      bool lockOrientation = db.getSettings(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';
      bool fillVideo = db.getSettings(FILL_FULLSCREEN)?.value == 'true';

      videoController = BetterPlayerController(
          BetterPlayerConfiguration(
              overlay: const PlayerControls(),
              deviceOrientationsOnFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
              deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
              handleLifecycle: false,
              autoDetectFullscreenDeviceOrientation: lockOrientation,
              autoDetectFullscreenAspectRatio: true,
              startAt: startAt,
              autoPlay: true,
              allowedScreenSleep: false,
              fit: fillVideo ? BoxFit.cover : BoxFit.contain,
              subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
                fontSize: double.parse(db.getSettings(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize),
              ),
              controlsConfiguration: BetterPlayerControlsConfiguration(
                showControls: false,
                // customControlsBuilder: (controller, onPlayerVisibilityChanged) => const PlayerControls(),
                // enablePlayPause: false,
                // overflowModalColor: colors.background,
                // overflowModalTextColor: overFlowTextColor,
                // overflowMenuIconsColor: overFlowTextColor,
                // overflowMenuCustomItems: [BetterPlayerOverflowMenuItem(useDash ? Icons.check_box_outlined : Icons.check_box_outline_blank, locals.useDash, toggleDash)])
              )),
          betterPlayerDataSource: betterPlayerDataSource);
      videoController!.addEventsListener(onVideoListener);
      videoController!.setBetterPlayerGlobalKey(key);
      // isPipSupported = await videoController?.isPictureInPictureSupported() ?? false;

      update();
    }
  }

  @override
  setSponsorBlock() async {
    if (video != null) {
      List<SponsorSegmentType> types = SponsorSegmentType.values.where((e) => db.getSettings(e.settingsName())?.value == 'true').toList();

      if (types.isNotEmpty) {
        List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(video!.videoId, types);
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

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    videoController?.exitFullScreen();
    MiniPlayerController.to()?.handleVideoEvent(BetterPlayerEvent(BetterPlayerEventType.hideFullscreen));
    disposeControllers();
    offlineVideo = v;
    playVideo(true);
  }

  @override
  bool isPlaying() {
    return videoController?.isPlaying() ?? false;
  }

  @override
  void pause() {
    videoController?.pause();
  }

  @override
  void play() {
    videoController?.play();
  }

  @override
  void seek(Duration position) {
    videoController?.seekTo(position);
  }

  @override
  Duration? bufferedPosition() {
    return bufferPosition;
  }

  @override
  Duration position() {
    return videoController?.videoPlayerController?.value.position ?? Duration.zero;
  }

  @override
  double? speed() {
    videoController?.videoPlayerController?.value.speed ?? 1;
  }

  @override
  FullScreenState isFullScreen() {
    return (videoController?.isFullScreen ?? false) ? FullScreenState.fullScreen : FullScreenState.notFullScreen;
  }

  @override
  setFullScreen(bool fullScreen) {
    if (fullScreen) {
      videoController?.enterFullScreen();
    } else {
      videoController?.exitFullScreen();
    }
  }

  String _videoTrackToString(BetterPlayerAsmsTrack? track) {
    return '${track?.height}p' ?? '';
  }

  String _audioTrackToString(BetterPlayerAsmsAudioTrack? track) {
    return '${track?.label} ${track?.language != null ? '- ${track?.language}' : ''}';
  }

  String _subtitleToString(BetterPlayerSubtitlesSource? source) {
    return '${source?.name}';
  }

  @override
  List<String> getVideoTracks() {
    // TODO: implement getVideoTracks
    if (video != null) {
      if (videoController?.betterPlayerAsmsTracks.isNotEmpty ?? false) {
        return videoController?.betterPlayerAsmsTracks.map(_videoTrackToString).toList() ?? [];
      } else {
        return video?.formatStreams.map((e) => e.resolution).toList() ?? [];
      }
    }
    // for offline video we don't offer video track selection
    return [];
  }

  @override
  int selectedVideoTrack() {
    if (video != null) {
      if (useDash) {
        var tracks = getVideoTracks();
        var track = _videoTrackToString(videoController?.betterPlayerAsmsTrack);
        log.fine("Current track: $track");
        return tracks.indexOf(track);
      } else {
        var tracks = getVideoTracks();

        return tracks.indexOf(selectedNonDashTrack);
      }
    }
    // for offline video we don't offer video track selection
    return -1;
  }

  @override
  List<String> getAudioTracks() {
    // TODO: implement getVideoTracks
    if (video != null) {
      if (videoController?.betterPlayerAsmsAudioTracks?.isNotEmpty ?? false) {
        return videoController?.betterPlayerAsmsAudioTracks?.map(_audioTrackToString).toList() ?? [];
      }
    }
    // for offline video we don't offer video track selection
    return [];
  }

  @override
  int selectedAudioTrack() {
    if (video != null) {
      if (useDash) {
        var tracks = getAudioTracks();
        var track = _audioTrackToString(videoController?.betterPlayerAsmsAudioTrack);
        log.fine("Current audio track: $track");
        return tracks.indexOf(track);
      }
    }
    // for offline video we don't offer video track selection
    return -1;
  }

  @override
  List<String> getSubtitles() {
    return videoController?.betterPlayerSubtitlesSourceList.map(_subtitleToString).toList() ?? [];
  }

  @override
  int selectedSubtitle() {
    var tracks = getSubtitles();
    var track = _subtitleToString(videoController?.betterPlayerSubtitlesSource);
    log.fine("Current subtitle track: $track");
    return tracks.indexOf(track);
  }

  @override
  selectAudioTrack(int index) {
    var betterPlayerAsmsTrack = videoController?.betterPlayerAsmsAudioTracks?[index];
    log.fine("Selected audio track, ${betterPlayerAsmsTrack?.label}");
    if (betterPlayerAsmsTrack != null) {
      videoController?.setAudioTrack(betterPlayerAsmsTrack);
    }
  }

  @override
  selectSubtitle(int index) {
    var sub = videoController?.betterPlayerSubtitlesSourceList[index];
    if (sub != null) {
      videoController?.setupSubtitleSource(sub, sourceInitialize: true);
    }
  }

  @override
  selectVideoTrack(int index) {
    var betterPlayerAsmsTrack = videoController?.betterPlayerAsmsTracks[index];
    if (betterPlayerAsmsTrack != null) {
      videoController?.setTrack(betterPlayerAsmsTrack);
    }
  }

  @override
  bool supportsPip() {
    return true;
  }

  @override
  void enterPip() {
    videoController?.enablePictureInPicture(key);
  }
}
