import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/utils/views/components/conditional_wrap.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:invidious/videos/views/components/play_button.dart';

import '../../../player/states/player.dart';
import '../../../settings/states/settings.dart';
import '../../../utils.dart';
import '../../states/video.dart';
import 'add_to_queue_button.dart';
import 'info.dart';
import 'video_thumbnail.dart';

class VideoTabletInnerView extends StatelessWidget {
  final Video video;
  final bool? playNow;
  final Widget child;
  final VideoState videoController;
  final TabController tabController;

  const VideoTabletInnerView(
      {super.key,
      required this.video,
      this.playNow,
      required this.child,
      required this.videoController,
      required this.tabController});

  List<Widget> getView(BuildContext context,
      {required Orientation orientation}) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    var cubit = context.read<VideoCubit>();
    var settings = context.read<SettingsCubit>();
    String? currentlyPlayingVideoId = context
        .select((PlayerCubit player) => player.state.currentlyPlaying?.videoId);
    final bool restart = currentlyPlayingVideoId == video.videoId;
    var distractionFreeMode = settings.state.distractionFreeMode;
    return [
      ConditionalWrap(
        wrapper: (Widget child) => Expanded(
          flex: 2,
          child: child,
        ),
        wrapIf: orientation == Orientation.landscape,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: VideoThumbnailView(
                  videoId: video.videoId,
                  thumbnailUrl: video.deArrowThumbnailUrl ??
                      video.getBestThumbnail()?.url ??
                      '',
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PlayButton(
                        icon: restart ? Icons.refresh : null,
                        onPressed:
                            restart ? cubit.restartVideo : cubit.playVideo,
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
              if (!distractionFreeMode)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 25,
                        child: Checkbox(
                            value: settings.state.playRecommendedNext,
                            onChanged: cubit.togglePlayRecommendedNext,
                            visualDensity: VisualDensity.compact)),
                    InkWell(
                        onTap: () => cubit.togglePlayRecommendedNext(
                            !settings.state.playRecommendedNext),
                        child: Text(
                          locals.addRecommendedToQueue,
                          style: textTheme.bodySmall,
                        ))
                  ],
                ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  // constraints: const BoxConstraints(maxWidth: 500),
                  child: ListView(
                    children: [
                      VideoInfo(
                        video: video,
                        dislikes: videoController.dislikes,
                        descriptionAndTags: false,
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: const Icon(Icons.info),
                  text: locals.info,
                ),
                if (!distractionFreeMode)
                  Tab(
                    icon: const Icon(Icons.chat_bubble),
                    text: locals.comments,
                  ),
                if (!distractionFreeMode)
                  Tab(
                    icon: const Icon(Icons.schema),
                    text: locals.recommended,
                  )
              ],
              controller: tabController,
            ),
            Expanded(child: child)
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      var deviceOrientation = getOrientation();
      return deviceOrientation == Orientation.landscape
          ? Row(
              children: getView(context, orientation: deviceOrientation),
            )
          : Column(
              children: getView(context, orientation: deviceOrientation),
            );
    });
  }
}
