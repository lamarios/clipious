import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import '../models/paginatedList.dart';
import 'videoList.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  PopularState createState() => PopularState();
}

class PopularState extends State<Popular>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: VideoList(
        paginatedVideoList: SingleEndpointList(service.getPopular),
        tags: 'popular-video-list',
      ),
    );
  }
}
