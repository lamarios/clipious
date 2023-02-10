import 'dart:async';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/video.dart';

import 'package:after_layout/after_layout.dart';
import 'package:invidious/views/videoList/singleVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../globals.dart';
import '../models/videoInList.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class VideoList extends StatefulWidget {
  Function? getVideos;
  List<VideoInList>? videos;

  VideoList({super.key, this.getVideos, this.videos});

  @override
  VideoListState createState() => VideoListState();
}

class VideoListState extends State<VideoList> with AfterLayoutMixin<VideoList> {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  List<VideoInList> videos = [];
  bool loading = true;
  bool hasMethod = false;
  Map<String, Image> imageCache = {};
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScrollEvent);

    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      getVideos(null);
    });
  }

  @override
  dispose() {
    super.dispose();
    scrollController.dispose();
  }

  onScrollEvent() {
    if (scrollController.hasClients) {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        print('reached end');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: loading, child: const LinearProgressIndicator()),
        Expanded(
          child: loading
              ? Container(color: colorScheme.background)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeIn(
                    duration: animationDuration,
                    curve: Curves.easeInOutQuad,
                    child: Visibility(
                      visible: widget.videos?.isNotEmpty ?? videos.isNotEmpty,
                      child: SmartRefresher(
                        controller: refreshController,
                        enablePullDown: true,
                        enablePullUp: false,
                        onRefresh: () => getVideos(context),
                        child: GridView.count(
                            crossAxisCount: 1,
                            controller: scrollController,
                            padding: EdgeInsets.all(4),
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 16 / 13,
                            children: (widget.videos ?? videos).map((v) => VideoListItem(video: v)).toList()),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  getVideos(BuildContext? context) {
    if (widget.getVideos != null) {
      widget.getVideos!().then((List<VideoInList> videos) {
/*
        if (context != null) {
          for (var v in videos) {
            precacheImage(NetworkImage(v.getBestThumbnail()?.url ?? ''), context);
          }
        }
*/

        setState(() {
          hasMethod = true;
          this.videos = videos;
          loading = false;
        });
        refreshController.refreshCompleted();
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.getVideos != null) {
      getVideos(context);
    } else if (widget.videos != null) {
      setState(() {
        loading = false;
      });
    }
  }
}
