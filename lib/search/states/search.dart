import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/search/models/search_sort_by.dart';

import '../../channels/models/channel.dart';
import '../../playlists/models/playlist.dart';
import '../../settings/states/settings.dart';
import '../../videos/models/video_in_list.dart';

part 'search.freezed.dart';

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

  void sortChanged(SearchSortBy? value) {
    emit(state.copyWith(sortBy: value ?? state.sortBy));
    search(state.queryController.value.text);
  }

  // returns true search is already cleared
  bool searchCleared() {
    if (state.queryController.value.text.isEmpty) {
      return true;
    } else {
      state.queryController.clear();
      emit(state.copyWith(showResults: false));
      return false;
    }
  }

  clearSearch() {
    emit(state.copyWith(showResults: false));
  }

  void getSuggestions({bool hideResult = true}) {
    emit(state.copyWith(showResults: !hideResult));
    if (!settings.state.distractionFreeMode) {
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
    emit(state.copyWith(selectedIndex: value));
  }

  void setSearchSortBy(SearchSortBy value) {
    emit(state.copyWith(sortBy: value));
  }
}

abstract class Clonable<T> {
  T clone();
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required TextEditingController queryController,
    @Default(0) int selectedIndex,
    @Default(false) bool searchNow,
    @Default([]) List<String> suggestions,
    @Default(SearchSortBy.relevance) SearchSortBy sortBy,
    @Default(false) bool showResults,
    @Default(1) int videoPage,
    @Default(1) int channelPage,
    @Default(1) int playlistPage,
  }) = _SearchState;

  static SearchState init(
      {TextEditingController? queryController,
      int? selectedIndex,
      List<VideoInList>? videos,
      List<Channel>? channels,
      List<Playlist>? playlists,
      bool? useHistory,
      bool? searchNow,
      List<String>? suggestions,
      SearchSortBy? sortBy,
      bool? showResults,
      bool? loading,
      int? videoPage,
      channelPage,
      playlistPage,
      String? query}) {
    return SearchState(
        queryController: queryController ?? TextEditingController(text: query ?? ''),
        selectedIndex: selectedIndex ?? 0,
        searchNow: searchNow ?? false,
        suggestions: suggestions ?? [],
        sortBy: sortBy ?? SearchSortBy.relevance,
        showResults: showResults ?? false,
        videoPage: videoPage ?? 1,
        channelPage: channelPage ?? 1,
        playlistPage: playlistPage ?? 1);
  }
}
