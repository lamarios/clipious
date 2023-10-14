import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/player/views/components/player_controls.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/videos/views/components/offline_video_thumbnail.dart';

import '../../../downloads/models/downloaded_video.dart';
import '../../../videos/models/video.dart';
import '../../../videos/views/components/video_thumbnail.dart';
import '../../states/audio_player.dart';
import '../../states/player.dart';

class AudioPlayer extends StatelessWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;

  const AudioPlayer({super.key, this.video, required this.miniPlayer, this.offlineVideo}) : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  @override
  Widget build(BuildContext context) {
    var player = context.read<PlayerCubit>();
    var settings = context.read<SettingsCubit>();

    return BlocProvider(
      create: (context) => AudioPlayerCubit(AudioPlayerState(offlineVideo: offlineVideo, video: video), player, settings),
      child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        builder: (context, _) => BlocListener<PlayerCubit, PlayerState>(
          listenWhen: (previous, current) => previous.mediaCommand != current.mediaCommand && current.mediaCommand != null,
          listener: (context, state) => context.read<AudioPlayerCubit>().handleCommand(state.mediaCommand!),
          child: Padding(
            padding: EdgeInsets.all(miniPlayer ? 8 : 0.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                _.video != null
                    ? VideoThumbnailView(
                        decoration: const BoxDecoration(),
                        videoId: _.video!.videoId,
                        thumbnailUrl: _.video?.deArrowThumbnailUrl ?? _.video?.getBestThumbnail()?.url ?? '',
                      )
                    : _.offlineVideo != null
                        ? OfflineVideoThumbnail(borderRadius: 0, key: ValueKey(_.offlineVideo?.videoId ?? ''), video: _.offlineVideo!)
                        : const SizedBox.shrink(),
                PlayerControls(mediaPlayerCubit: context.read<AudioPlayerCubit>())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
