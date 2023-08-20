import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/player/states/video_queue.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:invidious/videos/views/components/compact_video.dart';

class VideoQueue extends StatelessWidget {
  const VideoQueue({Key? key}) : super(key: key);

  Widget onlineVideoQueue(BuildContext context, int index, BaseVideo video) {
    var controller = context.read<PlayerCubit>();
    var state = controller.state;
    bool isPlaying = index == state.currentIndex;
    return SwipeActionCell(
      key: ValueKey(video.videoId),
      trailingActions: isPlaying
          ? []
          : [
              SwipeAction(
                  performsFirstActionWithFullSwipe: true,
                  onTap: (handler) async {
                    await handler(true);
                    return controller.removeVideoFromQueue(video.videoId);
                  },
                  color: Colors.red.shade400,
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ))
            ],
      child: CompactVideo(
        onTap: isPlaying ? () {} : () => controller.switchToVideo(video),
        video: video,
        highlighted: isPlaying,
      ),
    );
  }

  Widget offlineVideoQueue(BuildContext context, int index, DownloadedVideo v) {
    var colors = Theme.of(context).colorScheme;
    var controller = context.read<PlayerCubit>();
    var state = controller.state;
    bool isPlaying = state.currentIndex == index;

    return SwipeActionCell(
      key: ValueKey(v.id),
      trailingActions: isPlaying
          ? []
          : [
              SwipeAction(
                  performsFirstActionWithFullSwipe: true,
                  onTap: (handler) async {
                    await handler(true);
                    return controller.removeVideoFromQueue(v.videoId);
                  },
                  color: Colors.red.shade400,
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ))
            ],
      child: CompactVideo(
        onTap: isPlaying ? () {} : () => controller.switchToOfflineVideo(v),
        offlineVideo: v,
        highlighted: isPlaying,
        trailing: [
          v.audioOnly
              ? Icon(
                  Icons.audiotrack,
                  color: colors.secondary,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var controller = context.read<PlayerCubit>();
    var state = controller.state;
    return state.videos.isNotEmpty || state.offlineVideos.isNotEmpty
        ? BlocProvider(
            create: (BuildContext context) => VideoQueueCubit(ScrollController()),
            child: BlocBuilder<VideoQueueCubit, ScrollController>(builder: (context, scrollController) {
              return BlocConsumer<PlayerCubit, PlayerState>(
                listenWhen: (previous, current) => previous.currentIndex != current.currentIndex,
                listener: (context, state) {
                  EasyDebounce.debounce('video-queue-scrolling', const Duration(milliseconds: 500), () {
                    scrollController.animateTo(state.currentIndex * compactVideoHeight, duration: animationDuration, curve: Curves.easeInOutQuad);
                  });
                },
                builder: (context, state) => ReorderableListView.builder(
                    scrollController: scrollController,
                    itemCount: state.videos.isNotEmpty ? state.videos.length : state.offlineVideos.length,
                    onReorder: controller.onQueueReorder,
                    itemBuilder: (context, index) => state.videos.isNotEmpty ? onlineVideoQueue(context, index, state.videos[index]) : offlineVideoQueue(context, index, state.offlineVideos[index])),
              );
            }),
          )
        : const Text('empty queue, should never be displayed');
  }
}
