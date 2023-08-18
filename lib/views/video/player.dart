import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoPlayerController.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';

import '../../controllers/miniPayerController.dart';
import '../../videos/models/video.dart';

class VideoPlayer extends StatefulWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;
  final bool? playNow;
  final bool? disableControls;
  final Duration? startAt;

  const VideoPlayer({super.key, this.video, required this.miniPlayer, this.playNow, this.disableControls, this.offlineVideo, this.startAt})
      : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  @override
  State<VideoPlayer> createState() => VideoPlayerState();
}

class VideoPlayerState extends State<VideoPlayer> {
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    Color overFlowTextColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
    var player = context.read<MiniPlayerCubit>();
    return BlocProvider(
      create: (context) => VideoPlayerCubit(
          VideoPlayerController(
              startAt: widget.startAt,
              overFlowTextColor: overFlowTextColor,
              colors: colorScheme,
              key: _betterPlayerKey,
              video: widget.video,
              offlineVideo: widget.offlineVideo,
              disableControls: widget.disableControls),
          player),
      child: BlocBuilder<VideoPlayerCubit, VideoPlayerController>(
        builder: (context, _) => BlocListener<MiniPlayerCubit, MiniPlayerController>(
          listenWhen: (previous, current) => previous.mediaCommand != current.mediaCommand && current.mediaCommand != null,
          listener: (context, state) => context.read<VideoPlayerCubit>().handleCommand(state.mediaCommand!),
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: _.videoController == null
                  ? const SizedBox.shrink()
                  : BetterPlayer(
                      controller: _.videoController!,
                      key: _betterPlayerKey,
                    )),
        ),
      ),
    );
  }
}
