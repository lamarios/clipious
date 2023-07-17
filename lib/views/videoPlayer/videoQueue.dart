import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/views/components/compactVideo.dart';

class VideoQueue extends StatelessWidget {
  final MiniPlayerController controller;

  const VideoQueue({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return controller.videos.isNotEmpty
        ? ReorderableListView(
            onReorder: controller.onQueueReorder,
            children: controller.videos.map((e) {
              bool isPlaying =
                  controller.videos[controller.currentIndex].videoId ==
                      e.videoId;
              return SwipeActionCell(
                key: ObjectKey(e),
                trailingActions: isPlaying
                    ? []
                    : [
                        SwipeAction(
                            performsFirstActionWithFullSwipe: true,
                            onTap: (handler) async {
                              await handler(true);
                              return controller.removeVideoFromQueue(e);
                            },
                            color: Colors.red.shade400,
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.white,
                            ))
                      ],
                child: CompactVideo(
                  onTap: isPlaying ? () {} : () => controller.switchToVideo(e),
                  video: e,
                  highlighted: isPlaying,
                ),
              );
            }).toList())
        : const Text('empty queue, should never be displayed');
  }
}
