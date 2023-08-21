import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/videos/views/tv/components/video_item.dart';

import '../../../../videos/models/video_in_list.dart';
import '../../../models/paginatedList.dart';

class TvHorizontalItemList<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final Widget Function() getPlaceholder;
  final String? tags;
  final Widget Function(BuildContext context, int index, T item) buildItem;

  const TvHorizontalItemList({Key? key, this.tags, required this.paginatedList, required this.buildItem, required this.getPlaceholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemListCubit<T>(ItemListState<T>(itemList: paginatedList)),
      child: BlocBuilder<ItemListCubit<T>, ItemListState<T>>(
        builder: (context, _) => Stack(
          children: [
            if (_.loading)
              const LinearProgressIndicator(
                minHeight: 3,
              ),
            !_.loading && _.items.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _.scrollController,
                      itemCount: _.items.length + (_.loading ? 10 : 0),
                      itemBuilder: (context, index) {
                        if (index >= _.items.length) {
                          return getPlaceholder();
                        }
                        T e = _.items[index];
                        return buildItem(context, index, e);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class TvHorizontalVideoList extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final Function(BuildContext context, VideoInList video)? onSelect;
  final String? tags;
  final int autoFocusedIndex;

  const TvHorizontalVideoList({Key? key, this.tags, required this.paginatedVideoList, this.onSelect, this.autoFocusedIndex = 0}) : super(key: key);

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
      ),
    );
  }
}
