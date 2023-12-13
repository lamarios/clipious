import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';
import 'package:invidious/videos/views/components/compact_video.dart';

import '../../../utils/views/components/placeholders.dart';
import '../../states/history.dart';

class HistoryVideoView extends StatelessWidget {
  final String videoId;

  const HistoryVideoView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryItemCubit(HistoryItemState(videoId: videoId)),
      child: BlocBuilder<HistoryItemCubit, HistoryItemState>(builder: (context, _) {
        return AnimatedCrossFade(
          firstChild: const CompactVideoPlaceHolder(),
          secondChild: _.cachedVid != null
              ? CompactVideo(
                  onTap: () => AutoRouter.of(context).push(VideoRoute(videoId: _.cachedVid!.videoId)),
                  video: _.cachedVid?.toBaseVideo(),
                )
              : const CompactVideoPlaceHolder(),
          crossFadeState: _.loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: animationDuration,
        );
      }),
    );
  }
}
