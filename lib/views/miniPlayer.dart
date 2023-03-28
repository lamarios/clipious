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
        Widget? videoPlayer = _.videos.length > _.currentIndex
            ? GestureDetector(
                onVerticalDragEnd: _.videoDraggedDownEnd,
                onVerticalDragUpdate: _.videoDraggedDown,
                child: VideoPlayer(
                  video: _.videos[_.currentIndex],
                  miniPlayer: true,
                ),
              )
            : null;

        List<Widget> miniPlayerWidgets = [];
        if (_.isMini && videoPlayer != null) {
          miniPlayerWidgets.addAll(MiniPlayerView.build(context, _));
        }

        List<Widget> bigPlayerWidgets = [];
        if (!_.isMini && videoPlayer != null) {
          bigPlayerWidgets.addAll(VideoPlayerFullScreenView.build(context, _));
        }

        print('mini player widgets ${miniPlayerWidgets.length}, bigplayer widgets : ${bigPlayerWidgets.length}');

        return Positioned(
          left: 0,
          top: _.isMini ? null : 0,
          bottom: _.bottom,
          right: 0,
          child: Material(
            child: SafeArea(
              bottom: false,
              child: Column(
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
              ),
            ),
          ),
        );
      },
    );
  }
}
