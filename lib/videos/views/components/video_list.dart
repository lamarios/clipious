import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/utils/states/item_list.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/utils/views/components/top_loading.dart';
import 'package:clipious/videos/models/base_video.dart';
import 'package:clipious/videos/models/video_in_list.dart';
import 'package:clipious/videos/views/components/video_in_list.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../downloads/models/downloaded_video.dart';
import '../../../utils/models/paginated_list.dart';

const smallVideoAspectRatio = 0.76;

class VideoList<T extends IdedVideo> extends StatelessWidget {
  final PaginatedList<T> paginatedVideoList;
  final String? tags;
  final bool animateDownload;
  final Axis scrollDirection;
  final bool small;
  final bool showMetrics;
  final bool allowModalSheet;
  final Function(BuildContext context, VideoInList video)? showVideoModalSheet;
  final Function(BuildContext context, VideoInList video)? openVideoOverride;

  const VideoList(
      {super.key,
      required this.paginatedVideoList,
      this.tags,
      this.animateDownload = false,
      this.scrollDirection = Axis.vertical,
      this.showMetrics = true,
      this.allowModalSheet = true,
      this.showVideoModalSheet,
      this.openVideoOverride,
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
      create: (context) =>
          ItemListCubit<T>(ItemListState<T>(itemList: paginatedVideoList)),
      child: BlocBuilder<ItemListCubit<T>, ItemListState<T>>(
        builder: (context, state) {
          var cubit = context.read<ItemListCubit<T>>();

          List<IdedVideo> items = state.items;
          if (items.isNotEmpty && items[0] is VideoInList) {
            items = filteredVideos<VideoInList>(state.items.cast());
          }

          var gridCount = small ? 1 : getGridCount(context);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              if (!small && state.loading) const TopListLoading(),
              state.error != ItemListErrors.none
                  ? Container(
                      alignment: Alignment.center,
                      color: colorScheme.surface,
                      child: InkWell(
                          onTap: () => cubit.getItems(),
                          child: Text(
                            locals.couldntFetchVideos,
                            style: small
                                ? textTheme.labelSmall
                                : textTheme.bodyMedium,
                          )),
                    )
                  : items.isEmpty && !state.loading
                      ? FilledButton.tonal(
                          onPressed: cubit.refreshItems,
                          child: Text(locals.refresh))
                      : Padding(
                          padding: EdgeInsets.only(top: small ? 0.0 : 4.0),
                          child: RefreshIndicator(
                            onRefresh: () async =>
                                !small && state.itemList.hasRefresh()
                                    ? await cubit.refreshItems()
                                    : Future.delayed(Duration.zero),
                            child: GridView.count(
                              crossAxisCount: gridCount,
                              controller: cubit.scrollController,
                              scrollDirection: scrollDirection,
                              crossAxisSpacing: small ? 8 : 5,
                              mainAxisSpacing: small ? 8 : 5,
                              childAspectRatio: small
                                  ? smallVideoAspectRatio
                                  : getGridAspectRatio(context),
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
                                    showMetrics: showMetrics,
                                    key: ValueKey(
                                        '${v.videoId}-${small.toString()}'),
                                    video: onlineVideo,
                                    offlineVideo: offlineVideo,
                                    animateDownload: animateDownload,
                                    showVideoModalSheet: showVideoModalSheet,
                                    allowModalSheet: allowModalSheet,
                                    openVideoOverride: openVideoOverride,
                                  );
                                }),
                                if (state.loading)
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
