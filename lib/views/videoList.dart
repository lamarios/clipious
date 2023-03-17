import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/videoList/singleVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../globals.dart';
import '../models/videoInList.dart';
import '../models/videoListAbstractClass.dart';

class VideoList extends StatefulWidget {
  final PaginatedVideoList paginatedVideoList;
  final String? tags;

  const VideoList({
    super.key,
    required this.paginatedVideoList,
    this.tags,
  });

  @override
  VideoListState createState() => VideoListState();
}

class VideoListState extends State<VideoList> {
  @override
  void initState() {
    super.initState();

    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      // getVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    return GetBuilder<VideoListController>(
      init: VideoListController(widget.paginatedVideoList),
      tag: widget.tags,
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(visible: controller.loading, child: const SizedBox(height: 1, child: LinearProgressIndicator())),
          Expanded(
            child: controller.error != VideoListErrors.none
                ? Container(
                    alignment: Alignment.center,
                    color: colorScheme.background,
                    child: InkWell(onTap: () => controller.getVideos(), child: Text(locals.couldntFetchVideos)),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      duration: animationDuration,
                      curve: Curves.easeInOutQuad,
                      child: Visibility(
                        visible: controller.videos.isNotEmpty,
                        child: SmartRefresher(
                          controller: controller.refreshController,
                          enablePullDown: controller.videoList.hasRefresh(),
                          enablePullUp: false,
                          onRefresh: controller.refreshVideos,
                          child: GridView.count(
                              crossAxisCount: getGridCount(context),
                              controller: controller.scrollController,
                              padding: const EdgeInsets.all(4),
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: getGridAspectRatio(context),
                              children: (controller.videos).map((v) => VideoListItem(key: ValueKey(v.videoId), video: v)).toList()),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
