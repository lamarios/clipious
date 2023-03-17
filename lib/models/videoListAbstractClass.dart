import 'package:invidious/models/userFeed.dart';
import 'package:invidious/models/videoInList.dart';

import '../globals.dart';
import '../views/subscriptions.dart';
import 'channelVideos.dart';

abstract class PaginatedVideoList {
  Future<List<VideoInList>> getVideos();

  Future<List<VideoInList>> getMoreVideos();

  Future<List<VideoInList>> refreshVideos();

  bool hasRefresh();

  bool getHasMore();
}

/// Paginated video list that uses the continuation concept
class ContinuationVideoList extends PaginatedVideoList {
  String? continuation;
  Future<VideosWithContinuation> Function(String? continuation) serviceCall;

  ContinuationVideoList(this.serviceCall);

  @override
  bool getHasMore() {
    return continuation != null;
  }

  @override
  Future<List<VideoInList>> getMoreVideos() async {
    return getVideos();
  }

  @override
  Future<List<VideoInList>> getVideos() async {
    VideosWithContinuation videos = await serviceCall(continuation);

    continuation = videos.continuation;
    return videos.videos;
  }

  @override
  bool hasRefresh() {
    return true;
  }

  @override
  Future<List<VideoInList>> refreshVideos() {
    continuation = null;
    return getVideos();
  }
}

/// Video list with one endpoint call, no pagination or continuation
class SingleEndpointVideoList extends PaginatedVideoList {
  Future<List<VideoInList>> Function() serviceCall;

  SingleEndpointVideoList(this.serviceCall);

  @override
  bool getHasMore() {
    return false;
  }

  @override
  Future<List<VideoInList>> getMoreVideos() async {
    return [];
  }

  @override
  Future<List<VideoInList>> getVideos() async {
    return serviceCall();
  }

  @override
  Future<List<VideoInList>> refreshVideos() async {
    return getVideos();
  }

  @override
  bool hasRefresh() {
    return true;
  }
}

/// List of videos with no service calls, just a plain list
class FixedVideoList extends PaginatedVideoList {
  List<VideoInList> videos;

  FixedVideoList(this.videos);

  @override
  bool getHasMore() {
    return false;
  }

  @override
  Future<List<VideoInList>> getMoreVideos() async {
    return [];
  }

  @override
  Future<List<VideoInList>> getVideos() async {
    return videos;
  }

  @override
  Future<List<VideoInList>> refreshVideos() async {
    return videos;
  }

  @override
  bool hasRefresh() {
    return false;
  }
}

/// User subscriptions
class SubscriptionVideoList extends PaginatedVideoList {
  int page = 1;
  bool hasMore = true;

  @override
  Future<List<VideoInList>> getVideos() async {
    UserFeed feed = await service.getUserFeed(page: page, maxResults: MAX_RESULTS);
    List<VideoInList> subs = [];
    subs.addAll(feed.notifications ?? []);
    subs.addAll(feed.videos ?? []);
    if (subs.length < MAX_RESULTS) {
      hasMore = false;
    }
    return subs;
  }

  @override
  Future<List<VideoInList>> getMoreVideos() async {
    page = page + 1;
    return getVideos();
  }

  @override
  Future<List<VideoInList>> refreshVideos() async {
    page = 1;
    return getVideos();
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
