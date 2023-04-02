import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoInnerViewController.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/components/addToQueueButton.dart';
import 'package:invidious/views/components/playButton.dart';
import 'package:invidious/views/video/commentsContainer.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../../controllers/videoController.dart';
import '../../globals.dart';
import '../components/videoThumbnail.dart';
import 'info.dart';

class VideoInnerView extends StatelessWidget {
  final Video video;
  final int selectedIndex;
  bool? playNow;
  final VideoController videoController;

  VideoInnerView({super.key, required this.video, required this.selectedIndex, this.playNow, required this.videoController});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<VideoInnerViewController>(
      init: VideoInnerViewController(),
      global: false,
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoThumbnailView(
            videoId: video.videoId,
            thumbnailUrl: video.getBestThumbnail()?.url ?? '',
            child: Stack(
              alignment: Alignment.center,
              children: [
                PlayButton(
                  onPressed: videoController.playVideo,
                ),
                Positioned(
                    right: 5,
                    bottom: 3,
                    child: AddToQueueButton(
                      videos: [video],
                    ))
              ],
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
                      CommentsContainer(
                        video: video,
                      ),
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
