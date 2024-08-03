import 'package:invidious/channels/models/channel_videos.dart';
import 'package:invidious/search/models/search_results.dart';
import 'package:invidious/search/models/search_sort_by.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:invidious/utils/extensions/list_unique.dart';
import 'package:invidious/utils/models/item_with_continuation.dart';
import 'package:invidious/videos/models/user_feed.dart';
import 'package:invidious/videos/models/video_in_list.dart';

import '../../globals.dart';

const _done = "NO_MORE_VIDEOS";

abstract class PaginatedList<T> {
  Future<List<T>> getItems();

  Future<List<T>> getMoreItems();

  Future<List<T>> refresh();

  bool hasRefresh();

  bool getHasMore();
}

abstract class PaginatedVideoList extends PaginatedList<VideoInList> {}

/// Paginated video list that uses the continuation concept
class ContinuationList<T> extends PaginatedList<T> {
  String? continuation;
  Future<ItemtWithContinuation<T>> Function(String? continuation) serviceCall;

  ContinuationList(this.serviceCall);

  @override
  bool getHasMore() {
    return continuation != null;
  }

  @override
  Future<List<T>> getMoreItems() async {
    return getItems();
  }

  @override
  Future<List<T>> getItems() async {
    ItemtWithContinuation<T> videos = await serviceCall(continuation);

    continuation = videos.continuation;
    return videos.getItems();
  }

  @override
  bool hasRefresh() {
    return true;
  }

  @override
  Future<List<T>> refresh() {
    continuation = null;
    return getItems();
  }
}

/// Video list with one endpoint call, no pagination or continuation
class SingleEndpointList<T> extends PaginatedList<T> {
  Future<List<T>> Function() serviceCall;

  SingleEndpointList(this.serviceCall);

  @override
  bool getHasMore() {
    return false;
  }

  @override
  Future<List<T>> getMoreItems() async {
    return [];
  }

  @override
  Future<List<T>> getItems() async {
    return serviceCall();
  }

  @override
  Future<List<T>> refresh() async {
    return getItems();
  }

  @override
  bool hasRefresh() {
    return true;
  }
}

/// List of videos with no service calls, just a plain list
/// sounds too simple to use this but it is to have a standard component to handle item lists
class FixedItemList<T> extends PaginatedList<T> {
  List<T> items;

  FixedItemList(this.items);

  @override
  bool getHasMore() {
    return false;
  }

  @override
  Future<List<T>> getMoreItems() async {
    return [];
  }

  @override
  Future<List<T>> getItems() async {
    return items;
  }

  @override
  Future<List<T>> refresh() async {
    return items;
  }

  @override
  bool hasRefresh() {
    return false;
  }
}

/// User subscription_management
class SubscriptionVideoList extends PaginatedVideoList {
  final maxResults = 50;
  int page = 1;
  bool hasMoreOnline = true;
  Map<String, String> continuations = {};

  @override
  Future<List<VideoInList>> getItems() async {
    final isLoggedIn = await service.isLoggedIn();

    List<VideoInList> videos = [];

    if (isLoggedIn) {
      UserFeed feed =
          await service.getUserFeed(page: page, maxResults: maxResults);
      videos.addAll(feed.notifications ?? []);
      videos.addAll(feed.videos ?? []);
      hasMoreOnline = videos.length >= maxResults;
    }

    final offlineSubs = await db.getOfflineSubscriptions();
    List<Future<VideosWithContinuation>> futures = [];

    for (final offlineSub in offlineSubs) {
      var hasContinuation = continuations.containsKey(offlineSub.channelId);
      // if we don't have continuation, we've never seen the channel so we retrive videos
      // if there is a continuation but it's null, then there's no more videos to fetch
      if (!hasContinuation ||
          (hasContinuation && continuations[offlineSub.channelId] != _done)) {
        futures.add(service.getChannelVideos(offlineSub.channelId,
            hasContinuation ? continuations[offlineSub.channelId] : null));
      }
    }

    if (futures.isNotEmpty) {
      List<VideosWithContinuation> offlineSubVideos =
          await Future.wait(futures);
      for (final v in offlineSubVideos) {
        if (v.videos.isNotEmpty) {
          videos.addAll(v.videos);
          if (v.videos[0].authorUrl != null) {
            continuations[v.videos[0].authorUrl!] = v.continuation ?? _done;
          }
        }
      }
    }

    videos = videos.unique(
      (element) => element.videoId,
    );
    videos.sort((a, b) => (b.published ?? 0).compareTo(a.published ?? 0));

    return videos;
  }

  @override
  Future<List<VideoInList>> getMoreItems() async {
    if (hasMoreOnline) {
      page = page + 1;
    }
    return getItems();
  }

  @override
  Future<List<VideoInList>> refresh() async {
    page = 1;
    continuations = {};
    return getItems();
  }

  @override
  bool getHasMore() {
    return hasMoreOnline || continuations.values.any((v) => v != _done);
  }

  @override
  bool hasRefresh() {
    return true;
  }
}

class SearchPaginatedList<T> extends PaginatedList<T> {
  final SearchType type;
  final String query;
  final SearchSortBy sortBy;
  List<T> items;
  int page = 1;

  List<T> Function(SearchResults res) getFromResults;

  SearchPaginatedList(
      {required this.query,
      required this.items,
      required this.type,
      required this.getFromResults,
      required this.sortBy});

  @override
  bool getHasMore() {
    return true;
  }

  @override
  Future<List<T>> getItems() async {
    SearchResults results =
        await service.search(query, type: type, page: page, sortBy: sortBy);
    return getFromResults(results);
  }

  @override
  Future<List<T>> getMoreItems() async {
    page++;
    return getItems();
  }

  @override
  bool hasRefresh() {
    return false;
  }

  @override
  Future<List<T>> refresh() async {
    return [];
  }
}

// Force refresh to fetch all videos as search endpoint only returns 2 videos for each playlist
class PlaylistSearchPaginatedList<T> extends SearchPaginatedList<T> {
  PlaylistSearchPaginatedList(
      {required super.query,
      required super.items,
      required super.type,
      required super.getFromResults,
      required super.sortBy});

  @override
  bool getHasMore() {
    return false;
  }

  @override
  bool hasRefresh() {
    return true;
  }

  @override
  Future<List<T>> refresh() async {
    return (await service.getPublicPlaylists(super.query)).videos as List<T>;
  }
}

class PageBasedPaginatedList<T> extends PaginatedList<T> {
  final int maxResults;
  int page = 1;
  bool hasMore = true;
  final Future<List<T>> Function(int page, int maxResults) getItemsFunc;

  PageBasedPaginatedList(
      {required this.maxResults, required this.getItemsFunc});

  @override
  bool getHasMore() {
    return hasMore;
  }

  @override
  Future<List<T>> getItems() async {
    var list = await getItemsFunc(page, maxResults);
    hasMore = list.length == maxResults;
    return list;
  }

  @override
  Future<List<T>> getMoreItems() async {
    try {
      page++;
      return await getItems();
    } catch (err) {
      page--;
      rethrow;
    }
  }

  @override
  bool hasRefresh() {
    return true;
  }

  @override
  Future<List<T>> refresh() async {
    return await getItemsFunc(1, maxResults * page);
  }
}
