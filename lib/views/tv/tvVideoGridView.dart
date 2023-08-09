import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvVideoItem.dart';

import '../../controllers/videoListController.dart';
import '../../models/videoInList.dart';

class TvGridView extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final String? tags;
  final String title;

  const TvGridView({Key? key, required this.paginatedVideoList, this.tags, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: GetBuilder<VideoListController>(
            global: tags != null,
            tag: tags,
            init: VideoListController(videoList: paginatedVideoList),
            builder: (_) {
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
                    children: _.items.map((e) => TvVideoItem(video: e, autoFocus: false)).toList(),
                  ))
                ],
              );
            }),
      ),
    );
  }
}
