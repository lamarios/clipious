import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/videoPlayer/videoQueue.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../videos/models/video.dart';
import '../../comments/views/components/comments_container.dart';
import '../../videos/views/components/info.dart';
import '../../videos/views/components/recommended_videos.dart';
import 'miniPlayerControls.dart';

class VideoPlayerFullScreenView {
  static List<Widget> build(BuildContext context, MiniPlayerController controller) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    ColorScheme colors = Theme.of(context).colorScheme;

    Video? video = controller.currentlyPlaying;
    DownloadedVideo? offlineVid = controller.offlineCurrentlyPlaying;

    return video != null || offlineVid != null
        ? [
            Visibility(
                visible: !controller.isMini,
                child: MiniPlayerControls(
                  controller: controller,
                  videoId: video?.videoId ?? offlineVid?.videoId ?? '',
                )),
            Visibility(
                visible: !controller.isMini,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
                      child: video != null
                          ? <Widget>[
                              SingleChildScrollView(
                                child: VideoInfo(
                                  video: video,
                                ),
                              ),
                              SingleChildScrollView(
                                child: CommentsContainer(
                                  video: video,
                                  key: ValueKey('comms-${video.videoId}'),
                                ),
                              ),
                              SingleChildScrollView(child: RecommendedVideos(video: video)),
                              VideoQueue(controller: controller),
                            ][controller.selectedFullScreenIndex]
                          : VideoQueue(controller: controller),
                    ),
                  ),
                )),
            Visibility(
              visible: !controller.isMini && video != null,
              child: SizedBox(
                // height: 80,
                child: NavigationBar(backgroundColor: colors.background, elevation: 0, selectedIndex: controller.selectedFullScreenIndex, onDestinationSelected: controller.selectTab, destinations: [
                  NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
                  NavigationDestination(icon: const Icon(Icons.chat_bubble), label: locals.comments),
                  NavigationDestination(icon: const Icon(Icons.schema), label: locals.recommended),
                  NavigationDestination(icon: const Icon(Icons.playlist_play), label: locals.videoQueue)
                ]),
              ),
            )
          ]
        : [];
  }
}
