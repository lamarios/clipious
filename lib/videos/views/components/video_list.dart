import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/utils/views/components/top_loading.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/components/video_in_list.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../downloads/models/downloaded_video.dart';
import '../../../utils/models/paginatedList.dart';

const smallVideoAspectRatio = 0.76;

class VideoList<T extends IdedVideo> extends StatelessWidget {
  final PaginatedList<T> paginatedVideoList;
  final String? tags;
  final bool animateDownload;
  final Axis scrollDirection;
  final bool small;

  const VideoList(
      {super.key,
      required this.paginatedVideoList,
      this.tags,
      this.animateDownload = false,
      this.scrollDirection = Axis.vertical,
      this.small = false});

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
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => ItemListCubit<T>(ItemListState<T>(itemList: paginatedVideoList)),
      child: BlocBuilder<ItemListCubit<T>, ItemListState<T>>(
        builder: (context, _) {
          var cubit = context.read<ItemListCubit<T>>();

          List<IdedVideo> items = _.items;
          if (items.isNotEmpty && items[0] is VideoInList) {
            items = filteredVideos<VideoInList>(_.items.cast());
          }

          var gridCount = small ? 1 : getGridCount(context);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              if (!small && _.loading) const TopListLoading(),
              _.error != ItemListErrors.none
                  ? Container(
                      alignment: Alignment.center,
                      color: colorScheme.background,
                      child: InkWell(
                          onTap: () => cubit.getItems(),
                          child: Text(
                            locals.couldntFetchVideos,
                            style: small ? textTheme.labelSmall : textTheme.bodyMedium,
                          )),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: small ? 0.0 : 4.0),
                      child: RefreshIndicator(
                        onRefresh: () async => !small && _.itemList.hasRefresh()
                            ? await cubit.refreshItems()
                            : Future.delayed(Duration.zero),
                        child: GridView.count(
                          crossAxisCount: gridCount,
                          controller: cubit.scrollController,
                          scrollDirection: scrollDirection,
                          crossAxisSpacing: small ? 8 : 5,
                          mainAxisSpacing: small ? 8 : 5,
                          childAspectRatio: small ? smallVideoAspectRatio : getGridAspectRatio(context),
                          children: [
                            ...items.map((v) {
                              VideoInList? onlineVideo;
                              DownloadedVideo? offlineVideo;

                              if (v is VideoInList) {
                                onlineVideo = v;
                              }

                              if (v is DownloadedVideo) {
                                offlineVideo = v;
                              }

                              return VideoListItem(
                                small: small,
                                key: ValueKey('${v.videoId}-${small.toString()}'),
                                video: onlineVideo,
                                offlineVideo: offlineVideo,
                                animateDownload: animateDownload,
                              );
                            }).toList(),
                            if (_.loading)
                              ...repeatWidget(
                                  () => VideoListItemPlaceHolder(
                                        small: small,
                                      ),
                                  count: 5 * gridCount)
                          ],
                        ),
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
