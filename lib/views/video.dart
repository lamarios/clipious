// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/db/progress.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video/comments.dart';
import 'package:invidious/views/video/info.dart';
import 'package:invidious/views/video/innverView.dart';
import 'package:invidious/views/video/innverViewTablet.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../models/sponsorSegment.dart';
import '../models/video.dart';
import '../utils.dart';
import 'video/addToPlayList.dart';

class VideoView extends StatefulWidget {
  final String videoId;

  const VideoView({super.key, required this.videoId});

  @override
  State<VideoView> createState() => VideoViewState();
}

class VideoViewState extends State<VideoView> with AfterLayoutMixin<VideoView>, RouteAware {
  Video? video;
  bool loadingVideo = true;

  int selectedIndex = 0;
  bool isLoggedIn = service.isLoggedIn();

  String error = '';

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    bool show3Navigation = getDeviceType() == DeviceType.phone;

    var destinations = List.of(<Widget>[
      const NavigationDestination(icon: Icon(Icons.info), label: 'Info'),
      const NavigationDestination(icon: Icon(Icons.chat_bubble), label: 'Comments'),
    ], growable: true);

    if (show3Navigation) {
      destinations.add(const NavigationDestination(icon: Icon(Icons.schema), label: 'Recommended'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          video?.title ?? '',
          // style: TextStyle(fontSize: 15),
        ),
        actions: loadingVideo
            ? []
            : [
                Visibility(
                  visible: video != null,
                  child: GestureDetector(
                    onTap: () => showSharingSheet(context, video!),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.share,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isLoggedIn,
                  child: GestureDetector(
                    onTap: () => AddToPlaylist.showDialog(context, video!.videoId),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ],
        scrolledUnderElevation: 0,
      ),
      backgroundColor: colorScheme.background,
      bottomNavigationBar: loadingVideo
          ? null
          : NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              elevation: 0,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedIndex: selectedIndex,
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
                child: error.isNotEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: Text(error),
                      )
                    : loadingVideo
                        ? const CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: show3Navigation
                                ? VideoInnerView(
                                    video: video!,
                                    selectedIndex: selectedIndex,
                                  )
                                : VideoTabletInnerView(video: video!, selectedIndex: selectedIndex),
                          )),
          ),
        ),
      ),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    try {
      Video video = await service.getVideo(widget.videoId);
      setState(() {
        this.video = video;
        loadingVideo = false;
      });
    } catch (err) {
      setState(() {
        if (err is InvidiousServiceError) {
          error = (err).message;
        } else {
          error = 'Couldn\'t load the video';
        }
        loadingVideo = false;
      });
      rethrow;
    }
  }
}
