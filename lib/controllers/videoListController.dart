import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/paginatedList.dart';
import '../models/videoInList.dart';

enum VideoListErrors { none, couldNotFetchVideos }

class VideoListController extends GetxController {
  static const String subscriptionTag = 'video-list-subscription';
  static const String popularTag = 'video-list-popular';
  static const String trendingTag = 'video-list-trending';

  static VideoListController? to(String? tags) => safeGet(tag: tags);

  static List<VideoListController?> getAllGlobal() {
    List<VideoListController?> list = [];
    list.add(to(subscriptionTag));

    list.add(to(popularTag));
    list.add(to(trendingTag));

    return list;
  }

  PaginatedList<VideoInList> videoList;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  List<VideoInList> videos = [];
  bool loading = true;
  Map<String, Image> imageCache = {};
  ScrollController scrollController = ScrollController();
  VideoListErrors error = VideoListErrors.none;

  VideoListController(this.videoList);

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

      log.info('scroll event ${scrollController.position.maxScrollExtent}, ${scrollController.offset}');
      if (scrollController.position.maxScrollExtent * 0.9 < scrollController.offset) {
        EasyDebounce.debounce('loading-more-videos', const Duration(milliseconds: 250), getMoreVideos);
      }
    }
  }

  getMoreVideos() async {
    if (!loading) {
      loadVideo(() async {
        List<VideoInList> videos = await videoList.getMoreItems();
        List<VideoInList> currentVideos = this.videos;
        currentVideos.addAll(videos);
        return currentVideos;
      });
    }
  }

  refreshVideos() async {
    loadVideo(videoList.refresh);
  }

  getVideos() async {
    loadVideo(videoList.getItems);
  }

  loadVideo(Future<List<VideoInList>> Function() refreshFunction) async {
    // var locals = AppLocalizations.of(context)!;
    error = VideoListErrors.none;
    loading = true;
    update();
    try {
      var videos = await refreshFunction();
      this.videos = videos;
      loading = false;
      update();
    } catch (err) {
      videos = [];
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
