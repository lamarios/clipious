import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/videos/views/components/offline_video_thumbnail.dart';
import 'package:invidious/views/videoPlayer/playerControls.dart';

import '../../controllers/audioPlayerController.dart';
import '../../controllers/miniPayerController.dart';
import '../../downloads/models/downloaded_video.dart';
import '../../videos/models/video.dart';
import '../../videos/views/components/video_thumbnail.dart';

class AudioPlayer extends StatelessWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;

  const AudioPlayer({super.key, this.video, required this.miniPlayer, this.offlineVideo}) : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  @override
  Widget build(BuildContext context) {
    var player = context.read<MiniPlayerCubit>();

    return BlocProvider(
      create: (context) => AudioPlayerCubit(AudioPlayerController(offlineVideo: offlineVideo, video: video), player),
      child: BlocBuilder<AudioPlayerCubit, AudioPlayerController>(
        builder: (context, _) => BlocListener<MiniPlayerCubit, MiniPlayerController>(
          listenWhen: (previous, current) => previous.mediaCommand != current.mediaCommand && current.mediaCommand != null,
          listener: (context, state) => context.read<AudioPlayerCubit>().handleCommand(state.mediaCommand!),
          child: Padding(
            padding: EdgeInsets.all(miniPlayer ? 8 : 0.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  _.video != null
                      ? VideoThumbnailView(
                          decoration: const BoxDecoration(),
                          videoId: _.video!.videoId,
                          thumbnailUrl: _.video?.getBestThumbnail()?.url ?? '',
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
      ),
    );
  }
}
