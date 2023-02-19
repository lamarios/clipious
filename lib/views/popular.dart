import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import 'videoList.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  PopularState createState() => PopularState();
}

class PopularState extends State<Popular>{
  Future<List<VideoInList>> getVideos() async {
    return service.getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: VideoList(
        getVideos: getVideos,
        refresh: getVideos,
      ),
    );
  }
}
