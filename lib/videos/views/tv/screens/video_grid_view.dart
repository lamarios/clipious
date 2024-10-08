import 'package:auto_route/annotations.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/utils/models/paginated_list.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:clipious/videos/views/tv/components/video_item.dart';

import '../../../../utils/states/item_list.dart';

@RoutePage()
class TvGridScreen extends StatelessWidget {
  final PaginatedList<Video> paginatedVideoList;
  final String? tags;
  final String title;

  const TvGridScreen(
      {super.key,
      required this.paginatedVideoList,
      this.tags,
      required this.title});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (BuildContext context) =>
          ItemListCubit(ItemListState(itemList: paginatedVideoList)),
      child: Scaffold(
        body: TvOverscan(
          child: BlocBuilder<ItemListCubit<Video>, ItemListState<Video>>(
              builder: (context, state) {
            var cubit = context.read<ItemListCubit<Video>>();
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: textTheme.titleLarge,
                    ),
                    state.loading
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                )),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                Expanded(
                    child: GridView.count(
                  controller: cubit.scrollController,
                  childAspectRatio: 16 / 13,
                  crossAxisCount: 3,
                  children: [
                    ...state.items.where((element) => !element.filterHide).map(
                        (e) => TvVideoItem(
                            key: ValueKey(e.videoId),
                            video: e,
                            autoFocus: false)),
                    if (state.loading)
                      ...repeatWidget(() => const TvVideoItemPlaceHolder(),
                          count: 10)
                  ],
                ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
