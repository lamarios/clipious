import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import 'videoList.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  TrendingState createState() => TrendingState();
}

class TrendingState extends State<Trending> {
  Future<List<VideoInList>> getVideos() async {
    return service.getTrending();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: VideoList(getVideos: getVideos, ),
    );
  }

}
