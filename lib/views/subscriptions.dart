import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import '../models/userFeed.dart';
import 'videoList.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  SubscriptionsState createState() => SubscriptionsState();
}

class SubscriptionsState extends State<Subscriptions> {
  Future<List<VideoInList>> getVideos() async {
    UserFeed feed = await service.getUserFeed();
    List<VideoInList> subs = [];
    subs.addAll(feed.notifications??[]);
    subs.addAll(feed.videos??[]);
    return subs;
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: VideoList(getVideos: getVideos, title: 'Subscriptions',),
    );
  }

}
