import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

import 'videoList.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  List<VideoInList> results = [];
  bool searching = false;
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();

  Future<List<String>> searchSuggestions(String query) async {
    return (await service.getSearchSuggestion(query)).suggestions;
  }

  search(String query) {
    EasyDebounce.debounce('search', Duration(milliseconds: 500), () {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: colorScheme.background,
        body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:6, left:16, right:16,bottom:5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: colorScheme.secondary,
                            )),
                      ),
                      Expanded(
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            autofocus: true,
                              controller: searchController,
                              decoration: InputDecoration(
                                  icon: Icon(
                                Icons.search,
                                color: colorScheme.secondary,
                              )),
                              onSubmitted: search,
                              onChanged: search),
                          suggestionsCallback: searchSuggestions,
                          itemBuilder: (BuildContext context, String itemData) => ListTile(
                            title: Text(itemData),
                          ),
                          onSuggestionSelected: (String? suggestion) {
                            searchController.text = suggestion ?? '';
                            if (suggestion != null) {
                              search(suggestion);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(visible: searching, child: LinearProgressIndicator()),
                Expanded(
                  child: VideoList(
                    videos: results,
                  ),
                ),
              ],
            )));
  }
}
