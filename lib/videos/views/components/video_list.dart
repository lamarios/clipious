import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/components/video_in_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../utils/models/paginatedList.dart';

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
    return BlocProvider(
      create: (context) => ItemListCubit<VideoInList>(ItemListState<VideoInList>(itemList: paginatedVideoList)),
      child: BlocBuilder<ItemListCubit<VideoInList>, ItemListState<VideoInList>>(
        builder: (context, _) {
          var cubit = context.read<ItemListCubit<VideoInList>>();
          var items = filteredVideos<VideoInList>(_.items);
          var gridCount = getGridCount(context);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Visibility(visible: _.loading, child: const SizedBox(height: 1, child: LinearProgressIndicator())),
              _.error != ItemListErrors.none
                  ? Container(
                      alignment: Alignment.center,
                      color: colorScheme.background,
                      child: InkWell(onTap: () => cubit.getItems(), child: Text(locals.couldntFetchVideos)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmartRefresher(
                        controller: _.refreshController,
                        enablePullDown: _.itemList.hasRefresh(),
                        enablePullUp: false,
                        onRefresh: cubit.refreshItems,
                        child: GridView.count(
                          crossAxisCount: gridCount,
                          controller: _.scrollController,
                          padding: const EdgeInsets.all(4),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: getGridAspectRatio(context),
                          children: [
                            ...items.map((v) => VideoListItem(key: ValueKey(v.videoId), video: v, animateDownload: animateDownload)).toList(),
                            if (_.loading) ...videoPlaceholderList(count: 5 * gridCount)
                          ],
                        ),
                      ))
            ],
          );
        },
      ),
    );
  }
}
