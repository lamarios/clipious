import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import 'videoList.dart';

class Search extends StatefulWidget {
  final String query;

  const Search({super.key, required this.query});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> with AfterLayoutMixin<Search> {
  List<VideoInList> results = [];
  bool searching = false;

  @override
  didUpdateWidget(Search old) {
    super.didUpdateWidget(old);

    if (old.query != widget.query) {
      search(widget.query);
    }
  }

  search(String query) {
    if (query.isNotEmpty) {
      setState(() {
        searching = true;
      });

      service.search(query).then((value) {
        setState(() {
          results = value;
          searching = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(visible: searching, child: LinearProgressIndicator()),
          Expanded(
              child: VideoList(
            videos: results,
          )),
        ],
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    search(widget.query);
  }
}
