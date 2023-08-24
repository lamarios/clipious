import 'package:flutter/material.dart';
import 'package:invidious/main.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';
import 'package:invidious/videos/views/components/video_in_list.dart';

import '../../../utils/models/paginatedList.dart';
import 'video_list.dart';

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
            )
          : VideoList(
              animateDownload: true,
              paginatedVideoList: SubscriptionVideoList(),
            ),
    );
  }
}
