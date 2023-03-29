import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/video.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/videoPlayer/fullScreenView.dart';
import 'package:invidious/views/videoPlayer/miniPlayerView.dart';

class MiniPlayer extends StatelessWidget {
  List<Video>? videos;
  GlobalKey playerKey = GlobalKey();

  MiniPlayer({Key? key, this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    ColorScheme colors = themeData.colorScheme;
    return GetBuilder<MiniPlayerController>(
      init: MiniPlayerController(videos: videos ?? []),
      builder: (_) {
        bool showPlayer = _.videos.length > _.currentIndex;

        Widget videoPlayer = showPlayer
            ? GestureDetector(
                key: const ValueKey('player'),
                onVerticalDragEnd: _.videoDraggedDownEnd,
                onVerticalDragUpdate: _.videoDraggedDown,
                child: VideoPlayer(
                  video: _.videos[_.currentIndex],
                  miniPlayer: false,
                ),
              )
            : const SizedBox.shrink();

        List<Widget> miniPlayerWidgets = [];

        List<Widget> bigPlayerWidgets = [];

        if (showPlayer) {
          miniPlayerWidgets.addAll(MiniPlayerView.build(context, _));
          bigPlayerWidgets.addAll(VideoPlayerFullScreenView.build(context, _));
          print('mini player widgets ${miniPlayerWidgets.length}, bigplayer widgets : ${bigPlayerWidgets.length}');
        }

        return AnimatedPositioned(
          left: 0,
          top: _.top,
          bottom: _.bottom,
          right: 0,
          duration: _.isDragging ? Duration.zero : animationDuration ~/ 4,
          child: Material(
            child: SafeArea(
              bottom: false,
              top: !_.isMini,
              child: showPlayer
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _.isMini
                            ? const SizedBox.shrink()
                            : AppBar(
                                title: Text('test'),
                              ),
                        AnimatedContainer(
                          width: double.infinity,
                          color: _.isMini ? colors.secondaryContainer : colors.background,
                          height: _.isMini ? targetHeight : 200,
                          duration: animationDuration,
                          child: Row(
                            mainAxisAlignment: _.isMini ? MainAxisAlignment.start : MainAxisAlignment.center,
                            children: [videoPlayer ?? const SizedBox.shrink(), ...miniPlayerWidgets],
                          ),
                        ),
                        ...bigPlayerWidgets,
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
