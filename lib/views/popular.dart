import 'package:flutter/material.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/globals.dart';

import '../main.dart';
import '../models/paginatedList.dart';
import 'tv/tvHorizontalVideoList.dart';
import 'videoList.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: isTv
          ? TvHorizontalVideoList(
              paginatedVideoList: SingleEndpointList(service.getPopular),
              tags: VideoListController.popularTag,
            )
          : VideoList(
              paginatedVideoList: SingleEndpointList(service.getPopular),
              tags: VideoListController.popularTag,
            ),
    );
  }
}
