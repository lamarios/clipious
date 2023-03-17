import 'package:flutter/material.dart';
import 'package:invidious/models/videoListAbstractClass.dart';

import 'videoList.dart';

const MAX_RESULTS = 50;

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
      child: VideoList(
        paginatedVideoList: SubscriptionVideoList(),
        tags: 'subscriptions-video-list',
      ),
    );
  }
}
