import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/video.dart';
import 'package:invidious/views/video/player.dart';

class MiniPlayer extends StatelessWidget {
  List<Video>? videos;

  MiniPlayer({Key? key, this.videos}) : super(key: key);

  showVideo(MiniPlayerController controller) {
    Video video = controller.showVideo();
/*
    navigatorKey.currentState?.push(PageRouteBuilder(
      settings: ROUTE_VIDEO,
      pageBuilder: (context, animation, secondaryAnimation) => VideoView(videoId: video.videoId, playNow: true),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
    ));
*/
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_VIDEO, builder: (context) => VideoView(videoId: video.videoId, playNow: true)));
  }

  onDragEnd(DragEndDetails details, MiniPlayerController controller) {
    Video? video = controller.onDragEnd(details);
    if (video != null) {
      navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_VIDEO, builder: (context) => VideoView(videoId: video.videoId, playNow: true)));
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    ColorScheme colors = themeData.colorScheme;
    return GetBuilder<MiniPlayerController>(
      init: MiniPlayerController(videos: videos ?? []),
      builder: (_) => AnimatedPositioned(
          bottom: _.bottom,
          left: 0,
          right: 0,
          duration: animationDuration ~/ 2,
          child: AnimatedOpacity(
            opacity: _.opacity,
            duration: animationDuration,
            child: GestureDetector(
              onVerticalDragUpdate: _.onDragUpdate,
              onVerticalDragEnd: (d) => onDragEnd(d, _),
              child: Container(
                height: _.height,
                color: colors.secondaryContainer,
                child: Row(
                  // children: [Text(videos.length.toString())],
                  children: _.videos.isNotEmpty
                      ? [
                          VideoPlayer(
                            video: _.videos[_.currentIndex],
                            miniPlayer: true,
                          ),
                          Visibility(
                            visible: _.showTitle,
                            child: Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Builder(builder: (context) {
                                Video vid = _.videos[_.currentIndex];

                                return GestureDetector(
                                  onTap: () => showVideo(_),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        vid.title,
                                        style: themeData.textTheme.bodyMedium?.copyWith(color: colors.primary, fontSize: 12),
                                      ),
                                      Text(
                                        vid.author,
                                        style: themeData.textTheme.bodySmall?.copyWith(color: colors.secondary, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            )),
                          ),
                          Visibility(
                            visible: _.showTitle,
                            child: GestureDetector(
                              onTap: _.hide,
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
          )),
    );
  }
}
