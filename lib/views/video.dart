// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

class VideoView extends StatefulWidget {
  final String videoId;
  bool? playNow;

  VideoView({super.key, required this.videoId, this.playNow});

  @override
  State<VideoView> createState() => VideoViewState();
}

class VideoViewState extends State<VideoView> with AfterLayoutMixin<VideoView>, RouteAware {
  final log = Logger('Video');
  Video? video;
  bool loadingVideo = true;

  int selectedIndex = 0;
  bool isLoggedIn = service.isLoggedIn();

  Offset offset = Offset.zero;
  double opacity = 1;

  String error = '';

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VideoView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void videoDragged(DragUpdateDetails details) {
    double opacity = 1 - min(1, (details.localPosition.dy / miniPlayerThreshold));
    setState(() {
      offset = Offset(0, max(0, details.localPosition.dy));
      this.opacity = max(0, opacity);
    });
  }

  void videoDraggedEnd(DragEndDetails details) {
    if (offset.dy > miniPlayerThreshold) {
      showMiniPlayer(context, [video!]);
      Navigator.of(context).pop();
    } else {
      setState(() {
        offset = Offset.zero;
        opacity = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;

    bool show3Navigation = getDeviceType() == DeviceType.phone;

    var destinations = List.of(<Widget>[
      NavigationDestination(icon: Icon(Icons.info), label: locals.info),
      NavigationDestination(icon: Icon(Icons.chat_bubble), label: locals.comments),
    ], growable: true);

    if (show3Navigation) {
      destinations.add(NavigationDestination(icon: Icon(Icons.schema), label: locals.recommended));
    }

    return AnimatedOpacity(
      duration: animationDuration,
      opacity: opacity,
      child: Transform.translate(
        offset: offset,
        child: Scaffold(
          appBar: AppBar(

            actions: loadingVideo
                ? []
                : [
              Visibility(
                visible: video != null,
                child: IconButton(
                  onPressed: () => showSharingSheet(context, video!),
                  icon: Icon(Icons.share),
                  color: colorScheme.secondary,
                ),
              ),
              Visibility(
                visible: isLoggedIn,
                child: IconButton(
                  onPressed: () => AddToPlaylist.showDialog(context, video!.videoId),
                  icon: Icon(Icons.add),
                  color: colorScheme.secondary,
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
                        playNow: widget.playNow,
                        onVideoDrag: videoDragged,
                        onDragEnd: videoDraggedEnd,
                      )
                          : VideoTabletInnerView(video: video!, playNow: widget.playNow, selectedIndex: selectedIndex),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    var locals = AppLocalizations.of(context)!;
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
          error = locals.couldntLoadVideo;
        }
        loadingVideo = false;
      });
      rethrow;
    }
  }
}
