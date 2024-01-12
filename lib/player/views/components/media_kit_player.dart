import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/player/states/video_player.dart';
import 'package:invidious/player/views/components/player_controls.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:media_kit_video/media_kit_video.dart' as media_kit;

import '../../../videos/models/video.dart';
import '../../states/media_kit.dart';
import '../../states/player.dart';

class MediaKitPlayer extends StatefulWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;
  final bool? playNow;
  final bool? disableControls;
  final Duration? startAt;

  const MediaKitPlayer(
      {super.key,
      this.video,
      required this.miniPlayer,
      this.playNow,
      this.disableControls,
      this.offlineVideo,
      this.startAt})
      : assert(video == null || offlineVideo == null,
            'cannot provide both video and offline video\n');

  @override
  State<MediaKitPlayer> createState() => _MediaKitPlayerState();
}

class _MediaKitPlayerState extends State<MediaKitPlayer> {
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color overFlowTextColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;

    var player = context.read<PlayerCubit>();
    var settings = context.read<SettingsCubit>();

    return BlocProvider(
      create: (context) => MediaKitCubit(
          MediaKitState(
              startAt: widget.startAt,
              video: widget.video,
              offlineVideo: widget.offlineVideo,
              disableControls: widget.disableControls),
          player),
      child: BlocBuilder<MediaKitCubit, MediaKitState>(
        builder: (context, _) {
          var controller = context.read<MediaKitCubit>().controller;
          return BlocListener<PlayerCubit, PlayerState>(
            listenWhen: (previous, current) =>
                previous.mediaCommand != current.mediaCommand &&
                current.mediaCommand != null,
            listener: (context, state) => context
                .read<MediaKitCubit>()
                .handleCommand(state.mediaCommand!),
            child: media_kit.Video(
              controller: controller,
              aspectRatio: 16 / 9,
              controls: (state) => const PlayerControls(),
            ),
          );
        },
      ),
    );
  }
}
