import 'package:better_player/better_player.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/controllers/settingsController.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/controllers/videoInListController.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/mediaEvent.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import 'package:wakelock/wakelock.dart';

import '../../models/db/progress.dart' as dbProgress;
import '../database.dart';
import '../globals.dart';
import '../main.dart';
import '../models/db/settings.dart';
import '../models/pair.dart';
import '../models/sponsorSegment.dart';
import '../models/sponsorSegmentTypes.dart';
import '../models/video.dart';
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

  VideoPlayerController(
      {required this.colors, required this.overFlowTextColor, required this.key, Video? video, DownloadedVideo? offlineVideo, required this.miniPlayer, required this.locals, bool? disableControls})
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
    playVideo(offlineVideo != null);
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
    if (videoController != null && video != null) {
      int currentPosition = timeInSeconds;
      // saving progress
      int max = video!.lengthSeconds;
      var progress = dbProgress.Progress.named(progress: currentPosition / max, videoId: video!.videoId);
      db.saveProgress(progress);

      VideoInListController.to(progress.videoId)?.updateProgress();
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
  switchVideo(Video video) {
    videoController?.exitFullScreen();
    MiniPlayerController.to()?.handleVideoEvent(BetterPlayerEvent(BetterPlayerEventType.hideFullscreen));
    disposeControllers();
    this.video = video;
    playVideo(false);
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
  playVideo(bool offline) async {
    if (video != null || offlineVideo != null) {
      IdedVideo idedVideo = offline ? offlineVideo! : video!;
      videoController?.dispose();
      videoController = null;
      // we get segments if there are any, no need to wait.
      setSponsorBlock();
      double progress = db.getVideoProgress(idedVideo.videoId);
      Duration? startAt;
      if (progress > 0 && progress < 0.90) {
        startAt = Duration(seconds: (offline ? offlineVideo!.videoLenthInSeconds : video!.lengthSeconds * progress).floor());
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
        String videoUrl = isHls
            ? '${video!.hlsUrl!}${service.useProxy() ? '?local=true' : ''}'
            : useDash
                ? '${video!.dashUrl}${service.useProxy() ? '?local=true' : ''}'
                : video!.formatStreams[video!.formatStreams.length - 1].url;

        log.info('Playing url (dash ${useDash},  hasHls ? ${video!.hlsUrl != null})  ${videoUrl}');

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
                  showControls: !(disableControls ?? false),
                  enablePlayPause: false,
                  overflowModalColor: colors.background,
                  overflowModalTextColor: overFlowTextColor,
                  overflowMenuIconsColor: overFlowTextColor,
                  overflowMenuCustomItems: [BetterPlayerOverflowMenuItem(useDash ? Icons.check_box_outlined : Icons.check_box_outline_blank, locals.useDash, toggleDash)])),
          betterPlayerDataSource: betterPlayerDataSource);
      videoController!.addEventsListener(onVideoListener);
      videoController!.setBetterPlayerGlobalKey(key);
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
    return null;
  }

  @override
  Duration position() {
    return videoController?.videoPlayerController?.value.position ?? Duration.zero;
  }

  @override
  double? speed() {
    videoController?.videoPlayerController?.value.speed ?? 1;
  }
}
