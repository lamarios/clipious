import 'dart:async';
import 'dart:collection';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../main.dart';
import '../../models/db/progress.dart';
import '../../models/pair.dart';
import '../../models/sponsorSegment.dart';
import '../../models/video.dart';
import '../components/videoThumbnail.dart';

class VideoPlayer extends StatefulWidget {
  final Video video;
  Function(BetterPlayerEvent event)? listener;

  VideoPlayer({super.key, required this.video, this.listener});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with AfterLayoutMixin<VideoPlayer>, RouteAware {
  final GlobalKey _betterPlayerKey = GlobalKey();
  bool loadingStream = false;
  bool playingVideo = false;
  bool useSponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);
  BetterPlayerController? videoController;
  int previousSponsorCheck = 0;

  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register(BROAD_CAST_STOP_PLAYING, (value, callback) {
      if (videoController != null) {
        videoController!.removeEventsListener(onVideoListener);
        videoController!.dispose();
      }
      if (context.mounted) {
        setState(() {
          playingVideo = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    if (videoController != null) {
      videoController!.removeEventsListener(onVideoListener);
      videoController!.dispose();
    }
    super.dispose();
  }

  @override
  didUpdateWidget(VideoPlayer old) {
    super.didUpdateWidget(old);
    if (old.video.videoId != widget.video.videoId) {
      if (videoController != null) {
        videoController!.removeEventsListener(onVideoListener);
        videoController!.dispose();
      }

      playVideo();
    }
  }

  onVideoListener(BetterPlayerEvent event) {
    if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
      int currentPosition = (event.parameters?['progress'] as Duration).inSeconds;
      int max = widget.video.lengthSeconds ?? 0;
      db.saveProgress(Progress.named(progress: currentPosition / max, videoId: widget.video.videoId));
    }
    if (useSponsorBlock && event.betterPlayerEventType == BetterPlayerEventType.progress && sponsorSegments.isNotEmpty) {
      int currentPosition = (event.parameters?['progress'] as Duration).inMilliseconds;
      if (currentPosition - previousSponsorCheck >= 1000) {
        print('checking');
        Pair<int> nextSegment = sponsorSegments.firstWhere((e) => e.first <= currentPosition && currentPosition <= e.last, orElse: () => Pair<int>(-1, -1));

        if (nextSegment.first != -1) {
          var locals = AppLocalizations.of(context)!;
          final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
          scaffold?.showSnackBar(SnackBar(
            content: Text(locals.sponsorSkipped),
            duration: const Duration(seconds: 1),
          ));
          videoController!.seekTo(Duration(milliseconds: nextSegment.last + 1000));
        }
        previousSponsorCheck = currentPosition;
      }
    }

    if (widget.listener != null) {
      widget.listener!(event);
    }
  }

  playVideo() {
    setState(() {
      loadingStream = true;
    });

    double progress = db.getVideoProgress(widget.video.videoId);
    Duration? startAt;
    if (progress > 0 && progress < 0.90) {
      startAt = Duration(seconds: (widget.video.lengthSeconds * progress).floor());
    }

    String baseUrl = db.getCurrentlySelectedServer().url;

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.video.hlsUrl ?? widget.video.dashUrl,
        videoFormat: widget.video.hlsUrl != null ? BetterPlayerVideoFormat.hls : BetterPlayerVideoFormat.dash,
        liveStream: widget.video.liveNow,
        subtitles: widget.video.captions.map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['${baseUrl}${s.url}'], name: s.label)).toList(),
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          activityName: 'MainActivity',
          title: widget.video.title,
          author: widget.video.author,
          imageUrl: widget.video.getBestThumbnail()?.url ?? '',
        ));
    videoController = BetterPlayerController(BetterPlayerConfiguration(handleLifecycle: false, startAt: startAt, autoPlay: true, allowedScreenSleep: false, fit: BoxFit.contain),
        betterPlayerDataSource: betterPlayerDataSource);

    videoController!.addEventsListener(onVideoListener);
    videoController!.isPictureInPictureSupported().then((supported) {
      if (supported) {
        videoController!.enablePictureInPicture(_betterPlayerKey);
      }
    });

    setState(() {
      playingVideo = true;
      loadingStream = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return VideoThumbnailView(
      videoId: widget.video.videoId,
      thumbnailUrl: widget.video.getBestThumbnail()?.url ?? '',
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: AnimatedSwitcher(
            duration: animationDuration,
            child: !playingVideo
                ? loadingStream
                    ? const CircularProgressIndicator()
                    : IconButton(
                        key: const ValueKey('nt-playing'),
                        onPressed: () => playVideo(),
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 100,
                        ),
                        color: colorScheme.primary,
                      )
                : BetterPlayer(key: _betterPlayerKey, controller: videoController!)),
      ),
    );
  }

  setSponsorBlock() async {
    if (useSponsorBlock) {
      List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(widget.video.videoId);
      List<Pair<int>> segments = List.from(sponsorSegments.map((e) {
        Duration start = Duration(seconds: e.segment[0].floor());
        Duration end = Duration(seconds: e.segment[1].floor());
        Pair<int> segment = Pair(start.inMilliseconds, end.inMilliseconds);
        return segment;
      }).toList());

      setState(() {
        this.sponsorSegments = segments;
      });
    }
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    setSponsorBlock();
  }
}
