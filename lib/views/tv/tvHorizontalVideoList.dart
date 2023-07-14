import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/views/tv/tvVideoItem.dart';

import '../../models/paginatedList.dart';
import '../../models/videoInList.dart';

class TvHorizontalVideoList extends StatelessWidget {
  final PaginatedList<VideoInList> paginatedVideoList;
  final Function(BuildContext context, VideoInList video)? onSelect;
  final String? tags;

  const TvHorizontalVideoList({Key? key, this.tags, required this.paginatedVideoList, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<VideoListController>(
      global: tags != null,
      tag: tags,
      init: VideoListController(videoList: paginatedVideoList),
      builder: (_) => Stack(
        children: [
          _.loading
              ? const LinearProgressIndicator(
                  minHeight: 3,
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _.scrollController,
              itemCount: _.videos.length,
              itemBuilder: (context, index) {
                VideoInList e = _.videos[index];
                return TvVideoItem(key: ValueKey('video-item-${e.videoId}'),video: e, autoFocus: index == 0, onSelect: onSelect,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
