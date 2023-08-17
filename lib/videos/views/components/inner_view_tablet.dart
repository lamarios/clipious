import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:invidious/videos/views/components/play_button.dart';
import 'package:invidious/comments/views/components/comments_container.dart';
import 'package:invidious/videos/views/components/recommended_videos.dart';

import '../../states/video.dart';
import '../../../globals.dart';
import '../../../utils.dart';
import 'add_to_queue_button.dart';
import 'video_thumbnail.dart';
import 'info.dart';

class VideoTabletInnerView extends StatelessWidget {
  final Video video;
  final int selectedIndex;
  final bool? playNow;
  final VideoState videoController;

  const VideoTabletInnerView({super.key, required this.video, required this.selectedIndex, this.playNow, required this.videoController});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    var cubit = context.read<VideoCubit>();
    return Row(
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
                          onPressed: cubit.playVideo,
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
                Container(
                  constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 25, child: Checkbox(value: videoController.playRecommendedNext, onChanged: cubit.togglePlayRecommendedNext, visualDensity: VisualDensity.compact)),
                      InkWell(
                          onTap: () => cubit.togglePlayRecommendedNext(!videoController.playRecommendedNext),
                          child: Text(
                            locals.addRecommendedToQueue,
                            style: textTheme.bodySmall,
                          ))
                    ],
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
                      controller: videoController.scrollController,
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
        SizedBox(width: 350, child: SingleChildScrollView(child: RecommendedVideos(video: video)))
      ],
    );
  }
}
