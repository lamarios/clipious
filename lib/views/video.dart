import 'dart:collection';

import 'package:better_player/better_player.dart';
import 'package:invidious/database.dart';
import 'package:invidious/main.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/video/info.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import '../models/sponsorSegment.dart';
import '../models/video.dart';
import 'package:wakelock/wakelock.dart';

class VideoView extends StatefulWidget {
  final String videoId;

  const VideoView({super.key, required this.videoId});

  @override
  State<VideoView> createState() => VideoViewState();
}

class VideoViewState extends State<VideoView> with AfterLayoutMixin<VideoView> {
  Video? video;
  bool loadingVideo = true;
  bool playingVideo = false;
  bool showControls = false;
  double progress = 0;
  String progressText = '';
  bool isSubscribed = false;

  // VideoPlayerController? controller;

  // ChewieController? chewieController;
  BetterPlayerController? videoController;
  int selectedIndex = 0;
  bool loadingStream = false;
  bool useSponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  Queue<List<int>> sponsorSegments = Queue.of([]);

  @override
  dispose() async {
    super.dispose();
    Wakelock.disable();
    if (videoController != null) {
      videoController!.removeEventsListener(onVideoListener);
      videoController!.dispose();
    }
/*
    if (controller != null) {
      if (sponsorSegments.isNotEmpty) {
        controller!.removeListener(onVideoListener);
      }
      await controller!.dispose();
      // chewieController!.dispose();
    }
*/
  }

  playVideo(BuildContext context) {
    setState(() {
      loadingStream = true;
    });
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      video!.dashUrl,
      videoFormat: BetterPlayerVideoFormat.dash,
    );
    videoController = BetterPlayerController(const BetterPlayerConfiguration(autoPlay: true, allowedScreenSleep: false, fit: BoxFit.contain), betterPlayerDataSource: betterPlayerDataSource);

    videoController!.addEventsListener(onVideoListener);
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

  toggleSubscription() async {
    if (this.isSubscribed) {
      await service.unSubscribe(video!.authorId);
    } else {
      await service.subscribe(video!.authorId);
    }
    bool isSubscribed = await service.isSubscribedToChannel(video!.authorId);
    setState(() {
      this.isSubscribed = isSubscribed;
    });
  }

/*
  togglePlayPause() {
    betterPlayerController!. ? controller!.pause() : controller!.play();
    setState(() {
      showControls = true;
      if (controller!.value.isPlaying) {
        EasyDebounce.debounce('video-controls', Duration(seconds: 2), () {
          setState(() {
            showControls = false;
          });
        });
      } else {
        EasyDebounce.cancel('video-controls');
      }
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        elevation: 0,
        onDestinationSelected: (int index) {
          print(index);
          setState(() {
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
                            AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(video?.getBestThumbnail()?.url ?? ''),
                                    fit: BoxFit.cover,
                                  )),
                              width: double.infinity,
                              alignment: Alignment.center,
                              duration: animationDuration,
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
                                            controller: videoController!,
                                          )),
                              ),
                            ),
                            Text(
                              video?.title ?? '',
                              style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(video!.publishedText),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: colorScheme.onSurface,
                                        image: DecorationImage(image: NetworkImage(video?.getBestAuthorThumbnail()?.url ?? ''), fit: BoxFit.cover)),
                                  ),
                                ),
                                Expanded(child: Text(video!.author)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 25,
                                      child: FilledButton.tonal(
                                        onPressed: toggleSubscription,
                                        child: Row(
                                          children: [
                                            Icon(isSubscribed ? Icons.done : Icons.add),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(isSubscribed ? 'Subscribed' : 'Subscribe'),
                                            ),
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                            Expanded(child: Padding(padding: EdgeInsets.only(top: 10), child: <Widget>[VideoInfo(video: video!), Text('comments'), RecommendedVideos(video: video!)][selectedIndex]))
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
    bool isSubscribed = await service.isSubscribedToChannel(video.authorId);
    setState(() {
      this.video = video;
      loadingVideo = false;
      this.isSubscribed = isSubscribed;
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
