import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';

import '../../../main.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../utils/views/tv/components/tv_horizontal_item_list.dart';
import '../../models/video_in_list.dart';
import 'video_list.dart';

class Popular extends StatelessWidget {
  final void Function(VideoInList video, int index, bool focus)? onItemFocus;

  const Popular({super.key, this.onItemFocus});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: isTv
          ? TvHorizontalVideoList(
              paginatedVideoList: SingleEndpointList(service.getPopular),
              onItemFocus: onItemFocus,
            )
          : VideoList(
              animateDownload: true,
              paginatedVideoList: SingleEndpointList(service.getPopular),
            ),
    );
  }
}
