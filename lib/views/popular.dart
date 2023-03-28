import 'package:flutter/material.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/globals.dart';

import '../models/paginatedList.dart';
import 'videoList.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: VideoList(
        paginatedVideoList: SingleEndpointList(service.getPopular),
        tags: VideoListController.popularTag,
      ),
    );
  }
}
