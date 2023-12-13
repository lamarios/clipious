import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:invidious/videos/views/tv/components/video_item.dart';

import '../../../../utils.dart';
import '../../../../videos/models/video_in_list.dart';
import '../../../models/paginatedList.dart';

class TvHorizontalItemList<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final Widget Function() getPlaceholder;
  final String? tags;
  final Widget Function(BuildContext context, int index, T item) buildItem;

  const TvHorizontalItemList(
      {super.key, this.tags, required this.paginatedList, required this.buildItem, required this.getPlaceholder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemListCubit<T>(ItemListState<T>(itemList: paginatedList)),
      child: BlocBuilder<ItemListCubit<T>, ItemListState<T>>(
        builder: (context, _) {
          var cubit = context.read<ItemListCubit<T>>();
          // filter items if possible
          List<T> items = _.items;
          if (items.isNotEmpty && items[0] is BaseVideo) {
            items = filteredVideos<BaseVideo>(_.items.cast()).cast();
          }

          return Stack(
          children: [
            if (_.loading)
              const LinearProgressIndicator(
                minHeight: 3,
              ),
            !_.loading && items.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: cubit.scrollController,
                      itemCount: items.length + (_.loading ? 10 : 0),
                      itemBuilder: (context, index) {
                        if (index >= items.length) {
                          return getPlaceholder();
                        }
                        T e = items[index];
                        return buildItem(context, index, e);
                      },
                    ),
                  ),
          ],
        );
        },
      ),
    );
  }
}

class TvHorizontalVideoList extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final Function(BuildContext context, VideoInList video)? onSelect;
  final String? tags;
  final int autoFocusedIndex;
  final void Function(VideoInList video, int index, bool focus)? onItemFocus;

  const TvHorizontalVideoList(
      {Key? key,
      this.tags,
      required this.paginatedVideoList,
      this.onSelect,
      this.autoFocusedIndex = 0,
      this.onItemFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TvHorizontalItemList<VideoInList>(
      getPlaceholder: () => const TvVideoItemPlaceHolder(),
      paginatedList: paginatedVideoList,
      buildItem: (context, index, e) => TvVideoItem(
        key: ValueKey('video-item-${e.videoId}'),
        video: e,
        autoFocus: index == autoFocusedIndex,
        onSelect: onSelect,
        onFocusChange: onItemFocus != null ? (focus) => onItemFocus!(e, index, focus) : null,
      ),
    );
  }
}
