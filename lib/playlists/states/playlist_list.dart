import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/utils/models/paginatedList.dart';

import '../models/playlist.dart';

part 'playlist_list.freezed.dart';

const couldNotGetPlaylits = 'could-not-get-playlists';

class PlaylistListCubit extends Cubit<PlaylistListState> {
  ScrollController scrollController = ScrollController();
  PlaylistListCubit(super.initialState) {
    onReady();
  }

  void onReady() {
    scrollController.addListener(onScrollEvent);
    getPlaylists();
  }

  onScrollEvent() {
    if (state.paginatedList.getHasMore()) {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent * 0.9 ==
            scrollController.offset) {
          EasyDebounce.debounce('get-more-playlists',
              const Duration(milliseconds: 500), getMorePlaylists);
        }
      }
    }
  }

  getMorePlaylists() async {
    if (!state.loading && state.paginatedList.getHasMore()) {
      loadPlaylist(() async {
        List<Playlist> playlists = await state.paginatedList.getMoreItems();
        List<Playlist> currentPlaylists = state.playlists;
        currentPlaylists.addAll(playlists);
        return currentPlaylists;
      });
    }
  }

  refreshPlaylists() async {
    loadPlaylist(state.paginatedList.refresh);
  }

  getPlaylists() async {
    loadPlaylist(state.paginatedList.getItems);
  }

  loadPlaylist(Future<List<Playlist>> Function() refreshFunction) async {
    emit(state.copyWith(error: '', loading: true));
    try {
      var playlists = await refreshFunction();
      emit(state.copyWith(playlists: playlists, loading: false));
    } catch (err) {
      emit(state.copyWith(
          error: couldNotGetPlaylits, playlists: [], loading: false));
      rethrow;
    }
  }

  @override
  close() async {
    scrollController.dispose();
    super.close();
  }
}

@freezed
class PlaylistListState with _$PlaylistListState {
  const factory PlaylistListState(
      {required PaginatedList<Playlist> paginatedList,
      @Default([]) List<Playlist> playlists,
      @Default(true) bool loading,
      @Default('') String error}) = _PlaylistListState;
}
