import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/playlist.dart';

part 'playlist_list.g.dart';

const couldNotGetPlaylits = 'could-not-get-playlists';

class PlaylistListCubit extends Cubit<PlaylistListState> {
  PlaylistListCubit(super.initialState) {
    onReady();
  }

  void onReady() {
    state.scrollController.addListener(onScrollEvent);
    getPlaylists();
  }

  onScrollEvent() {
    if (state.paginatedList.getHasMore()) {
      if (state.scrollController.hasClients) {
        if (state.scrollController.position.maxScrollExtent * 0.9 == state.scrollController.offset) {
          EasyDebounce.debounce('get-more-playlists', const Duration(milliseconds: 500), getMorePlaylists);
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
    var state = this.state.copyWith();
    state.error = '';
    state.loading = true;
    emit(state);
    try {
      state = this.state.copyWith();
      var playlists = await refreshFunction();
      state.playlists = playlists;
      state.loading = false;
      emit(state);
    } catch (err) {
      state = this.state.copyWith();
      state.playlists = [];
      state.loading = false;
      state.error = couldNotGetPlaylits;
      emit(state);
      rethrow;
    }
    state.refreshController.refreshCompleted();
  }

  @override
  close() async {
    state.scrollController.dispose();
    state.refreshController.dispose();
    super.close();
  }
}

@CopyWith(constructor: "_")
class PlaylistListState {
  PaginatedList<Playlist> paginatedList;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  List<Playlist> playlists = [];
  bool loading = true;
  ScrollController scrollController = ScrollController();
  String error = '';

  PlaylistListState(this.paginatedList);

  PlaylistListState._(this.paginatedList, this.refreshController, this.playlists, this.loading, this.scrollController, this.error);
}
