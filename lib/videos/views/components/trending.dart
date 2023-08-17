import 'package:flutter/material.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';

import '../../../main.dart';
import '../../../utils/models/paginatedList.dart';
import 'video_list.dart';

const ALL = 'all';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  TrendingState createState() => TrendingState();
}

class TrendingState extends State<Trending> {
  String type = ALL;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: isTv
          ? TvHorizontalVideoList(
              paginatedVideoList: SingleEndpointList(service.getTrending),
            )
          : Column(
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
                    animateDownload: true,
                    paginatedVideoList: SingleEndpointList(service.getTrending),
                  ),
                ),
              ],
            ),
    );
  }
}
