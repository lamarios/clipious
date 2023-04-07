import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/tv/tvVideoItem.dart';
import 'package:invidious/views/tv/tvVideoView.dart';

import '../../models/paginatedList.dart';
import '../../models/videoInList.dart';

class TvHorizontalVideoList extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final String? tags;

  const TvHorizontalVideoList({Key? key, this.tags, required this.paginatedVideoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return GetBuilder<VideoListController>(
      global: tags != null,
      tag: tags,
      init: VideoListController(paginatedVideoList),
      builder: (_) => Stack(
        children: [
          _.loading
              ? const LinearProgressIndicator(
                  minHeight: 3,
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _.scrollController,
              itemCount: _.videos.length,
              itemBuilder: (context, index) {
                VideoInList e = _.videos[index];
                return TvVideoItem(video: e, autoFocus: index == 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
