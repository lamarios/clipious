import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/player/states/interfaces/media_player.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/player/views/components/video_queue.dart';

import '../../../comments/views/components/comments_container.dart';
import '../../../downloads/models/downloaded_video.dart';
import '../../../settings/states/settings.dart';
import '../../../videos/models/video.dart';
import '../../../videos/views/components/info.dart';
import '../../../videos/views/components/recommended_videos.dart';
import 'mini_player_controls.dart';

class ExpandedPlayer extends StatelessWidget {
  const ExpandedPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    var player = context.read<PlayerCubit>();
    var controller = player.state;

    Video? video = controller.currentlyPlaying;
    DownloadedVideo? offlineVid = controller.offlineCurrentlyPlaying;
    var settings = context.watch<SettingsCubit>().state;

    bool isFullScreen =
        controller.fullScreenState == FullScreenState.fullScreen;
    bool distractionFree = settings.distractionFreeMode;

    return !isFullScreen &&
            !controller.isMini &&
            (video != null || offlineVid != null)
        ? Column(children: [
            MiniPlayerControls(
              videoId: video?.videoId ?? offlineVid?.videoId ?? '',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: innerHorizontalPadding),
                child: Builder(builder: (context) {
                  var selectedIndex = context.select((PlayerCubit value) =>
                      value.state.selectedFullScreenIndex);
                  return video != null
                      ? <Widget>[
                          SingleChildScrollView(
                            child: VideoInfo(
                              video: video,
                            ),
                          ),
                          if (!distractionFree)
                            SingleChildScrollView(
                              child: CommentsContainer(
                                video: video,
                                key: ValueKey('comms-${video.videoId}'),
                              ),
                            ),
                          if (!distractionFree)
                            SingleChildScrollView(
                                child: RecommendedVideos(video: video)),
                          const VideoQueue(),
                        ][selectedIndex]
                      : const VideoQueue();
                }),
              ),
            ),
            Builder(builder: (context) {
              var selectedIndex = context.select(
                  (PlayerCubit value) => value.state.selectedFullScreenIndex);
              return ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.65,
                  child: NavigationBar(
                      selectedIndex: selectedIndex,
                      onDestinationSelected: player.selectTab,
                      destinations: [
                        NavigationDestination(
                            icon: const Icon(Icons.info), label: locals.info),
                        if (!distractionFree)
                          NavigationDestination(
                              icon: const Icon(Icons.chat_bubble),
                              label: locals.comments),
                        if (!distractionFree)
                          NavigationDestination(
                              icon: const Icon(Icons.schema),
                              label: locals.recommended),
                        NavigationDestination(
                            icon: const Icon(Icons.playlist_play),
                            label: locals.videoQueue)
                      ]),
                ),
              );
            })
          ])
        : const SizedBox.shrink();
  }
}
