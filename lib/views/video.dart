// import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/components/videoAddToPlaylistButton.dart';
import 'package:invidious/views/components/videoLikeButton.dart';
import 'package:invidious/views/components/videoShareButton.dart';
import 'package:invidious/views/video/downloadModalSheet.dart';
import 'package:invidious/views/video/innverView.dart';
import 'package:invidious/views/video/innverViewTablet.dart';

import '../main.dart';
import '../myRouteObserver.dart';
import '../utils.dart';
import 'downloadManager.dart';

class VideoRouteArguments {
  final String videoId;
  bool? playNow;

  VideoRouteArguments({required this.videoId, this.playNow});
}

class VideoView extends StatelessWidget {
  final String videoId;
  bool? playNow;

  VideoView({super.key, required this.videoId, this.playNow});

  void downloadVideo(BuildContext context, VideoController _) {
    if (_.video != null) {
      DownloadModalSheet.showVideoModalSheet(context, _.video!, animateDownload: false, onDownloadStarted: (isDownloadStarted) {
        if (isDownloadStarted) {
          _.initStreamListener();
        }
      }, onDownload: _.onDownload);
    }
  }

  void openDownloadManager(VideoController _) {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_DOWNLOAD_MANAGER, builder: (context) => const DownloadManager())).then((value) => _.getDownloadStatus());
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
                    AnimatedSwitcher(
                        duration: animationDuration,
                        child: _.downloading
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: colorScheme.background,
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        value: _.downloadProgress == 0 ? null : _.downloadProgress,
                                        strokeWidth: 2,
                                      ))
                                ],
                              )
                            : Stack(
                                children: [
                                  IconButton(
                                      onPressed: _.isDownloaded || _.downloadFailed ? () => openDownloadManager(_) : () => downloadVideo(context, _),
                                      icon: _.isDownloaded && !_.downloadFailed ? const Icon(Icons.download_done) : const Icon(Icons.download)),
                                  Positioned(
                                      right: 5,
                                      top: 5,
                                      child: _.downloadFailed
                                          ? const Icon(
                                              Icons.error,
                                              size: 15,
                                              color: Colors.red,
                                            )
                                          : const SizedBox.shrink())
                                ],
                              )),
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
                  labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
