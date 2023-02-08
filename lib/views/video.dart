// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:collection';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video/comments.dart';
import 'package:invidious/views/video/info.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../models/sponsorSegment.dart';
import '../models/video.dart';
import '../utils.dart';

class VideoView extends StatefulWidget {
  final String videoId;

  const VideoView({super.key, required this.videoId});

  @override
  State<VideoView> createState() => VideoViewState();
}

class VideoViewState extends State<VideoView> with AfterLayoutMixin<VideoView> {
  GlobalKey _betterPlayerKey = GlobalKey();

  Video? video;
  bool loadingVideo = true;
  bool playingVideo = false;
  bool showControls = false;
  bool elevateThumbnail = false;
  double progress = 0;
  String progressText = '';
  ScrollController scrollController = ScrollController();

  // VideoPlayerController? controller;

  // ChewieController? chewieController;
  BetterPlayerController? videoController;
  int selectedIndex = 0;
  bool loadingStream = false;
  bool useSponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  Queue<List<int>> sponsorSegments = Queue.of([]);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  dispose() async {
    super.dispose();
    if (videoController != null) {
      videoController!.removeEventsListener(onVideoListener);
      videoController!.dispose();
    }
  }

  onScroll() {
    if (scrollController.offset > 0 && !elevateThumbnail) {
      setState(() {
        elevateThumbnail = true;
      });
    } else if (scrollController.offset == 0 && elevateThumbnail) {
      setState(() {
        elevateThumbnail = false;
      });
    }
  }

  playVideo(BuildContext context) {
    setState(() {
      loadingStream = true;
    });

    String baseUrl = db.getCurrentlySelectedServer().url;

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.network, video!.dashUrl,
        videoFormat: BetterPlayerVideoFormat.dash,
        subtitles: video?.captions.map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['${baseUrl}${s.url}'], name: s.label)).toList(),
        notificationConfiguration:
            BetterPlayerNotificationConfiguration(showNotification: true, activityName: 'MainActivity', title: video!.title, author: video!.author, imageUrl: video?.getBestThumbnail()?.url ?? ''));
    videoController =
        BetterPlayerController(const BetterPlayerConfiguration(handleLifecycle: false, autoPlay: true, allowedScreenSleep: false, fit: BoxFit.contain), betterPlayerDataSource: betterPlayerDataSource);

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
/*
    controller = VideoPlayerController.network(video!.formatStreams[2].url)
      ..initialize().then((v) {
        setState(() {
          chewieController = ChewieController(
              videoPlayerController: controller!,
              autoPlay: true,
              materialProgressColors:
                  ChewieProgressColors(playedColor: colorScheme.primary.withOpacity(0.5), backgroundColor: Colors.grey.withOpacity(0.5), bufferedColor: Colors.grey, handleColor: colorScheme.primary));

          playingVideo = true;
          controller!.setVolume(100).then((value) {});
          controller!.play();
          Wakelock.enable();
          loadingStream = false;
          if (sponsorSegments.isNotEmpty) {
            controller!.addListener(onVideoListener);
          }
        });
      });
*/
  }

  onVideoListener(BetterPlayerEvent event) {
    if (event.betterPlayerEventType == BetterPlayerEventType.progress && sponsorSegments.isNotEmpty) {
      int currentPosition = (event.parameters?['progress'] as Duration).inMilliseconds;

      List<int> nextSegment = sponsorSegments.elementAt(0);
      bool matched = nextSegment[0].compareTo(currentPosition) <= -1 && nextSegment[1].compareTo(currentPosition) >= 1;
      if (matched) {
        final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
        scaffold?.showSnackBar(const SnackBar(
          content: Text('Sponsor skipped'),
          duration: Duration(seconds: 1),
        ));
        videoController!.seekTo(Duration(milliseconds: nextSegment[1] + 1000));
        setState(() {
          sponsorSegments.removeFirst();
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            scrollController.animateTo(0, duration: animationDuration, curve: Curves.easeInOutQuad);
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.info), label: 'Info'),
          NavigationDestination(icon: Icon(Icons.chat_bubble), label: 'Comments'),
          NavigationDestination(icon: Icon(Icons.schema), label: 'Recommended')
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: colorScheme.background,
            width: double.infinity,
            height: double.infinity,
            child: AnimatedSwitcher(
                duration: animationDuration,
                child: loadingVideo
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedScale(
                              scale: elevateThumbnail ? 1.03 : 1.0,
                              duration: animationDuration,
                              curve: Curves.easeInOutQuad,
                              child: VideoThumbnailView(
                                videoId: video!.videoId,
                                thumbnailUrl: video!.getBestThumbnail()?.url ?? '',
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: AnimatedSwitcher(
                                      duration: animationDuration,
                                      child: !playingVideo
                                          ? loadingStream
                                              ? const CircularProgressIndicator()
                                              : GestureDetector(
                                                  key: const ValueKey('nt-playing'),
                                                  onTap: () => playVideo(context),
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    color: colorScheme.primary,
                                                    size: 100,
                                                  ),
                                                )
                                          : BetterPlayer(
                                              key: _betterPlayerKey,
                                              controller: videoController!,
                                            )),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: ListView(
                                controller: scrollController,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: AnimatedSwitcher(
                                          duration: animationDuration,
                                          child: <Widget>[
                                            VideoInfo(
                                              video: video!,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Comments',
                                                  style: TextStyle(color: colorScheme.secondary, fontSize: 20),
                                                ),
                                                CommentsView(
                                                  videoId: video!.videoId,
                                                ),
                                              ],
                                            ),
                                            RecommendedVideos(video: video!)
                                          ][selectedIndex]))
                                ],
                              ),
                            )),
                          ],
                        ),
                      )),
          ),
        ),
      ),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    Video video = await service.getVideo(widget.videoId);
    setState(() {
      this.video = video;
      loadingVideo = false;
    });

    if (useSponsorBlock) {
      List<SponsorSegment> sponsorSegments = await service.getSponsorSegments(widget.videoId);
      Queue<List<int>> segments = Queue.from(sponsorSegments.map((e) {
        Duration start = Duration(seconds: e.segment[0].floor());
        Duration end = Duration(seconds: e.segment[1].floor());
        List<int> segment = [];
        segment.add(start.inMilliseconds);
        segment.add(end.inMilliseconds);
        return segment;
      }).toList());

      setState(() {
        this.sponsorSegments = segments;
      });
    }
  }
}
