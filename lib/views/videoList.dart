import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/videoList/singleVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../globals.dart';
import '../models/videoInList.dart';

class VideoList extends StatefulWidget {
  Future<List<VideoInList>> Function()? getVideos;
  Future<List<VideoInList>> Function()? getMoreVideos;
  Future<List<VideoInList>> Function()? refresh;
  List<VideoInList>? videos;

  VideoList({super.key, this.getVideos, this.videos, this.getMoreVideos, this.refresh});

  @override
  VideoListState createState() => VideoListState();
}

class VideoListState extends State<VideoList> with AfterLayoutMixin<VideoList> {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  List<VideoInList> videos = [];
  bool loading = true;
  Map<String, Image> imageCache = {};
  ScrollController scrollController = ScrollController();
  String error = '';

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScrollEvent);

    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      getVideos();
    });
  }

  @override
  dispose() {
    super.dispose();
    scrollController.dispose();
    refreshController.dispose();
  }

  onScrollEvent() {
    if (widget.getMoreVideos != null) {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent == scrollController.offset) {
          getMoreVideos();
        }
      }
    }
  }

  getMoreVideos() async {
    if (widget.getMoreVideos != null) {
      loadVideo(() async {
        List<VideoInList> videos = await widget.getMoreVideos!();
        List<VideoInList> currentVideos = this.videos;
        currentVideos.addAll(videos);
        return currentVideos;
      });
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
          child: error.isNotEmpty
              ? Container(
                  alignment: Alignment.center,
                  color: colorScheme.background,
                  child: Visibility(visible: error.isNotEmpty, child: GestureDetector(onTap: () => getVideos(), child: Text(error))),
                )
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
                        onRefresh: () => widget.refresh != null ? refreshVideos() : getVideos(),
                        child: GridView.count(
                            crossAxisCount: getGridCount(context),
                            controller: scrollController,
                            padding: const EdgeInsets.all(4),
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: getGridAspectRatio(context),
                            children: (widget.videos ?? videos).map((v) => VideoListItem(key: ValueKey(v.videoId), video: v)).toList()),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  refreshVideos() async {
    if (widget.refresh != null) {
      loadVideo(() => widget.refresh!());
    } else {
      loadVideo(() => widget.getVideos!());
    }
  }

  getVideos() async {
    loadVideo(() => widget.getVideos!());
  }

  loadVideo(Future<List<VideoInList>> Function() refreshFunction) async {
    if (widget.getVideos != null) {
      setState(() {
        error = '';
        loading = true;
      });
      try {
        var videos = await refreshFunction();
        setState(() {
          this.videos = videos;
          loading = false;
        });
      } catch (err) {
        setState(() {
          this.videos = [];
          loading = false;
          error = 'Couldn\'t fetch videos, tap to try again';
        });
      }
      refreshController.refreshCompleted();
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.getVideos != null) {
      getVideos();
    } else if (widget.videos != null) {
      setState(() {
        loading = false;
      });
    }
  }
}
