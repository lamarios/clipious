import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:invidious/globals.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/sponsorSegment.dart';
import 'package:invidious/models/userFeed.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/subscriptions.dart';
import 'package:logging/logging.dart';

import 'models/channel.dart';
import 'models/channelPlaylists.dart';
import 'models/channelVideos.dart';
import 'models/invidiousPublicServer.dart';
import 'models/searchSuggestion.dart';
import 'models/subscription.dart';
import 'models/videoComments.dart';

const GET_INVIDIOUS_PUBLIC_SERVERS = 'https://api.invidious.io/instances.json';
const GET_VIDEO = '/api/v1/videos/:id';
const GET_TRENDING = '/api/v1/trending';
const GET_POPULAR = '/api/v1/popular';
const GET_USER_FEED = '/api/v1/auth/feed';
const SEARCH_SUGGESTIONS = '/api/v1/search/suggestions?q=:query';
const SEARCH = '/api/v1/search?q=:query';
const STATS = '/api/v1/stats';
const GET_SUBSCIPTIONS = '/api/v1/auth/subscriptions';
const ADD_DELETE_SUBSCRIPTION = '/api/v1/auth/subscriptions/:ucid';
const GET_COMMENTS = '/api/v1/comments/:id';
const GET_CHANNEL = '/api/v1/channels/:id';
const GET_CHANNEL_VIDEOS = '/api/v1/channels/:id/videos';
const GET_SPONSOR_SEGMENTS = 'https://sponsor.ajay.app/api/skipSegments?videoID=:id';
const GET_USER_PLAYLISTS = '/api/v1/auth/playlists';
const POST_USER_PLAYLIST = '/api/v1/auth/playlists';
const GET_CHANNEL_PLAYLISTS = '/api/v1/channels/:id/playlists';
const POST_USER_PLAYLIST_VIDEO = '/api/v1/auth/playlists/:id/videos';

const MAX_PING = 9007199254740991;

class Service {
  final log = Logger('Service');

  handleResponse(Response response) {
    var decoded = jsonDecode(utf8.decode(response.bodyBytes));
    String? error;
    try {
      Map<String, dynamic> errorFinder = decoded as Map<String, dynamic>;
      error = errorFinder.containsKey('error') ? decoded['error'] : null;
    } catch (err) {
      // no error we keep going
    }

    if (error != null) {
      throw InvidiousServiceError(error!);
    }

    return decoded;
  }

  handleErrors(Response response) {}

