import 'package:flutter/material.dart';
import 'package:invidious/main.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';

import '../controllers/videoListController.dart';
import '../models/paginatedList.dart';
import 'videoList.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  SubscriptionsState createState() => SubscriptionsState();
}

class SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: isTv
          ? TvHorizontalVideoList(
              paginatedVideoList: SubscriptionVideoList(),
              tags: VideoListController.subscriptionTag,
            )
          : VideoList(
              paginatedVideoList: SubscriptionVideoList(),
              tags: VideoListController.subscriptionTag,
            ),
    );
  }
}
