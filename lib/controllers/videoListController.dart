import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/paginatedList.dart';
import '../models/videoInList.dart';

enum VideoListErrors { none, couldNotFetchVideos }

class VideoListController extends ItemListController<VideoInList> {
  static const String subscriptionTag = 'video-list-subscription';
  static const String popularTag = 'video-list-popular';
  static const String trendingTag = 'video-list-trending';

  VideoListController({required PaginatedList<VideoInList> videoList})
      : super(itemList: videoList) {}

  static VideoListController? to(String? tags) => safeGet(tag: tags);

  static List<VideoListController?> getAllGlobal() {
    List<VideoListController?> list = [];
    list.add(to(subscriptionTag));

    list.add(to(popularTag));
    list.add(to(trendingTag));

    return list;
  }
}

class ItemListController<T> extends GetxController {
  var log = Logger('VideoListController');

  static ItemListController? to(String? tags) => safeGet(tag: tags);

  PaginatedList<T> itemList;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<T> items = [];
  bool loading = true;
  Map<String, Image> imageCache = {};
  ScrollController scrollController = ScrollController();
  VideoListErrors error = VideoListErrors.none;

  ItemListController({required this.itemList}) {}

  @override
  void onClose() {
    refreshController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  @override
  onReady() {
    super.onReady();
    getVideos();
    scrollController.addListener(onScrollEvent);
  }

  onScrollEvent() {
    if (scrollController.hasClients) {
      if (scrollController.position.maxScrollExtent * 0.9 <
          scrollController.offset) {
        EasyDebounce.debounce('loading-more-videos',
            const Duration(milliseconds: 250), getMoreVideos);
      }
    }
  }

  getMoreVideos() async {
    if (!loading && itemList.getHasMore()) {
      loadVideo(() async {
        List<T> videos = await itemList.getMoreItems();
        List<T> currentVideos = this.items;
        currentVideos.addAll(videos);
        return currentVideos;
      });
    }
  }

  refreshVideos() async {
    loadVideo(itemList.refresh);
  }

  getVideos() async {
    loadVideo(itemList.getItems);
  }

  loadVideo(Future<List<T>> Function() refreshFunction) async {
    // var locals = AppLocalizations.of(context)!;
    error = VideoListErrors.none;
    loading = true;
    update();
    try {
      var videos = await refreshFunction();
      this.items = videos;
      loading = false;
      update();
    } catch (err) {
      items = [];
      loading = false;
      error = VideoListErrors.couldNotFetchVideos;
      update();
      rethrow;
    }
    refreshController.refreshCompleted();
  }

  // similar
  focusChanged(bool value, int index) {}
}
