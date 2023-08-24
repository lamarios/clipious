import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/videos/views/components/compact_video.dart';
import 'package:invidious/videos/views/components/history.dart';
import 'package:invidious/videos/views/components/video_in_list.dart';
import 'package:invidious/videos/views/components/video_list.dart';
import 'package:invidious/videos/views/screens/video.dart';

import '../../../utils/views/components/placeholders.dart';
import '../../states/history.dart';

class HistoryVideoView extends StatelessWidget {
  final String videoId;
  final bool small;

  const HistoryVideoView({super.key, required this.videoId, this.small = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryItemCubit(HistoryItemState(videoId: videoId)),
      child: BlocBuilder<HistoryItemCubit, HistoryItemState>(builder: (context, _) {
        return AnimatedCrossFade(
          firstChild: small
              ? const AspectRatio(
                  aspectRatio: smallVideoAspectRatio,
                  child: VideoListItemPlaceHolder(
                    small: true,
                  ))
              : const CompactVideoPlaceHolder(),
          secondChild: _.cachedVid != null
              ? small
                  ? AspectRatio(
                      aspectRatio: smallHistoryAspectRatio,
                      child: VideoListItem(
                        small: true,
                        video: _.cachedVid?.toBaseVideo().toVideoInList(),
                      ),
                    )
                  : CompactVideo(
                      onTap: () => navigatorKey.currentState?.pushNamed(PATH_VIDEO, arguments: VideoRouteArguments(videoId: _.cachedVid!.videoId)),
                      video: _.cachedVid?.toBaseVideo(),
                    )
              : small
                  ? const AspectRatio(
                      aspectRatio: smallHistoryAspectRatio,
                      child: VideoListItemPlaceHolder(
                        small: true,
                      ),
                    )
                  : const CompactVideoPlaceHolder(),
          crossFadeState: _.loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: animationDuration,
        );
      }),
    );
  }
}
