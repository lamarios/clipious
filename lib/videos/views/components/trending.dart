import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';

import '../../../main.dart';
import '../../../utils/models/paginated_list.dart';
import '../../models/video_in_list.dart';
import 'video_list.dart';

const all = 'all';

class Trending extends StatefulWidget {
  final void Function(VideoInList video, int index, bool focus)? onItemFocus;

  const Trending({super.key, this.onItemFocus});

  @override
  TrendingState createState() => TrendingState();
}

class TrendingState extends State<Trending> {
  String type = all;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.surface,
      child: isTv
          ? TvHorizontalVideoList(
              onItemFocus: widget.onItemFocus,
              paginatedVideoList: SingleEndpointList(service.getTrending),
            )
          : Column(
              children: [
                Expanded(
                  child: VideoList(
                    animateDownload: true,
                    paginatedVideoList: SingleEndpointList(service.getTrending),
                  ),
                ),
              ],
            ),
    );
  }
}
