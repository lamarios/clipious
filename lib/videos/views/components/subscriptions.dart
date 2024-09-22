import 'package:flutter/material.dart';
import 'package:clipious/main.dart';
import 'package:clipious/utils/views/tv/components/tv_horizontal_item_list.dart';

import '../../../utils/models/paginated_list.dart';
import '../../models/video_in_list.dart';
import 'video_list.dart';

class Subscriptions extends StatelessWidget {
  final void Function(VideoInList video, int index, bool focus)? onItemFocus;

  const Subscriptions({super.key, this.onItemFocus});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.surface,
      child: isTv
          ? TvHorizontalVideoList(
              paginatedVideoList: SubscriptionVideoList(),
              onItemFocus: onItemFocus,
            )
          : VideoList(
              animateDownload: true,
              paginatedVideoList: SubscriptionVideoList(),
            ),
    );
  }
}
