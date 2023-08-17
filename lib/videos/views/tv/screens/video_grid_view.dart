import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/videos/views/tv/components/video_item.dart';

import '../../../../utils/states/item_list.dart';
import '../../../models/video_in_list.dart';

class TvGridView extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final String? tags;
  final String title;

  const TvGridView({Key? key, required this.paginatedVideoList, this.tags, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (BuildContext context) => ItemListCubit(ItemListState(itemList: paginatedVideoList)),
      child: Scaffold(
        body: TvOverscan(
          child: BlocBuilder<ItemListCubit<VideoInList>, ItemListState<VideoInList>>(builder: (context, _) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: textTheme.titleLarge,
                    ),
                    _.loading
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
                  controller: _.scrollController,
                  childAspectRatio: 16 / 13,
                  crossAxisCount: 3,
                  children: [..._.items.map((e) => TvVideoItem(video: e, autoFocus: false)).toList(), if (_.loading) ...repeatWidget(() => const TvVideoItemPlaceHolder(), count: 10)],
                ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
