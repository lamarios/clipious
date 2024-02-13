import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:invidious/player/states/player.dart';
import '../../../downloads/models/downloaded_video.dart';
import '../../../videos/models/video.dart';
import '../../../videos/views/components/info.dart';
import '../components/mini_player_controls.dart';

class TabletExpandedPlayer extends StatelessWidget {
  const TabletExpandedPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    var player = context.read<PlayerCubit>();
    var controller = player.state;

    Video? video = controller.currentlyPlaying;
    DownloadedVideo? offlineVid = controller.offlineCurrentlyPlaying;

    bool isFullScreen =
        controller.fullScreenState == FullScreenState.fullScreen;

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
                  return video != null
                      ? SingleChildScrollView(
                          child: VideoInfo(
                            video: video,
                            descriptionAndTags: false,
                          ),
                        )
                      : const SizedBox.shrink();
                }),
              ),
            )
          ])
        : const SizedBox.shrink();
  }
}
