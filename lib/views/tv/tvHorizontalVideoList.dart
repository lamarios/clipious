import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/views/components/placeholders.dart';
import 'package:invidious/views/tv/tvVideoItem.dart';

import '../../models/paginatedList.dart';
import '../../models/videoInList.dart';

class TvHorizontalItemList<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final Widget Function() getPlaceholder;
  final String? tags;
  final Widget Function(BuildContext context, int index, T item) buildItem;

  const TvHorizontalItemList({Key? key, this.tags, required this.paginatedList, required this.buildItem, required this.getPlaceholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemListController<T>>(
      global: tags != null,
      tag: tags,
      init: ItemListController(itemList: paginatedList),
      builder: (_) => Stack(
        children: [
          if (_.loading)
            const LinearProgressIndicator(
              minHeight: 3,
            ),
          !_.loading && _.items.isEmpty
              ? SizedBox.shrink()
              : SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _.scrollController,
                    itemCount: _.items.length + (_.loading ? 10 : 0),
                    itemBuilder: (context, index) {
                      if (index >= _.items.length) {
                        print('GETTING PLACE Oodsfsd');
                        return getPlaceholder();
                      }
                      T e = _.items[index];
                      return buildItem(context, index, e);
                    },
                  ),
                ),
        ],
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
