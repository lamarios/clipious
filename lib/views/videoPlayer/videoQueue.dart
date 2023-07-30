import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/views/components/compactVideo.dart';

class VideoQueue extends StatelessWidget {
  final MiniPlayerController controller;

  const VideoQueue({Key? key, required this.controller}) : super(key: key);

  List<Widget> onlineVideoQueue(BuildContext context) {
    return controller.videos.map((e) {
      bool isPlaying = controller.videos[controller.currentIndex].videoId == e.videoId;
      return SwipeActionCell(
        key: ObjectKey(e),
        trailingActions: isPlaying
            ? []
            : [
                SwipeAction(
                    performsFirstActionWithFullSwipe: true,
                    onTap: (handler) async {
                      await handler(true);
                      return controller.removeVideoFromQueue(e.videoId);
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
    }).toList();
  }

  List<Widget> offlineVideoQueue(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return controller.offlineVideos.map((e) {
      bool isPlaying = controller.offlineVideos[controller.currentIndex].videoId == e.videoId;
      return SwipeActionCell(
        key: ObjectKey(e),
        trailingActions: isPlaying
            ? []
            : [
                SwipeAction(
                    performsFirstActionWithFullSwipe: true,
                    onTap: (handler) async {
                      await handler(true);
                      return controller.removeVideoFromQueue(e.videoId);
                    },
                    color: Colors.red.shade400,
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ))
              ],
        child: CompactVideo(
          onTap: isPlaying ? () {} : () => controller.switchToOfflineVideo(e),
          offlineVideo: e,
          highlighted: isPlaying,
          trailing: [
            e.audioOnly ? Icon(Icons.audiotrack, color: colors.secondary,) : const SizedBox.shrink(),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return controller.videos.isNotEmpty || controller.offlineVideos.isNotEmpty
        ? ReorderableListView(onReorder: controller.onQueueReorder, children: controller.videos.isNotEmpty ? onlineVideoQueue(context) : offlineVideoQueue(context))
        : const Text('empty queue, should never be displayed');
  }
}
