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

const double height = 75;
const double navigationBarHeight = 75;

class MiniPlayerState extends State<MiniPlayer> {
  double opacity = 0;
  double bottom = 0;
  int currentIndex = 0;
  List<Video> videos = [];

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
      bottom = -height;
      videos = [];
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
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(builder: (context) {
                          Video vid = videos[currentIndex];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => VideoView(videoId: vid.videoId)));
                              hide();
                            },
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
                      ))
                    ]
                  : [],
            ),
          ),
        ));
  }
}
