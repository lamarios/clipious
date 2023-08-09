import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/components/compactVideo.dart';
import 'package:invidious/views/video.dart';

import '../../controllers/historyController.dart';

class HistoryVideoView extends StatelessWidget {
  final String videoId;

  const HistoryVideoView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryItemController>(
        global: false,
        init: HistoryItemController(videoId: videoId),
        builder: (_) {
          return AnimatedCrossFade(
            firstChild: const CompactVideoPlaceHolder(),
            secondChild: _.cachedVid != null
                ? CompactVideo(
                    onTap: () => navigatorKey.currentState?.pushNamed(PATH_VIDEO, arguments: VideoRouteArguments(videoId: _.cachedVid!.videoId)),
                    video: _.cachedVid?.toBaseVideo(),
                  )
                : const SizedBox.shrink(),
            crossFadeState: _.loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: animationDuration,
          );
        });
  }
}
