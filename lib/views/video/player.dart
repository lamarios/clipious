import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:logging/logging.dart';

import '../../controllers/videoInListController.dart';
import '../../database.dart';
import '../../globals.dart';
import '../../main.dart';
import '../../models/db/progress.dart' as dbProgress;
import '../../models/pair.dart';
import '../../models/sponsorSegment.dart';
import '../../models/video.dart';

class VideoPlayer extends StatefulWidget {
  final Video video;
  final bool miniPlayer;
  bool? playNow;
  Function(BetterPlayerEvent event)? listener;

  VideoPlayer({super.key, required this.video, this.listener, required this.miniPlayer, this.playNow});

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
          listener: widget.listener, locals: locals, overFlowTextColor: overFlowTextColor, colors: colorScheme, key: _betterPlayerKey, miniPlayer: widget.miniPlayer, video: widget.video),
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
