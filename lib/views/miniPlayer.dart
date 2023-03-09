import 'dart:math';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/video.dart';
import 'package:invidious/views/video/player.dart';

final GlobalKey<MiniPlayerState> miniPlayerKey = GlobalKey<MiniPlayerState>();

class MiniPlayer extends StatefulWidget {
  List<Video>? videos;

  MiniPlayer({Key? key, this.videos}) : super(key: key);

  @override
  State<MiniPlayer> createState() => MiniPlayerState();
}

const double targetHeight = 75;
const double navigationBarHeight = 75;

class MiniPlayerState extends State<MiniPlayer> {
  double opacity = 0;
  double bottom = 0;
  int currentIndex = 0;
  List<Video> videos = [];
  double height = targetHeight;
  bool showTitle = true;

  @override
  initState() {
    super.initState();
    setState(() {
      videos = widget.videos ?? [];
    });
    show();
  }

  setVideos(List<Video> videos) {
    setState(() {
      this.videos = videos;
    });
  }

  show() {
    setState(() {
      opacity = 1;
      bottom = navigationBarHeight;
    });
  }

  hide() {
    FBroadcast.instance().broadcast(BROADCAST_STOP_MINI_PLAYER);
    setState(() {
      opacity = 0;
      height = targetHeight;
      bottom = -targetHeight;
      videos = [];
      showTitle = true;
    });
  }

  void move(bool aboveNavigation) {
    // if we're not hidden only we do something
    if (bottom > 0) {
      setState(() {
        bottom = aboveNavigation ? navigationBarHeight : 0;
      });
    }
  }

  onDragUpdate(DragUpdateDetails details) {
    double opacity = 1 - min(1, ((-details.localPosition.dy) / miniPlayerThreshold));
    double height = max(targetHeight, targetHeight + (-details.localPosition.dy));
    setState(() {
      showTitle = false;
      this.height = height;
      this.opacity = min(1, opacity);
    });
  }

  onDragEnd(DragEndDetails details) {
    if (height > miniPlayerThreshold) {
      showVideo();
    } else {
      setState(() {
        showTitle = true;
        height = targetHeight;
        opacity = 1;
      });
    }
  }

  showVideo() {
    Video video = videos[currentIndex];
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoView(videoId: video.videoId, playNow: true)));
    hide();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    ColorScheme colors = themeData.colorScheme;
    return AnimatedPositioned(
        bottom: bottom,
        left: 0,
        right: 0,
        duration: animationDuration ~/ 2,
        child: AnimatedOpacity(
          opacity: opacity,
          duration: animationDuration,
          child: GestureDetector(
            onVerticalDragUpdate: onDragUpdate,
            onVerticalDragEnd: onDragEnd,
            child: Container(
              height: height,
              color: colors.secondaryContainer,
              child: Row(
                // children: [Text(videos.length.toString())],
                children: videos.isNotEmpty
                    ? [
                        VideoPlayer(
                          video: videos[currentIndex],
                          miniPlayer: true,
                        ),
                        Visibility(
                          visible: showTitle,
                          child: Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Builder(builder: (context) {
                              Video vid = videos[currentIndex];

                              return GestureDetector(
                                onTap: showVideo,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      vid.title,
                                      style: themeData.textTheme.bodyMedium?.copyWith(color: colors.primary),
                                    ),
                                    Text(
                                      vid.author,
                                      style: themeData.textTheme.bodySmall?.copyWith(color: colors.secondary),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          )),
                        ),
                        Visibility(
                          visible: showTitle,
                          child: GestureDetector(
                            onTap: hide,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.clear),
                            ),
                          ),
                        )
                      ]
                    : [],
              ),
            ),
          ),
        ));
  }
}
