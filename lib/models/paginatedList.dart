import 'package:invidious/models/itemWithContinuation.dart';
import 'package:invidious/models/userFeed.dart';
import 'package:invidious/models/videoInList.dart';

import '../globals.dart';
import '../views/subscriptions.dart';
import 'channelVideos.dart';

abstract class PaginatedList<T>{
  Future<List<T>> getItems();

  Future<List<T>> getMoreItems();

  Future<List<T>> refresh();

  bool hasRefresh();

  bool getHasMore();
}

abstract class PaginatedVideoList extends PaginatedList<VideoInList> {
}

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

/// User subscriptions
class SubscriptionVideoList extends PaginatedVideoList {
  final maxResults = 50;
  int page = 1;
  bool hasMore = true;

  @override
  Future<List<VideoInList>> getItems() async {
    UserFeed feed = await service.getUserFeed(page: page, maxResults: maxResults);
    List<VideoInList> subs = [];
    subs.addAll(feed.notifications ?? []);
    subs.addAll(feed.videos ?? []);
    if (subs.length < maxResults) {
      hasMore = false;
    }
    return subs;
  }

  @override
  Future<List<VideoInList>> getMoreItems() async {
    page = page + 1;
    return getItems();
  }

  @override
  Future<List<VideoInList>> refresh() async {
    page = 1;
    return getItems();
  }

  @override
  bool getHasMore() {
    return hasMore;
  }

  @override
  bool hasRefresh() {
    return true;
  }
}
