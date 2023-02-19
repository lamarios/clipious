import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import '../models/userFeed.dart';
import 'videoList.dart';

const MAX_RESULTS = 50;

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  SubscriptionsState createState() => SubscriptionsState();
}

class SubscriptionsState extends State<Subscriptions> {
  int page = 1;
  bool hasMore = true;

  Future<List<VideoInList>> getVideos() async {
    UserFeed feed = await service.getUserFeed(page: page, maxResults: MAX_RESULTS);
    List<VideoInList> subs = [];
    subs.addAll(feed.notifications ?? []);
    subs.addAll(feed.videos ?? []);
    if (subs.length < MAX_RESULTS) {
      setState(() {
        hasMore = false;
      });
    }
    return subs;
  }

  Future<List<VideoInList>> getMoreVideos() async {
    setState(() {
      page = page + 1;
    });
    return getVideos();
  }

  Future<List<VideoInList>> refreshVideos() async {
    setState(() {
      page = 1;
    });
    return getVideos();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: VideoList(
        getVideos: getVideos,
        refresh: refreshVideos,
        getMoreVideos: hasMore ? getMoreVideos : null,
      ),
    );
  }
}
