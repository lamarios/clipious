import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/searchResult.dart';
import 'package:invidious/models/videoInList.dart';

import 'videoList.dart';

class Search extends StatefulWidget {
  final SearchResults results;
  const Search({super.key, required this.results});
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {




  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: VideoList(
            videos: widget.results.videos,
          ),
        ),
      ],
    );
  }
}
