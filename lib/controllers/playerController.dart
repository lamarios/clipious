import 'package:better_player/better_player.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/controllers/videoInListController.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../database.dart';
import '../globals.dart';
import '../main.dart';
import '../models/db/settings.dart';
import '../models/pair.dart';
import '../../models/db/progress.dart' as dbProgress;
import '../models/sponsorSegment.dart';
import '../models/sponsorSegmentTypes.dart';
import '../models/video.dart';
import 'miniPayerController.dart';

class PlayerController extends GetxController {
  static PlayerController? to() => safeGet();

  final log = Logger('VideoPlayer');
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);
  BetterPlayerController? videoController;
  int previousSponsorCheck = 0;
  bool useDash = db.getSettings(USE_DASH)?.value == 'true';
  AppLocalizations locals;
  Video video;
  final bool miniPlayer;
  bool? playNow;
  bool? disableControls;
  final ColorScheme colors;
  final Color overFlowTextColor;
  final GlobalKey key;

  PlayerController({required this.colors, required this.overFlowTextColor, required this.key, required this.video, required this.miniPlayer, required this.locals, this.disableControls});


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
    playVideo();
  }

  disposeControllers() {
    if (videoController != null) {
      saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);
      videoController!.removeEventsListener(onVideoListener);
      videoController!.dispose();
      videoController = null;
      update();
    }
  }

  saveProgress(int timeInSeconds) {
    if (videoController != null) {
      int currentPosition = timeInSeconds;
      // saving progress
      int max = video.lengthSeconds;
      var progress = dbProgress.Progress.named(progress: currentPosition / max, videoId: video.videoId);
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
          log.info("video event");

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
        saveProgress(video.lengthSeconds);
        broadcastEvent(event);
        break;
      case BetterPlayerEventType.pipStart:
      case BetterPlayerEventType.pipStop:
      case BetterPlayerEventType.openFullscreen:
      case BetterPlayerEventType.hideFullscreen:
      case BetterPlayerEventType.overflowClosed:
      case BetterPlayerEventType.overflowOpened:
      case BetterPlayerEventType.initialized:
      case BetterPlayerEventType.seekTo:
      case BetterPlayerEventType.bufferingEnd:
      case BetterPlayerEventType.bufferingStart:
        broadcastEvent(event);
        break;
      default:
        break;
    }
  }

  broadcastEvent(BetterPlayerEvent event){
    isTv ? TvPlayerController.to()?.handleVideoEvent(event) :MiniPlayerController.to()?.handleVideoEvent(event);
  }

  toggleDash() {
    log.info('toggle dash');
    // saving progress before we reload new video format
    saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);

    disposeControllers();

    db.saveSetting(SettingsValue(USE_DASH, (!useDash).toString()));
    useDash = !useDash;
    playVideo();
    update();
  }

  switchVideo(Video video) {
    videoController?.exitFullScreen();
    MiniPlayerController.to()?.handleVideoEvent(BetterPlayerEvent(BetterPlayerEventType.hideFullscreen));
    disposeControllers();
    this.video = video;
    playVideo();
  }

  togglePlaying() {
    if (videoController != null) {
      (videoController?.isPlaying() ?? false) ? videoController?.pause() : videoController?.play();
      update();
    }
  }

  toggleControls(bool visible) {
    videoController?.setControlsEnabled(visible);
  }

  playVideo() {
    // we get segments if there are any, no need to wait.
    setSponsorBlock();
    double progress = db.getVideoProgress(video.videoId);
    Duration? startAt;
    if (progress > 0 && progress < 0.90) {
      startAt = Duration(seconds: (video.lengthSeconds * progress).floor());
    }

    print('start at $startAt');

    String baseUrl = db.getCurrentlySelectedServer().url;

    Map<String, String> resolutions = {};

    bool isHls = video.hlsUrl != null;
    String videoUrl = isHls
        ? '${video.hlsUrl!}${service.useProxy ? '?local=true' : ''}'
        : useDash
            ? '${video.dashUrl}${service.useProxy ? '?local=true' : ''}'
            : video.formatStreams[video.formatStreams.length - 1].url;

    log.info('Playing url (dash ${useDash},  hasHls ? ${video.hlsUrl != null})  ${videoUrl}');

    BetterPlayerVideoFormat format = isHls
        ? BetterPlayerVideoFormat.hls
        : useDash
            ? BetterPlayerVideoFormat.dash
            : BetterPlayerVideoFormat.other;

    if (format == BetterPlayerVideoFormat.other) {
      for (var value in video.formatStreams) {
        resolutions[value.qualityLabel] = value.url;
      }
    }

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.network, videoUrl,
        videoFormat: format,
        liveStream: video.liveNow,
        subtitles: video.captions.map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['${baseUrl}${s.url}'], name: s.label)).toList(),
        resolutions: resolutions.isNotEmpty ? resolutions : null,
        // placeholder: VideoThumbnailView(videoId: video.videoId, thumbnailUrl: video.getBestThumbnail()?.url ?? ''),
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          activityName: 'MainActivity',
          title: video.title,
          author: video.author,
          imageUrl: video.getBestThumbnail()?.url ?? '',
        ));

    videoController = BetterPlayerController(
        BetterPlayerConfiguration(
            deviceOrientationsOnFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
            deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
            handleLifecycle: false,
            autoDetectFullscreenDeviceOrientation: false,
            autoDetectFullscreenAspectRatio: true,
            startAt: startAt,
            autoPlay: true,
            allowedScreenSleep: false,
            fit: BoxFit.contain,
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

  setSponsorBlock() async {
    List<SponsorSegmentType> types = SponsorSegmentType.values.where((e) => db.getSettings(e.settingsName())?.value == 'true').toList();

    if (types.isNotEmpty) {
      List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(video.videoId, types);
      List<Pair<int>> segments = List.from(sponsorSegments.map((e) {
        Duration start = Duration(seconds: e.segment[0].floor());
        Duration end = Duration(seconds: e.segment[1].floor());
        Pair<int> segment = Pair(start.inMilliseconds, end.inMilliseconds);
        return segment;
      }));

      this.sponsorSegments = segments;
      log.info('we found ${segments.length} segments to skip');
    } else {
      sponsorSegments = [];
    }
  }
}
