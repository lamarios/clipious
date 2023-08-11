import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoPlayerController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../controllers/mediaKitController.dart';
import '../../models/video.dart' as videoModel;

class MediaKitPlayer extends StatefulWidget {
  final videoModel.Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;
  final bool? playNow;
  final bool? disableControls;
  final Duration? startAt;

  const MediaKitPlayer({super.key, this.video, required this.miniPlayer, this.playNow, this.disableControls, this.offlineVideo, this.startAt})
      : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  @override
  State<MediaKitPlayer> createState() => MediaKitPlayerState();
}

class MediaKitPlayerState extends State<MediaKitPlayer> {
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
    return GetBuilder<MediaKitPlayerController>(
      init: MediaKitPlayerController(
        startAt: widget.startAt,
        video: widget.video,
        offlineVideo: widget.offlineVideo,
      ),
      builder: (_) => AspectRatio(
          aspectRatio: 16 / 9,
          child: _.controller == null
              ? const SizedBox.shrink()
              : Video(
                  controller: _.controller!,
                  controls: (state) => Text('test'),
                )),
    );
  }
}
