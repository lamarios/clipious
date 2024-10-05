import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/utils/states/item_list.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/videos/views/tv/components/video_item.dart';

import '../../../../utils.dart';
import '../../../models/paginated_list.dart';

class TvHorizontalItemList<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final Widget Function() getPlaceholder;
  final String? tags;
  final Widget Function(BuildContext context, int index, T item) buildItem;

  const TvHorizontalItemList(
      {super.key,
      this.tags,
      required this.paginatedList,
      required this.buildItem,
      required this.getPlaceholder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ItemListCubit<T>(ItemListState<T>(itemList: paginatedList)),
      child: BlocBuilder<ItemListCubit<T>, ItemListState<T>>(
        builder: (context, state) {
          var cubit = context.read<ItemListCubit<T>>();
          // filter items if possible
          List<T> items = state.items;
          if (items.isNotEmpty && items[0] is Video) {
            items = filteredVideos(state.items.cast()).cast();
          }

          return Stack(
            children: [
              if (state.loading)
                const LinearProgressIndicator(
                  minHeight: 3,
                ),
              !state.loading && items.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: cubit.scrollController,
                        itemCount: items.length + (state.loading ? 10 : 0),
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
  final PaginatedList<Video> paginatedVideoList;
  final Function(BuildContext context, Video video)? onSelect;
  final String? tags;
  final int autoFocusedIndex;
  final void Function(Video video, int index, bool focus)? onItemFocus;

  const TvHorizontalVideoList(
      {super.key,
      this.tags,
      required this.paginatedVideoList,
      this.onSelect,
      this.autoFocusedIndex = 0,
      this.onItemFocus});

  @override
  Widget build(BuildContext context) {
    return TvHorizontalItemList<Video>(
      getPlaceholder: () => const TvVideoItemPlaceHolder(),
      paginatedList: paginatedVideoList,
      buildItem: (context, index, e) => TvVideoItem(
        key: ValueKey('video-item-${e.videoId}'),
        video: e,
        autoFocus: index == autoFocusedIndex,
        onSelect: onSelect,
        onFocusChange: onItemFocus != null
            ? (focus) => onItemFocus!(e, index, focus)
            : null,
      ),
    );
  }
}
