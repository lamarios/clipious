import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoPlayerController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

import '../../models/video.dart';

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
    return GetBuilder<VideoPlayerController>(
      init: VideoPlayerController(
          startAt: widget.startAt,
          locals: locals,
          overFlowTextColor: overFlowTextColor,
          colors: colorScheme,
          key: _betterPlayerKey,
          miniPlayer: widget.miniPlayer,
          video: widget.video,
          offlineVideo: widget.offlineVideo,
          disableControls: widget.disableControls),
      builder: (_) => AspectRatio(
          aspectRatio: 16 / 9,
          child: _.videoController == null
              ? const SizedBox.shrink()
              : BetterPlayer(
                  controller: _.videoController!,
                  key: _betterPlayerKey,
                )),
    );
  }
}
