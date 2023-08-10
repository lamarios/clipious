import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/placeholders.dart';
import 'package:invidious/views/videoList/singleVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../globals.dart';
import '../models/paginatedList.dart';

class VideoList extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final String? tags;
  final bool animateDownload;

  const VideoList({super.key, required this.paginatedVideoList, this.tags, this.animateDownload = false});

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
      builder: (_) {
        var items = _.filteredItems;
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Visibility(visible: _.loading, child: const SizedBox(height: 1, child: LinearProgressIndicator())),
            _.error != ItemListErrors.none
                ? Container(
                    alignment: Alignment.center,
                    color: colorScheme.background,
                    child: InkWell(onTap: () => _.getItems(), child: Text(locals.couldntFetchVideos)),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmartRefresher(
                      controller: _.refreshController,
                      enablePullDown: _.itemList.hasRefresh(),
                      enablePullUp: false,
                      onRefresh: _.refreshItems,
                      child: GridView.count(
                          crossAxisCount: getGridCount(context),
                          controller: _.scrollController,
                          padding: const EdgeInsets.all(4),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: getGridAspectRatio(context),
                          children: _.loading && _.items.isEmpty
                              ? videoPlaceholderList
                              : _.items.isEmpty
                                  ? []
                                  : items.map((v) => FadeIn(child: VideoListItem(key: ValueKey(v.videoId), video: v, animateDownload: animateDownload))).toList()),
                    ),
                  )
          ],
        );
      },
    );
  }
}
