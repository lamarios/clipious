import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoInnerViewController.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/video/commentsContainer.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../../globals.dart';
import 'info.dart';

class VideoInnerView extends StatelessWidget {
  final Video video;
  final int selectedIndex;
  final Function(DragUpdateDetails) onVideoDrag;
  final Function(DragEndDetails) onDragEnd;
  bool? playNow;

  VideoInnerView({super.key, required this.video, required this.selectedIndex, required this.onVideoDrag, required this.onDragEnd, this.playNow});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<VideoInnerViewController>(
      init: VideoInnerViewController(),
      tag: VideoInnerViewController.getControllerTags(video.videoId),
      builder: (_)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           GestureDetector(
              onVerticalDragUpdate: onVideoDrag,
              onVerticalDragEnd: onDragEnd,
              child: VideoPlayer(
                playNow: playNow,
                miniPlayer: false,
                video: video,
              ),
            ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: ListView(
              controller: _.scrollController,
              children: [
                AnimatedSwitcher(
                    duration: animationDuration,
                    child: <Widget>[
                      VideoInfo(
                        video: video,
                      ),
                      CommentsContainer(video: video,),
                      RecommendedVideos(video: video)
                    ][selectedIndex])
              ],
            ),
          )),
        ],
      ),
    );
  }
}
