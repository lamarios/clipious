import 'package:flutter/material.dart';

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
      child: VideoList(
        paginatedVideoList: SubscriptionVideoList(),
        tags: VideoListController.subscriptionTag,
      ),
    );
  }
}
