import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/player/states/video_player.dart';
import 'package:invidious/settings/states/settings.dart';

import '../../../videos/models/video.dart';
import '../../states/player.dart';

class VideoPlayer extends StatefulWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;
  final bool? playNow;
  final bool? disableControls;
  final Duration? startAt;

  const VideoPlayer(
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
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    Color overFlowTextColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;

    var player = context.read<PlayerCubit>();
    var settings = context.read<SettingsCubit>();

    return BlocProvider(
      create: (context) => VideoPlayerCubit(
          VideoPlayerState(
              startAt: widget.startAt,
              overFlowTextColor: overFlowTextColor,
              colors: colorScheme,
              key: _betterPlayerKey,
              video: widget.video,
              offlineVideo: widget.offlineVideo,
              disableControls: widget.disableControls),
          player,
          settings),
      child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
        builder: (context, _) => BlocListener<PlayerCubit, PlayerState>(
          listenWhen: (previous, current) =>
              previous.mediaCommand != current.mediaCommand &&
              current.mediaCommand != null,
          listener: (context, state) => context
              .read<VideoPlayerCubit>()
              .handleCommand(state.mediaCommand!),
          child: _.videoController == null
              ? const Text('nullll')
              : BetterPlayer(
                  controller: _.videoController!,
                  key: _betterPlayerKey,
                ),
        ),
      ),
    );
  }
}
