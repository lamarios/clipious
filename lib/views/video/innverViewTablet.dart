import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/components/playButton.dart';
import 'package:invidious/views/video/commentsContainer.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controllers/videoController.dart';
import '../../controllers/videoInnerViewController.dart';
import '../../globals.dart';
import '../../utils.dart';
import '../components/addToQueueButton.dart';
import '../components/videoThumbnail.dart';
import 'info.dart';

class VideoTabletInnerView extends StatelessWidget {
  final Video video;
  final int selectedIndex;
  bool? playNow;
  final VideoController videoController;

  VideoTabletInnerView(
      {super.key,
      required this.video,
      required this.selectedIndex,
      this.playNow,
      required this.videoController});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;

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
                    constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
                    child: VideoThumbnailView(
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 25,
                          child: Checkbox(
                              value: videoController.playRecommendedNext,
                              onChanged:
                                  videoController.togglePlayRecommendedNext,
                              visualDensity: VisualDensity.compact)),
                      InkWell(
                          onTap: () =>
                              videoController.togglePlayRecommendedNext(
                                  !videoController.playRecommendedNext),
                          child: Text(
                            locals.addRecommendedToQueue,
                            style: const TextStyle(fontSize: 11),
                          ))
                    ],
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
                                  dislikes: videoController.dislikes,
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
          SizedBox(
              width: 350,
              child:
                  SingleChildScrollView(child: RecommendedVideos(video: video)))
        ],
      ),
    );
  }
}
