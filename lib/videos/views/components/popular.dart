import 'package:flutter/material.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/globals.dart';

import '../../../main.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../utils/views/tv/components/tv_horizontal_item_list.dart';
import 'video_list.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: isTv
          ? TvHorizontalVideoList(
              paginatedVideoList: SingleEndpointList(service.getPopular),
            )
          : VideoList(
              animateDownload: true,
              paginatedVideoList: SingleEndpointList(service.getPopular),
            ),
    );
  }
}
