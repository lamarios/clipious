// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/views/video/innverView.dart';
import 'package:invidious/views/video/innverViewTablet.dart';
import 'package:logging/logging.dart';

import '../models/video.dart';
import '../utils.dart';
import 'video/addToPlayList.dart';

const double miniPlayerThreshold = 300;

class VideoView extends StatelessWidget {
  final String videoId;
  bool? playNow;

  VideoView({super.key, required this.videoId, this.playNow});

  popMiniPayer(BuildContext context, List<Video> videos) {
    showMiniPlayer(context, videos);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    bool show3Navigation = getDeviceType() == DeviceType.phone;

    var destinations = List.of(<Widget>[
      NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
      NavigationDestination(icon: const Icon(Icons.chat_bubble), label: locals.comments),
    ], growable: true);

    if (show3Navigation) {
      destinations.add(NavigationDestination(icon: const Icon(Icons.schema), label: locals.recommended));
    }

    return GetBuilder<VideoController>(
      init: VideoController(miniPlayerThreshold: miniPlayerThreshold, videoId: videoId, showMiniPlayer: (videos) => popMiniPayer(context, videos)),
      tag: 'video-controller-${videoId}',
      builder: (_) => AnimatedOpacity(
        duration: animationDuration,
        opacity: _.opacity,
        child: Transform.translate(
          offset: _.offset,
          child: Scaffold(
            appBar: AppBar(
              actions: _.loadingVideo
                  ? []
                  : [
                      Visibility(
                        visible: _.video != null,
                        child: IconButton(
                          onPressed: () => showSharingSheet(context, _.video!),
                          icon: const Icon(Icons.share),
                          color: colorScheme.secondary,
                        ),
                      ),
                      Visibility(
                        visible: _.isLoggedIn,
                        child: IconButton(
                          onPressed: () => AddToPlaylist.showDialog(context, _.video!.videoId),
                          icon: const Icon(Icons.add),
                          color: colorScheme.secondary,
                        ),
                      ),
                    ],
              scrolledUnderElevation: 0,
            ),
            backgroundColor: colorScheme.background,
            bottomNavigationBar: _.loadingVideo
                ? null
                : NavigationBar(
                    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                    elevation: 0,
                    onDestinationSelected: _.selectIndex,
                    selectedIndex: _.selectedIndex,
                    destinations: destinations,
                  ),
            body: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  color: colorScheme.background,
                  width: double.infinity,
                  height: double.infinity,
                  child: AnimatedSwitcher(
                      duration: animationDuration,
                      child: _.error.isNotEmpty
                          ? Container(
                              alignment: Alignment.center,
                              child: Text(_.error == coulnotLoadVideos ? locals.couldntLoadVideo : _.error),
                            )
                          : _.loadingVideo
                              ? const CircularProgressIndicator()
                              : Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: show3Navigation
                                      ? VideoInnerView(
                                          video: _.video!,
                                          selectedIndex: _.selectedIndex,
                                          playNow: playNow,
                                          onVideoDrag: _.videoDragged,
                                          onDragEnd: _.videoDraggedEnd,
                                        )
                                      : VideoTabletInnerView(
                                          video: _.video!,
                                          playNow: playNow,
                                          selectedIndex: _.selectedIndex,
                                          onDragEnd: _.videoDraggedEnd,
                                          onVideoDrag: _.videoDragged,
                                        ),
                                )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