  Future<Video> getVideo(String videoId) async {
    String url = db.getCurrentlySelectedServer().url + (GET_VIDEO.replaceAll(":id", videoId));
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url), headers: {'Content-Type': 'application/json; charset=utf-16'});

    return Video.fromJson(handleResponse(response));
  }

  Future<List<VideoInList>> getTrending() async {
    String url = db.getCurrentlySelectedServer().url + (GET_TRENDING);
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = handleResponse(response);
    return List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
  }

  Future<List<VideoInList>> getPopular() async {
    String url = db.getCurrentlySelectedServer().url + (GET_POPULAR);
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = handleResponse(response);
    return List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
  }

  Future<List<VideoInList>> search(String query) async {
    String url = db.getCurrentlySelectedServer().url + SEARCH.replaceAll(":q", query);
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = handleResponse(response);
    // only getting videos for now
    return List<VideoInList>.from(i.where((e) => e['type'] == 'video').map((e) => VideoInList.fromJson(e)));
  }

  Future<UserFeed> getUserFeed() async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + GET_USER_FEED;

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.get(Uri.parse(url), headers: headers);
    return UserFeed.fromJson(handleResponse(response));
  }

  Future<List<SponsorSegment>> getSponsorSegments(String videoId) async {
    try {
      String url = GET_SPONSOR_SEGMENTS.replaceAll(":id", videoId);
      log.info('Calling $url');
      final response = await http.get(Uri.parse(url));
      Iterable i = handleResponse(response);
      return List<SponsorSegment>.from(i.map((e) => SponsorSegment.fromJson(e)));
    } catch (err) {
      return [];
    }
  }

  Future<SearchSuggestion> getSearchSuggestion(String query) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + SEARCH_SUGGESTIONS.replaceAll(":query", query);

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.get(Uri.parse(url), headers: headers);
    return SearchSuggestion.fromJson(handleResponse(response));
  }

  Future<bool> isValidServer(String serverUrl) async {
    String url = serverUrl + STATS;
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> json = handleResponse(response);

    if (json.containsKey("software")) {
      return json['software']['name'] == 'invidious';
    }

    return false;
  }

  bool isLoggedIn() {
    return db.getCurrentlySelectedServer().authToken != null;
  }

  Future<void> subscribe(String channelId) async {
    if (!isLoggedIn()) return;

    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + ADD_DELETE_SUBSCRIPTION.replaceAll(":ucid", channelId);

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.post(Uri.parse(url), headers: headers);
  }

  Future<void> unSubscribe(String channelId) async {
    if (!isLoggedIn()) return;

    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + ADD_DELETE_SUBSCRIPTION.replaceAll(":ucid", channelId);

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.delete(Uri.parse(url), headers: headers);
    log.info('${response.statusCode} - ${response.body}');
  }

  Future<bool> isSubscribedToChannel(String channelId) async {
    if (!isLoggedIn()) return false;

    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + GET_SUBSCIPTIONS;

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.get(Uri.parse(url), headers: headers);
    Iterable i = handleResponse(response);

    return List<Subscription>.from(i.map((e) => Subscription.fromJson(e))).indexWhere((element) => element.authorId == channelId) > -1;
  }

  Future<VideoComments> getComments(String videoId, String? continuation) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + GET_COMMENTS.replaceAll(":id", videoId);
    if (continuation != null) {
      url += '?continuation=${continuation}';
    }

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.get(Uri.parse(url), headers: headers);
    return VideoComments.fromJson(handleResponse(response));
  }

  Future<Channel> getChannel(String channelId) async {
    String url = db.getCurrentlySelectedServer().url + (GET_CHANNEL.replaceAll(":id", channelId));
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url), headers: {'Content-Type': 'application/json; charset=utf-16'});

    return Channel.fromJson(handleResponse(response));
  }

  Future<ChannelVideos> getChannelVideos(String channelId, String? continuation) async {
    String url = db.getCurrentlySelectedServer().url + (GET_CHANNEL_VIDEOS.replaceAll(":id", channelId)) + (continuation != null ? '?continuation=$continuation' : '');
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url), headers: {'Content-Type': 'application/json; charset=utf-16'});

    return ChannelVideos.fromJson(handleResponse(response));
  }

  Future<List<Playlist>> getUserPlaylists() async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${GET_USER_PLAYLISTS}';

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.get(Uri.parse(url), headers: headers);
    Iterable i = handleResponse(response);
    return List<Playlist>.from(i.map((e) => Playlist.fromJson(e)));
  }

  Future<ChannelPlaylists> getChannelPlaylists(String channelId, String? continuation) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${GET_CHANNEL_PLAYLISTS.replaceAll(':id', channelId)}${continuation != null ? '?continuation=$continuation' : ''}';

    log.info('Calling $url');

    final response = await http.get(Uri.parse(url));
    return ChannelPlaylists.fromJson(handleResponse(response));
  }

  Future<String?> createPlayList(String name, String type) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${POST_USER_PLAYLIST}';

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}', 'Content-Type': 'application/json'};

    Map<String, String> body = {
      'title': name,
      'privacy': type,
    };

    log.info(jsonEncode(body));

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    Map<String, dynamic> playlist = handleResponse(response);
    return playlist['playlistId'] as String;
  }

  Future<void> addVideoToPlaylist(String playListId, String videoId) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${POST_USER_PLAYLIST_VIDEO.replaceAll(":id", playListId)}';

    log.info('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}', 'Content-Type': 'application/json'};

    Map<String, String> body = {
      'videoId': videoId,
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    handleResponse(response);
  }

  Future<Duration?> pingServer(String url) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    String fullUri = '$url${GET_VIDEO.replaceAll(":id", 'dQw4w9WgXcQ')}';
    log.info('calling ${fullUri}');
    final response = await http.get(Uri.parse(fullUri), headers: {'Content-Type': 'application/json; charset=utf-16'});

    try {
      handleResponse(response);
      var diff = DateTime.now().millisecondsSinceEpoch - start;
      return Duration(milliseconds: diff);
    } catch (err) {
      log.info(err);
      return null;
    }
  }

  Future<List<InvidiousPublicServer>> getPublicServers() async {
    final response = await http.get(Uri.parse(GET_INVIDIOUS_PUBLIC_SERVERS));
    List<InvidiousPublicServer> servers = [];
    Iterable i = handleResponse(response);

    for (var element in i) {
      Iterable s = element as Iterable;
      if (s.length == 2) {
        servers.add(InvidiousPublicServer.fromJson(s.toList()[1] as Map<String, dynamic>));
      }
    }

    return servers.where((s) => (s.api ?? false) && (s.stats?.openRegistrations ?? false)).toList();
  }
}
