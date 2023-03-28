import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/playlist.dart';

const couldNotGetPlaylits = 'could-not-get-playlists';

const String userPlayListTag = 'user-playlists';
const String searchPlayListTag = 'search-playlists';

class PlaylistListController extends GetxController {
  static PlaylistListController? to({String? tag}) => safeGet(tag: tag);
  PaginatedList<Playlist> paginatedList;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  List<Playlist> playlists = [];
  bool loading = true;
  ScrollController scrollController = ScrollController();
  String error = '';

  PlaylistListController(this.paginatedList);

  static String? getTag(String? source){
    return source != null ? 'play-list-controller-${source}': null;
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(onScrollEvent);
  }

  onScrollEvent() {
    if (paginatedList.getHasMore()) {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent == scrollController.offset) {
          EasyDebounce.debounce('get-more-playlists', const Duration(milliseconds: 250), getMorePlaylists);
        }
      }
    }
  }

  getMorePlaylists() async {
    if (!loading && paginatedList.getHasMore()) {
      loadPlaylist(() async {
        List<Playlist> playlists = await paginatedList.getMoreItems();
        List<Playlist> currentPlaylists = this.playlists;
        currentPlaylists.addAll(playlists);
        return currentPlaylists;
      });
    }
  }

  refreshPlaylists() async {
    loadPlaylist(paginatedList.refresh);
  }

  getPlaylists() async {
    loadPlaylist(paginatedList.getItems);
  }

  loadPlaylist(Future<List<Playlist>> Function() refreshFunction) async {
    error = '';
    loading = true;
    update();
    try {
      var playlists = await refreshFunction();
      this.playlists = playlists;
      loading = false;
      update();
    } catch (err) {
      playlists = [];
      loading = false;
      error = couldNotGetPlaylits;
      update();
      rethrow;
    }
    refreshController.refreshCompleted();
  }

  @override
  void onReady() {
    super.onReady();
    getPlaylists();
  }

  @override
  void onClose() {
    scrollController.dispose();
    refreshController.dispose();
    super.onClose();
  }
}
