import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

import '../../models/video.dart';

class VideoPlayer extends StatefulWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;
  final bool? playNow;
  final bool? disableControls;

  const VideoPlayer({super.key, this.video, required this.miniPlayer, this.playNow, this.disableControls, this.offlineVideo})
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

/*
  @override
  void didChangeDependencies() {
    disposeControllers();
    if (!widget.miniPlayer) {
      routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
    } else {
      playVideo();
    }
    super.didChangeDependencies();
  }
*/

/*
  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
*/

/*
  @override
  didUpdateWidget(VideoPlayer old) {
    super.didUpdateWidget(old);
    if (old.video.videoId != widget.video.videoId) {
      disposeControllers();
      playVideo();
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    Color overFlowTextColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
    return GetBuilder<PlayerController>(
      init: PlayerController(
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
              ? SizedBox.shrink()
              : BetterPlayer(
                  controller: _.videoController!,
                  key: _betterPlayerKey,
                )),
    );
  }
}
