import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/searchResult.dart';

import '../models/searchSuggestion.dart';

class TvSearchController extends GetxController {
  List<String> suggestions = db.getSearchHistory();
  FocusNode resultFocus = FocusNode();
  FocusNode searchFocus = FocusNode();
  SearchResults? results;
  bool loading = false;
  TextEditingController queryController = TextEditingController();
  bool usingHistory = true;

  @override
  onReady() {
    queryController.addListener(getSuggestions);
  }

  @override
  onClose() async {
    resultFocus.dispose();
    searchFocus.dispose();
  }

  KeyEventResult handleResultScopeKeyEvent(FocusNode node, KeyEvent event) {
    print(event);
    if (event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.goBack) {
      searchFocus.requestFocus();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  getSuggestions() {
    EasyDebounce.debounce('search-suggestion', const Duration(milliseconds: 500), () async {
      SearchSuggestion s = await service.getSearchSuggestion(queryController.value.text);
      if (s.suggestions.isNotEmpty) {
        suggestions = s.suggestions;
        usingHistory = false;
      }
      update();
    });
  }

  search(String value) async {
    results == null;
    loading = true;
    update();
    results = await service.search(value);
    loading = false;
    update();
    resultFocus.requestFocus();
  }

  pressedSuggestion(String e) {
    queryController.text = e;
    search(e);
  }
}
