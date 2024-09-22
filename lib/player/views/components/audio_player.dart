import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/player/views/components/player_controls.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/videos/views/components/offline_video_thumbnail.dart';

import '../../../downloads/models/downloaded_video.dart';
import '../../../videos/models/video.dart';
import '../../../videos/views/components/video_thumbnail.dart';
import '../../states/audio_player.dart';
import '../../states/player.dart';

class AudioPlayer extends StatelessWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;

  const AudioPlayer(
      {super.key, this.video, required this.miniPlayer, this.offlineVideo})
      : assert(video == null || offlineVideo == null,
            'cannot provide both video and offline video\n');

  @override
  Widget build(BuildContext context) {
    var player = context.read<PlayerCubit>();
    var settings = context.read<SettingsCubit>();

    return BlocProvider(
      create: (context) => AudioPlayerCubit(
          AudioPlayerState(offlineVideo: offlineVideo, video: video),
          player,
          settings),
      child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        builder: (context, playerState) =>
            BlocListener<PlayerCubit, PlayerState>(
          listenWhen: (previous, current) =>
              previous.mediaCommand != current.mediaCommand &&
              current.mediaCommand != null,
          listener: (context, state) => context
              .read<AudioPlayerCubit>()
              .handleCommand(state.mediaCommand!),
          child: Padding(
            padding: EdgeInsets.all(miniPlayer ? 8 : 0.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                playerState.video != null
                    ? VideoThumbnailView(
                        decoration: const BoxDecoration(),
                        videoId: playerState.video!.videoId,
                        thumbnailUrl: playerState.video?.deArrowThumbnailUrl ??
                            playerState.video?.getBestThumbnail()?.url ??
                            '',
                      )
                    : playerState.offlineVideo != null
                        ? OfflineVideoThumbnail(
                            borderRadius: 0,
                            key: ValueKey(
                                playerState.offlineVideo?.videoId ?? ''),
                            video: playerState.offlineVideo!)
                        : const SizedBox.shrink(),
                PlayerControls(
                    mediaPlayerCubit: context.read<AudioPlayerCubit>())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
