import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/searchResult.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/channel.dart';
import 'package:invidious/views/playlists/playlist.dart';

import 'videoList.dart';

class Search extends StatefulWidget {
  final SearchResults results;

  const Search({super.key, required this.results});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(controller: controller, tabs: const [
          Tab(
            text: 'Videos',
            icon: Icon(Icons.play_arrow),
          ),
          Tab(
            text: 'Channels',
            icon: Icon(Icons.people),
          ),
          Tab(
            text: 'Playlists',
            icon: Icon(Icons.playlist_play),
          )
        ]),
        Expanded(
          child: FractionallySizedBox(
            widthFactor: 1,
            child: TabBarView(
              viewportFraction: 1,
              controller: controller,
              children: [
                widget.results.videos.isNotEmpty ? VideoList(
                  videos: widget.results.videos,
                ): const Text('No videos'),
                widget.results.channels.isNotEmpty
                    ? ListView(
                        children: widget.results.channels
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ChannelView(channelId: e.authorId),
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          e.author,
                                          style: TextStyle(color: colorScheme.primary),
                                        )),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.people,
                                            size: 15,
                                          ),
                                        ),
                                        Text(compactCurrency.format(e.subCount)),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      )
                    : const Center(
                        child: Text('No channels'),
                      ),
                widget.results.playlists.isNotEmpty
                    ? FractionallySizedBox(
                      child: ListView(
                          children: widget.results.playlists.map((e) => PlaylistItem(playlist: e, canDeleteVideos: false)).toList(),
                        ),
                    )
                    : const Center(child: Text('No playlists'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
