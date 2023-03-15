import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../main.dart';
import '../../models/db/progress.dart';
import '../../models/pair.dart';
import '../../models/sponsorSegment.dart';
import '../../models/video.dart';
import '../components/videoThumbnail.dart';
import '../miniPlayer.dart';


class VideoPlayer extends StatefulWidget {
  final Video video;
  final bool miniPlayer;
  bool? playNow;
  Function(BetterPlayerEvent event)? listener;

  VideoPlayer({super.key, required this.video, this.listener, required this.miniPlayer, this.playNow});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with AfterLayoutMixin<VideoPlayer>, RouteAware {
  final log = Logger('VideoPlayer');
  bool useSponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);
  BetterPlayerController? videoController;
  int previousSponsorCheck = 0;
  bool useDash = db.getSettings(USE_DASH)?.value == 'true';
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.miniPlayer) {
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
  void didPopNext() {
    if (!widget.miniPlayer) {
      super.didPopNext();
      if (videoController != null) {
        log.info('popnext ${videoController?.isPlaying()}');
        if (!(videoController?.isPlaying() ?? false)) {
          // we restart the video
          disposeControllers();
        }
      }
    }
  }

  @override
  void didPop() {
    super.didPop();
    log.info('pop');
  }

  @override
  void didPush() {
    super.didPush();
    log.info('push');
  }

  @override
  void didPushNext() {
    super.didPushNext();
    log.info('push next');
  }

  @override
  void didChangeDependencies() {
    disposeControllers();
    if (!widget.miniPlayer) {
      routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
    } else {
      playVideo();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  didUpdateWidget(VideoPlayer old) {
    super.didUpdateWidget(old);
    if (old.video.videoId != widget.video.videoId) {
      disposeControllers();
      playVideo();
    }
  }

  disposeControllers() {
    if (videoController != null) {
      saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);
      videoController!.removeEventsListener(onVideoListener);
      videoController!.dispose();
      if (context.mounted) {
        setState(() {
          videoController = null;
        });
      }
    }
  }

  saveProgress(int timeInSeconds) {
    if (videoController != null) {
      int currentPosition = timeInSeconds;
      // saving progress
      int max = widget.video.lengthSeconds ?? 0;
      var progress = Progress.named(progress: currentPosition / max, videoId: widget.video.videoId);
      db.saveProgress(progress);
    }
  }

  onVideoListener(BetterPlayerEvent event) {
    if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
      int currentPosition = (event.parameters?['progress'] as Duration).inSeconds;
      if (currentPosition > previousSponsorCheck + 1) {
        // saving progress
        saveProgress(currentPosition);
        log.info("video event");

        if (useSponsorBlock && sponsorSegments.isNotEmpty) {
          double positionInMs = currentPosition * 1000;
          Pair<int> nextSegment = sponsorSegments.firstWhere((e) => e.first <= positionInMs && positionInMs <= e.last, orElse: () => Pair<int>(-1, -1));
          if (nextSegment.first != -1) {
            var locals = AppLocalizations.of(context)!;
            videoController!.seekTo(Duration(milliseconds: nextSegment.last + 1000));
            final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
            scaffold?.showSnackBar(SnackBar(
              content: Text(locals.sponsorSkipped),
              duration: const Duration(seconds: 1),
            ));
          }
        }

        if (widget.listener != null) {
          widget.listener!(event);
        }

        previousSponsorCheck = currentPosition;

        if (widget.listener != null) {
          widget.listener!(event);
        }
      } else if (currentPosition + 2 < previousSponsorCheck) {
        // if we're more than 2 seconds behind, means we probably seek backward manually far away
        // so we reset the position
        previousSponsorCheck = currentPosition;
      }
    } else if (event.betterPlayerEventType == BetterPlayerEventType.finished) {
      if (widget.listener != null) {
        widget.listener!(event);
      }
    }
  }

  toggleDash() {
    log.info('toggle dash');
    // saving progress before we reload new video format
    saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);

    disposeControllers();

    db.saveSetting(SettingsValue(USE_DASH, (!useDash).toString()));
    setState(() {
      useDash = !useDash;
      playVideo();
    });
  }

  playVideo() {
    var locals = AppLocalizations.of(context)!;

    double progress = db.getVideoProgress(widget.video.videoId);
    Duration? startAt;
    if (progress > 0 && progress < 0.90) {
      startAt = Duration(seconds: (widget.video.lengthSeconds * progress).floor());
    }

    String baseUrl = db.getCurrentlySelectedServer().url;

    Map<String, String> resolutions = {};

    bool isHls = widget.video.hlsUrl != null;
    String videoUrl = isHls
        ? widget.video.hlsUrl!
        : useDash
            ? widget.video.dashUrl
            : widget.video.formatStreams[widget.video.formatStreams.length - 1].url;
    BetterPlayerVideoFormat format = isHls
        ? BetterPlayerVideoFormat.hls
        : useDash
            ? BetterPlayerVideoFormat.dash
            : BetterPlayerVideoFormat.other;

    if (format == BetterPlayerVideoFormat.other) {
      for (var value in widget.video.formatStreams) {
        resolutions[value.qualityLabel] = value.url;
      }
    }

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.network, videoUrl,
        videoFormat: format,
        liveStream: widget.video.liveNow,
        subtitles: widget.video.captions.map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['${baseUrl}${s.url}'], name: s.label)).toList(),
        resolutions: resolutions.isNotEmpty ? resolutions : null,
        // placeholder: VideoThumbnailView(videoId: widget.video.videoId, thumbnailUrl: widget.video.getBestThumbnail()?.url ?? ''),
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          activityName: 'MainActivity',
          title: widget.video.title,
          author: widget.video.author,
          imageUrl: widget.video.getBestThumbnail()?.url ?? '',
        ));

    bool showControls = !widget.miniPlayer;

    setState(() {
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
                  enableFullscreen: showControls,
                  enablePip: showControls,
                  enableOverflowMenu: showControls,
                  enableMute: showControls,
                  enableProgressBar: showControls,
                  enableProgressText: showControls,
                  enableSkips: showControls,
                  enablePlayPause: showControls,
                  overflowMenuCustomItems: [BetterPlayerOverflowMenuItem(useDash ? Icons.check_box_outlined : Icons.check_box_outline_blank, locals.useDash, toggleDash)])),
          betterPlayerDataSource: betterPlayerDataSource);
      videoController!.addEventsListener(onVideoListener);
      videoController!.setBetterPlayerGlobalKey(_betterPlayerKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: AnimatedSwitcher(
            duration: animationDuration,
            child: videoController != null
                ? BetterPlayer(controller: videoController!, key: _betterPlayerKey,)
                : VideoThumbnailView(
                    videoId: widget.video.videoId,
                    thumbnailUrl: widget.video.getBestThumbnail()?.url ?? '',
                    child: IconButton(
                      key: const ValueKey('nt-playing'),
                      onPressed: () {
                        // we hide the mini player only when that particular button is pressed
                        hideMiniPlayer(context);
                        playVideo();
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 100,
                      ),
                      color: colorScheme.primary,
                    ),
                  )));
  }

  setSponsorBlock(BuildContext context) async {
    if (useSponsorBlock) {
      List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(widget.video.videoId);
      List<Pair<int>> segments = List.from(sponsorSegments.map((e) {
        Duration start = Duration(seconds: e.segment[0].floor());
        Duration end = Duration(seconds: e.segment[1].floor());
        Pair<int> segment = Pair(start.inMilliseconds, end.inMilliseconds);
        return segment;
      }));

      if (context.mounted) {
        setState(() {
          this.sponsorSegments = segments;
        });
      }
    }
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    await setSponsorBlock(context);

    if (widget.playNow ?? false) {
      playVideo();
    }
  }
}
