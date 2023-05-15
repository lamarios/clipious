import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/searchResult.dart';
import 'package:invidious/models/searchSortBy.dart';

import '../models/channel.dart';
import '../models/playlist.dart';
import '../models/searchType.dart';
import '../models/videoInList.dart';

class SearchController extends GetxController {
  TextEditingController queryController = TextEditingController();

  int selectedIndex = 0;

  late List<VideoInList> videos = [];
  late List<Channel> channels = [];
  late List<Playlist> playlists = [];

  bool useHistory = db.getSettings(USE_SEARCH_HISTORY)?.value == 'true';
  bool searchNow = false;

  List<String> suggestions = [];

  SearchSortBy sortBy = SearchSortBy.relevance;
  bool showResults = false;
  bool loading = false;

  int videoPage = 1, channelPage = 1, playlistPage = 1;

  SearchController({String? query, bool? searchNow}) {
    queryController.text = query ?? '';
    queryController.addListener(getSuggestions);

    this.searchNow = searchNow ?? false;
  }

  @override
  void onInit() {
    super.onInit();
    if(searchNow){
      search(queryController.value.text);
    }
  }

  @override
  void onClose() {
    queryController.dispose();
    super.onClose();
  }

  void sortChanged(SearchSortBy? value) {
    sortBy = value ?? sortBy;
    update();
    search(queryController.value.text);
  }

  void searchCleared() {
    if (queryController.value.text.isEmpty) {
      navigatorKey.currentState?.pop();
    } else {
      queryController.clear();
      showResults = false;
      update();
    }
  }

  void getSuggestions() {
    showResults = false;
    update();
    EasyDebounce.debounce('search-suggestions', const Duration(milliseconds: 500), () async {
      suggestions = (await service.getSearchSuggestion(queryController.value.text)).suggestions;
      update();
    });
  }

  List<String> getHistory() {
    return useHistory ? db.getSearchHistory() : [];
  }

  void search(String value) async {
    showResults = true;
    loading = true;
    videos = [];
    channels = [];
    playlists = [];
    update();

    List<SearchResults> results = await Future.wait([
      service.search(queryController.value.text, type: SearchType.video, sortBy: sortBy),
      service.search(queryController.value.text, type: SearchType.channel, sortBy: sortBy),
      service.search(queryController.value.text, type: SearchType.playlist, sortBy: sortBy)
    ]);

    videos = results[0].videos;
    channels = results[1].channels;
    playlists = results[2].playlists;
    loading = false;
    update();
  }

  setSearchQuery(String e) {
    queryController.text = e;
    search(e);
  }

  void selectIndex(int value) {
    selectedIndex = value;
    update();
  }
}
