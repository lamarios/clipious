import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/utils/models/paginated_list.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/videos/views/tv/components/video_item.dart';

import '../../../../utils/states/item_list.dart';
import '../../../models/video_in_list.dart';

@RoutePage()
class TvGridScreen extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
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
          child: BlocBuilder<ItemListCubit<VideoInList>,
              ItemListState<VideoInList>>(builder: (context, state) {
            var cubit = context.read<ItemListCubit<VideoInList>>();
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
