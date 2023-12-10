import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/search/models/search_sort_by.dart';
import 'package:invidious/search/models/search_type.dart';

import '../../channels/models/channel.dart';
import '../../playlists/models/playlist.dart';
import '../../settings/states/settings.dart';
import '../../videos/models/video_in_list.dart';
import '../models/search_date.dart';

part 'search.g.dart';

class SearchCubit<T extends SearchState> extends Cubit<SearchState> {
  final SettingsCubit settings;

  SearchCubit(super.initialState, this.settings) {
    onInit();
  }

  void onInit() {
    state.queryController.addListener(getSuggestions);
    if (state.searchNow) {
      search(state.queryController.value.text);
    }
  }

  @override
  Future<void> close() async {
    state.queryController.dispose();
    super.close();
  }

  void onFiltersChanged(SearchFiltersState newValue) {
    emit(state.copyWith(filters: newValue));
  }

  // returns true search is already cleared
  bool searchCleared() {
    if (state.queryController.value.text.isEmpty) {
      return true;
    } else {
      var state = this.state.copyWith();
      state.queryController.clear();
      state.showResults = false;
      emit(state);
      return false;
    }
  }

  clearSearch(){
    emit(state.copyWith(showResults: false));
  }

  void getSuggestions({bool hideResult = true}) {
    emit(state.copyWith(showResults: !hideResult));
    if(!settings.state.distractionFreeMode) {
      EasyDebounce.debounce('search-suggestions', const Duration(milliseconds: 500), () async {
        var suggestions = (await service.getSearchSuggestion(state.queryController.value.text)).suggestions;
        emit(state.copyWith(suggestions: suggestions));
      });
    }
  }

  List<String> getHistory() {
    return settings.state.useSearchHistory ? db.getSearchHistory() : [];
  }

  search(String value) async {
    emit(state.copyWith(showResults: true));
  }

  setSearchQuery(String e) {
    state.queryController.text = e;
    search(e);
  }

  void selectIndex(int value) {
    var state = this.state.copyWith();
    state.selectedIndex = value;
    emit(state);
  }
}

class SearchFiltersCubit<T extends SearchFiltersState> extends Cubit<SearchFiltersState> {
  SearchFiltersCubit(super.initialState);

  setDate(SearchDate? newValue) {
    emit(state.copyWith(date: newValue));
  }

  setSortBy(SearchSortBy? newValue) {
    emit(state.copyWith(sortBy: newValue));
  }
}

abstract class Clonable<T> {
  T clone();
}

@CopyWith(constructor: "inLine")
class SearchState extends Clonable<SearchState> {
  TextEditingController queryController;

  int selectedIndex;

  bool searchNow;

  List<String> suggestions;

  SearchFiltersState filters;

  bool showResults;

  int videoPage, channelPage, playlistPage;

  SearchState(
      {TextEditingController? queryController,
      int? selectedIndex,
      List<VideoInList>? videos,
      List<Channel>? channels,
      List<Playlist>? playlists,
      bool? useHistory,
      bool? searchNow,
      List<String>? suggestions,
      SearchFiltersState? filters,
      bool? showResults,
      bool? loading,
      int? videoPage,
      channelPage,
      playlistPage,
      String? query})
      : queryController = queryController ?? TextEditingController(text: query ?? ''),
        selectedIndex = selectedIndex ?? 0,
        searchNow = searchNow ?? false,
        suggestions = suggestions ?? [],
        filters = filters ?? SearchFiltersState(),
        showResults = showResults ?? false,
        videoPage = videoPage ?? 1,
        channelPage = channelPage ?? 1,
        playlistPage = playlistPage ?? 1;

  SearchState.inLine(this.queryController, this.selectedIndex, this.searchNow, this.suggestions, this.filters,
      this.showResults, this.videoPage, this.channelPage, this.playlistPage);

  @override
  SearchState clone() {
    return copyWith();
  }
}

@CopyWith()
class SearchFiltersState {
  final SearchDate date;
  final SearchSortBy sortBy;

  SearchFiltersState({
    this.date = SearchDate.any,
    this.sortBy = SearchSortBy.relevance,
  });

  copyWith({
    SearchDate? date,
    SearchSortBy? sortBy,
  }) => SearchFiltersState(
    date: date ?? this.date,
    sortBy: sortBy ?? this.sortBy,
  );
}
