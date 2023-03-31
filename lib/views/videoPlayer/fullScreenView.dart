import 'package:flutter/material.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/video/player.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/views/videoPlayer/videoQueue.dart';

import '../../models/video.dart';
import '../video/commentsContainer.dart';
import '../video/info.dart';
import '../video/recommendedVideos.dart';

class VideoPlayerFullScreenView {
  static List<Widget> build(BuildContext context, MiniPlayerController controller) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    Video video = controller.videos[controller.currentIndex];

    return [
      Visibility(
          visible: !controller.isMini,
          child: Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: <Widget>[
                  VideoInfo(
                    video: video,
                  ),
                  CommentsContainer(
                    video: video,
                  ),
                  RecommendedVideos(video: video),
                  VideoQueue(controller: controller),
                ][controller.selectedFullScreenIndex],
              ),
            ),
          )),
      Visibility(
        visible: !controller.isMini,
        child: NavigationBar(elevation: 0, selectedIndex: controller.selectedFullScreenIndex, onDestinationSelected: controller.selectTab, destinations: [
          NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
          NavigationDestination(icon: const Icon(Icons.chat_bubble), label: locals.comments),
          NavigationDestination(icon: const Icon(Icons.schema), label: locals.recommended),
          NavigationDestination(icon: const Icon(Icons.queue_music), label: locals.videoQueue)
        ]),
      )
    ];
  }
}
