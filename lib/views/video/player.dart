import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:invidious/models/adaptiveFormat.dart';
import 'package:invidious/views/video/playerControls.dart';
import 'package:logging/logging.dart';

import '../../database.dart';
import '../../globals.dart';
import '../../main.dart';
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
  final log = Logger('VideoPlayer');
  final GlobalKey _betterPlayerKey = GlobalKey();
  bool loadingStream = false;
  bool playingVideo = false;
  bool useSponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  List<Pair<int>> sponsorSegments = List.of([]);
  Pair<int> nextSegment = Pair(0, 0);
  BetterPlayerController? videoController;
  VlcPlayerController? vlcController;
  double scale = 1;

  int previousSponsorCheck = 0;

  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register(BROAD_CAST_STOP_PLAYING, (value, callback) {
      disposeController();
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
    disposeController();
    super.dispose();
  }

  disposeController() {
    if (vlcController != null) {
      vlcController!.stopRendererScanning();
      vlcController!.dispose();
    }
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

  toggleFullScreen() async {
    bool? isFullScreen = await FullScreen.isFullScreen;
    if (isFullScreen ?? false) {
      await FullScreen.exitFullScreen();
      setState(() {
        scale = 1;
      });
    } else {
      final screenSize = MediaQuery.of(context).size;
      final videoSize = vlcController!.value.size;
      if (videoSize.width > 0) {
        try {
          FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
          await _forceLandscape();
          final newTargetScale = screenSize.width / (videoSize.width * screenSize.height / videoSize.height);
          log.info('NEW SCALE ${newTargetScale}');
          setState(() {
            scale = newTargetScale;
          });
        }catch(err){
          log.info('message');
        }
      }
    }
  }

  Future<void> _forceLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<void> _forcePortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
  }

  onVideoListener(BetterPlayerEvent event) {
/*
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
*/
  }

  playVideo() async {
    setState(() {
      loadingStream = true;
    });

    double progress = db.getVideoProgress(widget.video.videoId);
    Duration? startAt;
    if (progress > 0 && progress < 0.90) {
      startAt = Duration(seconds: (widget.video.lengthSeconds * progress).floor());
    }

    String baseUrl = db.getCurrentlySelectedServer().url;

    Map<String, String> videoTracks = {};
    Map<String, String> audioTracks = {};

    var videos = widget.video.adaptiveFormats.where((element) => element.type.contains('video') && element.resolution != null).toList();
    videos.sort((a, b) {
      int resA = int.parse(a.resolution!.replaceAll("p", ""));
      int resB = int.parse(b.resolution!.replaceAll("p", ""));

      int compareRes = resB.compareTo(resA);

      if (compareRes != 0) {
        return compareRes;
      } else {
        int containerA = a.container!.contains('webm') ? 1 : 0;
        int containerB = b.container!.contains('webm') ? 1 : 0;
        return containerB.compareTo(containerA);
      }
    });
    AdaptiveFormat bestVideo = videos[0];

    log.info('best video format: ${bestVideo.qualityLabel}');

    widget.video.adaptiveFormats.reversed.forEach((f) {
      if (f.type.contains('video') && f.qualityLabel != null) {
        videoTracks['${f.qualityLabel} ${f.container}'] = f.url;
      } else if (f.type.contains('audio') && f.audioSampleRate != null && f.audioQuality != null) {
        audioTracks[f.audioQuality!] = f.url;
      }
    });

    vlcController = VlcPlayerController.network(bestVideo.url, autoPlay: true, autoInitialize: true);

    if (widget.video.hlsUrl == null) {
      var audio = widget.video.adaptiveFormats.where((element) => element.type.contains('audio')).toList();
      audio.sort((a, b) {
        int resA = int.parse(a.bitrate!);
        int resB = int.parse(b.bitrate!);

        int compareRes = resB.compareTo(resA);

        if (compareRes != 0) {
          return compareRes;
        } else {
          int containerA = a.container!.contains('webm') ? 1 : 0;
          int containerB = b.container!.contains('webm') ? 1 : 0;
          return containerB.compareTo(containerA);
        }
      });

      AdaptiveFormat bestAudio = audio[0];
      log.info('setting audio track: ${bestAudio.audioQuality}');

      vlcController!.addOnInitListener(() {
        vlcController!.addAudioFromNetwork(bestAudio.url, isSelected: true);
      });
    }

    /*videoController!.isPictureInPictureSupported().then((supported) {
      if (supported) {
        videoController!.enablePictureInPicture(_betterPlayerKey);
      }
    });
*/

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
                : Transform.scale(
                    scale: scale,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: VlcPlayer(
                            key: _betterPlayerKey,
                            controller: vlcController!,
                            aspectRatio: 16 / 9,
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: PlayerControls(
                              key: ValueKey('test'),
                              controller: vlcController!,
                              toggleFullScreen: toggleFullScreen,
                            ))
                      ],
                    ),
                  )),
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
