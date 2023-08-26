import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/comments/views/components/comments_container.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:invidious/videos/views/components/add_to_queue_button.dart';
import 'package:invidious/videos/views/components/play_button.dart';
import 'package:invidious/videos/views/components/recommended_videos.dart';

import '../../../globals.dart';
import '../../../settings/states/settings.dart';
import '../../states/video.dart';
import 'info.dart';
import 'video_thumbnail.dart';

class VideoInnerView extends StatelessWidget {
  final Video video;
  final int selectedIndex;
  bool? playNow;
  final VideoState videoController;

  VideoInnerView({super.key, required this.video, required this.selectedIndex, this.playNow, required this.videoController});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    var cubit = context.read<VideoCubit>();
    var settings = context.read<SettingsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VideoThumbnailView(
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
        if(!settings.state.distractionFreeMode)Builder(
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 25, child: Checkbox(value: settings.state.playRecommendedNext, onChanged: cubit.togglePlayRecommendedNext, visualDensity: VisualDensity.compact)),
                InkWell(
                    onTap: () => cubit.togglePlayRecommendedNext(!settings.state.playRecommendedNext),
                    child: Text(
                      locals.addRecommendedToQueue,
                      style: textTheme.bodySmall,
                    ))
              ],
            );
          }
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 0),
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
                    CommentsContainer(
                      video: video,
                    ),
                    RecommendedVideos(video: video)
                  ][selectedIndex])
            ],
          ),
        )),
      ],
    );
  }
}
