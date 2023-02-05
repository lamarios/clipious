import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/settings.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'videoList.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  List<VideoInList> results = [];
  List<String> autofillHints = [];
  bool searching = false;

  search(String query) {
    if (query.isNotEmpty) {
      EasyDebounce.debounce('search', const Duration(milliseconds: 500), () {
        setState(() {
          searching = true;
        });

        service.search(query).then((value) {
          setState(() {
            results = value;
            searching = false;
          });
        });
      });
    }
  }

  Future<List<String>> autoComplete(String query) async {
    return (await service.getSearchSuggestion(query)).suggestions;
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 50, 8),
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(controller: controller, decoration: const InputDecoration(icon: Icon(Icons.search)), onSubmitted: search, onChanged: search),
              suggestionsCallback: autoComplete,
              itemBuilder: (BuildContext context, String itemData) => ListTile(
                title: Text(itemData),
              ),
              onSuggestionSelected: (String? suggestion) {
                controller.text = suggestion ?? '';
                if (suggestion != null) {
                  search(suggestion);
                }
              },
            ),
          ),
          Visibility(visible: searching, child: LinearProgressIndicator()),
          Expanded(
              child: VideoList(
            videos: results,
            title: '',
          )),
        ],
      ),
    );
  }
}
