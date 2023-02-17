import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import 'videoList.dart';

const ALL = 'all';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  TrendingState createState() => TrendingState();
}

class TrendingState extends State<Trending> {
  String type = ALL;
  GlobalKey<VideoListState> videos = GlobalKey();

  Future<List<VideoInList>> getVideos() async {
    return service.getTrending(type: type == ALL ? null : type);
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: Column(
        children: [
/*
doesn't seem to be working for now
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  value: type,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    if (value != type) {
                      setState(() {
                        type = value ?? ALL;
                        videos.currentState?.getVideos(context);
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: ALL,
                      child: Text('All'),
                    ),
                    DropdownMenuItem(
                      value: 'music',
                      child: Text('Music'),
                    ),
                    DropdownMenuItem(
                      value: 'gaming',
                      child: Text('Gaming'),
                    ),
                    DropdownMenuItem(
                      value: 'news',
                      child: Text('News'),
                    ),
                    DropdownMenuItem(
                      value: 'movies',
                      child: Text('Movies'),
                    ),
                  ],
                )
              ],
            ),
          ),
*/
          Expanded(
            child: VideoList(
              key: videos,
              getVideos: getVideos,
            ),
          ),
        ],
      ),
    );
  }
}
