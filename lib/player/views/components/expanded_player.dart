import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/player/views/components/video_queue.dart';
import 'package:invidious/utils.dart';

import '../../../comments/views/components/comments_container.dart';
import '../../../downloads/models/downloaded_video.dart';
import '../../../videos/models/video.dart';
import '../../../videos/views/components/info.dart';
import '../../../videos/views/components/recommended_videos.dart';
import 'mini_player_controls.dart';

class ExpandedPlayer {
  static List<Widget> build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    ColorScheme colors = Theme.of(context).colorScheme;

    var player = context.read<PlayerCubit>();
    var controller = player.state;

    Video? video = controller.currentlyPlaying;
    DownloadedVideo? offlineVid = controller.offlineCurrentlyPlaying;

    return video != null || offlineVid != null
        ? [
            Visibility(
                visible: !controller.isMini,
                child: MiniPlayerControls(
                  videoId: video?.videoId ?? offlineVid?.videoId ?? '',
                )),
            Visibility(
                visible: !controller.isMini,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: innerHorizontalPadding),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
                      child: Builder(builder: (context) {
                        var selectedIndex = context.select((PlayerCubit value) => value.state.selectedFullScreenIndex);
                        return video != null
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
                                const VideoQueue(),
                              ][selectedIndex]
                            : const VideoQueue();
                      }),
                    ),
                  ),
                )),
            Visibility(
              visible: !controller.isMini && video != null,
              child: SizedBox(
                // height: 80,
                child: Builder(builder: (context) {
                  var selectedIndex = context.select((PlayerCubit value) => value.state.selectedFullScreenIndex);
                  return NavigationBar(backgroundColor: colors.background, elevation: 0, selectedIndex: selectedIndex, onDestinationSelected: player.selectTab, destinations: [
                    NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
                    NavigationDestination(icon: const Icon(Icons.chat_bubble), label: locals.comments),
                    NavigationDestination(icon: const Icon(Icons.schema), label: locals.recommended),
                    NavigationDestination(icon: const Icon(Icons.playlist_play), label: locals.videoQueue)
                  ]);
                }),
              ),
            )
          ]
        : [];
  }
}
