// import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/components/videoAddToPlaylistButton.dart';
import 'package:invidious/views/components/videoLikeButton.dart';
import 'package:invidious/views/components/videoShareButton.dart';
import 'package:invidious/views/video/innverView.dart';
import 'package:invidious/views/video/innverViewTablet.dart';

import '../utils.dart';

class VideoView extends StatelessWidget {
  final String videoId;
  bool? playNow;

  VideoView({super.key, required this.videoId, this.playNow});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    bool show3Navigation = getDeviceType() == DeviceType.phone;

    var destinations = List.of(<Widget>[
      NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
      NavigationDestination(
          icon: const Icon(Icons.chat_bubble), label: locals.comments),
    ], growable: true);

    if (show3Navigation) {
      destinations.add(NavigationDestination(
          icon: const Icon(Icons.schema), label: locals.recommended));
    }

    return GetBuilder<VideoController>(
      init: VideoController(videoId: videoId),
      global: false,
      // tag: 'video-controller-$videoId',
      builder: (_) => AnimatedOpacity(
        duration: animationDuration,
        opacity: _.opacity,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorScheme.background,
            actions: _.loadingVideo || _.video == null
                ? []
                : [
                    Visibility(
                      visible: _.video != null,
                      child: VideoShareButton(video: _.video!),
                    ),
                    VideoLikeButton(videoId: _.video?.videoId),
                    VideoAddToPlaylistButton(videoId: _.video?.videoId),
                  ],
            scrolledUnderElevation: 0,
          ),
          backgroundColor: colorScheme.background,
          bottomNavigationBar: _.loadingVideo
              ? null
              : NavigationBar(
                  backgroundColor: colorScheme.background,
                  labelBehavior:
                      NavigationDestinationLabelBehavior.onlyShowSelected,
                  elevation: 0,
                  onDestinationSelected: _.selectIndex,
                  selectedIndex: _.selectedIndex,
                  destinations: destinations,
                ),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: Container(
                color: colorScheme.background,
                width: double.infinity,
                height: double.infinity,
                child: AnimatedSwitcher(
                    duration: animationDuration,
                    child: _.error.isNotEmpty
                        ? Container(
                            alignment: Alignment.center,
                            child: Text(_.error == coulnotLoadVideos
                                ? locals.couldntLoadVideo
                                : _.error),
                          )
                        : _.loadingVideo
                            ? const CircularProgressIndicator()
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: show3Navigation
                                    ? VideoInnerView(
                                        video: _.video!,
                                        selectedIndex: _.selectedIndex,
                                        playNow: playNow,
                                        videoController: _,
                                      )
                                    : VideoTabletInnerView(
                                        video: _.video!,
                                        playNow: playNow,
                                        selectedIndex: _.selectedIndex,
                                        videoController: _,
                                      ),
                              )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
