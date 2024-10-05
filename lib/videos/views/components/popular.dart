import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:clipious/globals.dart';

import '../../../main.dart';
import '../../../utils/models/paginated_list.dart';
import '../../../utils/views/tv/components/tv_horizontal_item_list.dart';
import 'video_list.dart';

class Popular extends StatelessWidget {
  final void Function(Video video, int index, bool focus)? onItemFocus;

  const Popular({super.key, this.onItemFocus});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
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
