import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/video/commentsContainer.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../../controllers/videoInnerViewController.dart';
import '../../globals.dart';
import 'info.dart';

class VideoTabletInnerView extends StatelessWidget {
  final Video video;
  final int selectedIndex;
  bool? playNow;
  final Function(DragUpdateDetails) onVideoDrag;
  final Function(DragEndDetails) onDragEnd;

  VideoTabletInnerView({super.key, required this.video, required this.selectedIndex, this.playNow, required this.onVideoDrag, required this.onDragEnd});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GetBuilder(
      init: VideoInnerViewController(),
      global: false,
      builder: (_) => Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: GestureDetector(
                      onVerticalDragUpdate: onVideoDrag,
                      onVerticalDragEnd: onDragEnd,
                      child: VideoPlayer(
                        playNow: playNow,
                        miniPlayer: false,
                        video: video,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: ListView(
                        controller: _.scrollController,
                        children: [
                          AnimatedSwitcher(
                              duration: animationDuration,
                              child: <Widget>[
                                VideoInfo(
                                  video: video,
                                ),
                                CommentsContainer(video: video),
                                RecommendedVideos(video: video)
                              ][selectedIndex])
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          SizedBox(width: 350, child: SingleChildScrollView(child: RecommendedVideos(video: video)))
        ],
      ),
    );
  }
}
