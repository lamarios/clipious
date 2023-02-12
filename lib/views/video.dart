// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/db/progress.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video/comments.dart';
import 'package:invidious/views/video/info.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../models/sponsorSegment.dart';
import '../models/video.dart';
import '../utils.dart';
import 'video/addToPlayList.dart';

class VideoView extends StatefulWidget {
  final String videoId;

  const VideoView({super.key, required this.videoId});

  @override
  State<VideoView> createState() => VideoViewState();
}

class VideoViewState extends State<VideoView> with AfterLayoutMixin<VideoView>, RouteAware {
  GlobalKey _betterPlayerKey = GlobalKey();

  Video? video;
  bool loadingVideo = true;
  bool playingVideo = false;
  bool showControls = false;
  bool elevateThumbnail = false;
  double progress = 0;
  double scale = 1.0;
  String progressText = '';
  ScrollController scrollController = ScrollController();

  // VideoPlayerController? controller;

  // ChewieController? chewieController;
  BetterPlayerController? videoController;
  int selectedIndex = 0;
  bool loadingStream = false;
  bool useSponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  Queue<List<int>> sponsorSegments = Queue.of([]);
  bool isLoggedIn = service.isLoggedIn();

  String error = '';

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  dispose() async {
    super.dispose();
    scrollController.dispose();
    if (videoController != null) {
      videoController!.removeEventsListener(onVideoListener);
      videoController!.dispose();
    }
  }

  @override
  void didPushNext() {
/*
    if (videoController != null) {
      videoController?.dispose();
      setState(() {
        playingVideo = false;
      });
    }
    super.didPushNext();
*/
  }

  onScroll() {
    setState(() {
      scale = 1 + min(0.03, ((scrollController.offset) / 20000));
    });
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
  }

  onVideoListener(BetterPlayerEvent event) {
    if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
      double progress = db.getVideoProgress(video!.videoId);
      if (progress > 0 && progress < 0.90) {
        videoController!.seekTo(Duration(seconds: (video!.lengthSeconds * progress).floor()));
        EasyDebounce.debounce('after-seek', Duration(seconds: 1), () {
          videoController!.play();
        });
      }
    }

    if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
      int currentPosition = (event.parameters?['progress'] as Duration).inSeconds;
      int max = video?.lengthSeconds ?? 0;
      db.saveProgress(Progress.named(progress: currentPosition / max, videoId: video!.videoId));
    }
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
      appBar: AppBar(
        title: Text(
          video?.title ?? '',
          // style: TextStyle(fontSize: 15),
        ),
        actions: [
          Visibility(
            visible: video != null,
            child: GestureDetector(
              onTap: () => showSharingSheet(context, video!),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.share,
                  color: colorScheme.secondary,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isLoggedIn,
            child: GestureDetector(
              onTap: () => AddToPlaylist.showDialog(context, video!.videoId),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
        scrolledUnderElevation: 0,
      ),
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
                child: error.isNotEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: Text(error),
                      )
                    : loadingVideo
                        ? const CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedScale(
                                  scale: scale,
                                  duration: Duration.zero,
                                  // curve: Curves.easeInOutQuad,
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
    try {
      Video video = await service.getVideo(widget.videoId);
      setState(() {
        this.video = video;
        loadingVideo = false;
      });
    } catch (err) {
      setState(() {
        if (err is InvidiousServiceError) {
          error = (err).message;
        } else {
          error = 'Couldn\'t load the video';
        }
        loadingVideo = false;
      });
      rethrow;
    }

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
