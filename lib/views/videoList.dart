import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/videoList/singleVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../globals.dart';
import '../models/paginatedList.dart';

class VideoList extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final String? tags;

  const VideoList({
    super.key,
    required this.paginatedVideoList,
    this.tags,
  });

/*
  @override
  void initState() {
    super.initState();

    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      // getVideos();
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    return GetBuilder<VideoListController>(
      init: VideoListController(videoList: paginatedVideoList),
      global: tags != null,
      tag: tags,
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(visible: _.loading, child: const SizedBox(height: 1, child: LinearProgressIndicator())),
          Expanded(
            child: _.error != VideoListErrors.none
                ? Container(
                    alignment: Alignment.center,
                    color: colorScheme.background,
                    child: InkWell(onTap: () => _.getVideos(), child: Text(locals.couldntFetchVideos)),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      duration: animationDuration,
                      curve: Curves.easeInOutQuad,
                      child: Visibility(
                        visible: _.items.isNotEmpty,
                        child: SmartRefresher(
                          controller: _.refreshController,
                          enablePullDown: _.itemList.hasRefresh(),
                          enablePullUp: false,
                          onRefresh: _.refreshVideos,
                          child: GridView.count(
                              crossAxisCount: getGridCount(context),
                              controller: _.scrollController,
                              padding: const EdgeInsets.all(4),
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: getGridAspectRatio(context),
                              children: (_.items).map((v) => VideoListItem(key: ValueKey(v.videoId), video: v)).toList()),
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
