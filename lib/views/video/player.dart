import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:chewie/chewie.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/modalOptions.dart';
import 'package:logging/logging.dart';
import 'package:video_player/video_player.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../main.dart';
import '../../models/db/progress.dart';
import '../../models/pair.dart';
import '../../models/playerEvent.dart';
import '../../models/sponsorSegment.dart';
import '../../models/video.dart';
import '../components/videoThumbnail.dart';

class VideoPlayer extends StatefulWidget {
  final Video video;
  Function(PlayerEvent event)? listener;

  VideoPlayer({super.key, required this.video, this.listener});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with AfterLayoutMixin<VideoPlayer>, RouteAware {
  final GlobalKey _betterPlayerKey = GlobalKey();
  Logger log = Logger('VideoPlayer');
  bool loadingStream = false;
  bool playingVideo = false;
  bool useSponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);

  // BetterPlayerController? videoController;
  VideoPlayerController? videoController;
  ChewieController? chewieController;
  int previousSponsorCheck = 0;
  late String url;

  late VideoFormat? videoFormat;

  @override
  void initState() {
    super.initState();

    FBroadcast.instance().register(BROAD_CAST_STOP_PLAYING, (value, callback) {
      disposeControllers();
      if (context.mounted) {
        setState(() {
          playingVideo = false;
        });
      }
    });

    url = widget.video.hlsUrl ?? widget.video.dashUrl;
    videoFormat = widget.video.hlsUrl != null ? VideoFormat.hls : VideoFormat.dash;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    disposeControllers();
    if (chewieController != null) {
      chewieController!.dispose();
    }
    super.dispose();
  }

  disposeControllers() {
    log.info('disposing controllers');
    if (videoController != null) {
      videoController!.removeListener(onVideoListener);
      videoController!.dispose();
    }
  }

  @override
  didUpdateWidget(VideoPlayer old) {
    super.didUpdateWidget(old);
    if (old.video.videoId != widget.video.videoId) {
      disposeControllers();
      setState(() {
        url = widget.video.hlsUrl ?? widget.video.dashUrl;
        videoFormat = widget.video.hlsUrl != null ? VideoFormat.hls : VideoFormat.dash;
        playVideo(url, videoFormat);
      });
    }
  }

  onVideoListener() {
    int currentPosition = videoController!.value.position.inSeconds;
    if (currentPosition > previousSponsorCheck + 1) {
      // saving progress
      saveProgress();
      log.info("video event");

      if (useSponsorBlock && sponsorSegments.isNotEmpty) {
        double positionInMs = currentPosition * 1000;
        Pair<int> nextSegment = sponsorSegments.firstWhere((e) => e.first <= positionInMs && positionInMs <= e.last, orElse: () => Pair<int>(-1, -1));
        if (nextSegment.first != -1) {
          var locals = AppLocalizations.of(context)!;
          chewieController!.seekTo(Duration(milliseconds: nextSegment.last + 1000));
          final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
          scaffold?.showSnackBar(SnackBar(
            content: Text(locals.sponsorSkipped),
            duration: const Duration(seconds: 1),
          ));
        }
      }

      if (widget.listener != null) {
        widget.listener!(PlayerEvent(finished: currentPosition == widget.video.lengthSeconds, type: PlayerEventType.progress, progress: videoController!.value.position));
      }

      previousSponsorCheck = currentPosition;
    }else if(currentPosition + 2 < previousSponsorCheck){
      // if we're more than 2 seconds behind, means we probably seek backward manually far away
      // so we reset the position
      previousSponsorCheck = currentPosition;
    }
  }

  saveProgress() {
    if (videoController != null) {
      int currentPosition = videoController!.value.position.inSeconds;
      // saving progress
      int max = widget.video.lengthSeconds ?? 0;
      var progress = Progress.named(progress: currentPosition / max, videoId: widget.video.videoId);
      db.saveProgress(progress);
    }
  }

  changeQuality(String url, String encoding) {
    saveProgress();

    setState(() {
      this.url = url;
      videoFormat = encoding == 'hls'
          ? VideoFormat.hls
          : encoding == 'dash'
              ? VideoFormat.dash
              : VideoFormat.other;

      playVideo(url, videoFormat);
    });

    Navigator.of(context).pop();
  }

  showQualityDialog(BuildContext context) {
    Navigator.of(context).pop();
    var locals = AppLocalizations.of(context)!;
    var list = <ModalOption>[];

    if (widget.video.hlsUrl != null) {
      list.add(ModalOption(
        onTap: (context) => changeQuality(widget.video.hlsUrl!, 'hls'),
        label: '${locals.qualityAuto} (hls)',
      ));
    }

    list.add(ModalOption(
      onTap: (context) => changeQuality(widget.video.dashUrl, 'dash'),
      label: '${locals.qualityAuto} (dash)',
    ));

    list.addAll(widget.video.formatStreams
        .map(
          (f) => ModalOption(onTap: (context) => changeQuality(f.url, f.encoding), label: f.qualityLabel),
        )
        .toList());

    showModalSheet(context, list);
  }

  playVideo(String url, VideoFormat? format) async {
    disposeControllers();
    var locals = AppLocalizations.of(context)!;
    setState(() {
      loadingStream = true;
    });

    double progress = db.getVideoProgress(widget.video.videoId);
    Duration? startAt;
    if (progress > 0 && progress < 0.90) {
      startAt = Duration(seconds: (widget.video.lengthSeconds * progress).floor());
    }

    String baseUrl = db.getCurrentlySelectedServer().url;

    videoController = VideoPlayerController.network(url, formatHint: videoFormat, videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));

    log.info('Intializing video ${widget.video.hlsUrl ?? widget.video.dashUrl} starting at: ${startAt}');
    videoController!.addListener(onVideoListener);
    await videoController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoController!,
      isLive: widget.video.liveNow,
      autoPlay: true,
      allowedScreenSleep: false,
      allowFullScreen: true,
      startAt: startAt,
      additionalOptions: (context) => <OptionItem>[OptionItem(onTap: () => showQualityDialog(context), iconData: Icons.high_quality, title: locals.quality)],
    );
    log.info('done');

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
                        onPressed: () => playVideo(url, videoFormat),
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 100,
                        ),
                        color: colorScheme.primary,
                      )
                : Chewie(controller: chewieController!),
          ),
        ));
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
