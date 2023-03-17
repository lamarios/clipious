import 'dart:convert';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/searchResult.dart';
import 'package:invidious/models/sponsorSegment.dart';
import 'package:invidious/models/userFeed.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/subscriptions.dart';
import 'package:logging/logging.dart';

import 'models/channel.dart';
import 'models/channelPlaylists.dart';
import 'models/channelVideos.dart';
import 'models/db/server.dart';
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
const SEARCH = '/api/v1/search?q=:q';
const STATS = '/api/v1/stats';
const GET_SUBSCIPTIONS = '/api/v1/auth/subscriptions';
const ADD_DELETE_SUBSCRIPTION = '/api/v1/auth/subscriptions/:ucid';
const GET_COMMENTS = '/api/v1/comments/:id';
const GET_CHANNEL = '/api/v1/channels/:id';
const GET_CHANNEL_VIDEOS = '/api/v1/channels/:id/videos';
const GET_CHANNEL_STREAMS = '/api/v1/channels/:id/streams';
const GET_SPONSOR_SEGMENTS = 'https://sponsor.ajay.app/api/skipSegments?videoID=:id';
const GET_USER_PLAYLISTS = '/api/v1/auth/playlists';
const POST_USER_PLAYLIST = '/api/v1/auth/playlists';
const GET_CHANNEL_PLAYLISTS = '/api/v1/channels/:id/playlists';
const POST_USER_PLAYLIST_VIDEO = '/api/v1/auth/playlists/:id/videos';
const DELETE_USER_PLAYLIST = '/api/v1/auth/playlists/:id';
const DELETE_USER_PLAYLIST_VIDEO = '/api/v1/auth/playlists/:id/videos/:index';
const GET_PUBLIC_PLAYLIST = '/api/v1/playlists/:id';

const MAX_PING = 9007199254740991;

class Service {
  final log = Logger('Service');

  handleResponse(Response response) {
    var body = utf8.decode(response.bodyBytes);

    if (body.isNotEmpty) {
      var decoded = jsonDecode(body);
      String? error;
      try {
        Map<String, dynamic> errorFinder = decoded as Map<String, dynamic>;
        error = errorFinder.containsKey('error') ? decoded['error'] : null;
      } catch (err) {
        // no error we keep going
      }

      if (error != null) {
        log.info('Error while calling service: $error');
        throw InvidiousServiceError(error);
      }

      return decoded;
    } else if (response.statusCode < 200 || response.statusCode >= 400) {
      throw InvidiousServiceError('Couldn\'t make request, response code: ${response.statusCode}');
    }
  }

  Uri buildUrl(String baseUrl, {Map<String, String>? pathParams, Map<String, String?>? query}) {
    try {
      String url = '${db.getCurrentlySelectedServer().url}$baseUrl';

      pathParams?.forEach((key, value) {
        url = url.replaceAll(key, value);
      });

      List<String> queryStr = [];
      query?.forEach((key, value) {
        if (value != null) {
          queryStr.add('$key=$value');
        }
      });

      if (queryStr.isNotEmpty) {
        url += '?${queryStr.join('&')}';
      }

      log.info('calling $url');
      return Uri.parse(url);
    } catch (err) {
      log.info(err);
      rethrow;
    }
  }

  handleErrors(Response response) {}

  Future<Video> getVideo(String videoId) async {
    final response = await http.get(buildUrl(GET_VIDEO, pathParams: {':id': videoId}), headers: {'Content-Type': 'application/json; charset=utf-16'});

    return Video.fromJson(handleResponse(response));
  }

  Future<String> loginWithCookies(String serverUrl, String username, String password) async {
    try {
      String url = '$serverUrl/login?type=invidious';
      var map = {'email': username, 'password': password};

      final response = await http.post(Uri.parse(url), body: map);
      log.info(response.headers);
      if (response.statusCode == 302 && response.headers.containsKey('set-cookie')) {
        // we have a cookie to parse
        return response.headers['set-cookie']!.split(';').firstWhere((element) => element.startsWith('SID='));
      } else {
        throw InvidiousServiceError('wrong error code (${response.statusCode} or no cookie headers ${response.headers['set-cookie']}');
      }
    } catch (err) {
      if (err is InvidiousServiceError) {
        log.info(err.message);
      }

      log.info(err);
      throw InvidiousServiceError('Wrong username or password');
    }
  }

  Future<String?> logIn(String serverUrl) async {
    String url = '$serverUrl/authorize_token?scopes=:feed,:subscriptions*,:playlists*&callback_url=clipious-auth://';
    final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: 'clipious-auth');

    final token = Uri.parse(result).queryParameters['token'];

    Server? server = db.getServer(serverUrl);

    if (server != null) {
      server.authToken = Uri.decodeComponent(token ?? '');

      db.upsertServer(server);

      FBroadcast.instance().broadcast(BROADCAST_SERVER_CHANGED);
      return server.authToken;
    } else {
      throw InvidiousServiceError('logging in to deleted server');
    }
  }

  Map<String, String> getAuthenticationHeaders(Server s) {
    if (s.authToken != null && s.authToken!.isNotEmpty) {
      log.info('logged in with token');
      return {'Authorization': 'Bearer ${s.authToken}'};
    } else if (s.sidCookie != null && s.sidCookie!.isNotEmpty) {
      log.info('logged in with cookie');
      return {'Cookie': s.sidCookie!};
    } else {
      throw InvidiousServiceError('No authentication method provided to access authenticated endpoint');
    }
  }

  Future<List<VideoInList>> getTrending({String? type}) async {
    String countryCode = db.getSettings(BROWSING_COUNTRY)?.value ?? 'US';
    // parse.queryParameters['region'] = countryCode;
    Map<String, String>? query = {'region': countryCode};

    if (type != null) {
      query.putIfAbsent('type', () => type);
    }

    final response = await http.get(buildUrl(GET_TRENDING, query: query));

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

  Future<SearchResults> search(String query) async {
    Uri uri = buildUrl(SEARCH, pathParams: {':q': query});
    final response = await http.get(uri);
    Iterable i = handleResponse(response);
    // only getting videos for now
    SearchResults results = SearchResults();
    try {
      for (var e in i) {
        switch (e['type']) {
          case 'video':
            results.videos.add(VideoInList.fromJson(e));
            break;
          case 'playlist':
            results.playlists.add(Playlist.fromJson(e));
            break;
          case 'channel':
            results.channels.add(Channel.fromJson(e));
        }
      }
    } catch (err) {
      log.info((err as Error).stackTrace?.toString());
      rethrow;
    }
    log.info(results);

    return results;
  }

  Future<UserFeed> getUserFeed({int? maxResults, int? page}) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();

    Uri uri = buildUrl(GET_USER_FEED, query: {'max_results': maxResults?.toString(), 'page': page?.toString()});

    var headers = getAuthenticationHeaders(currentlySelectedServer);
    final response = await http.get(uri, headers: headers);
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
    var headers = getAuthenticationHeaders(currentlySelectedServer);

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
    return db.isLoggedInToCurrentServer();
  }

  Future<void> subscribe(String channelId) async {
    if (!isLoggedIn()) return;

    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + ADD_DELETE_SUBSCRIPTION.replaceAll(":ucid", channelId);

    log.info('Calling $url');
    var headers = getAuthenticationHeaders(currentlySelectedServer);

    final response = await http.post(Uri.parse(url), headers: headers);
  }

  Future<void> unSubscribe(String channelId) async {
    if (!isLoggedIn()) return;

    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + ADD_DELETE_SUBSCRIPTION.replaceAll(":ucid", channelId);

    log.info('Calling $url');
    var headers = getAuthenticationHeaders(currentlySelectedServer);

    final response = await http.delete(Uri.parse(url), headers: headers);
    log.info('${response.statusCode} - ${response.body}');
  }

  Future<bool> isSubscribedToChannel(String channelId) async {
    if (!isLoggedIn()) return false;

    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + GET_SUBSCIPTIONS;

    log.info('Calling $url');
    var headers = getAuthenticationHeaders(currentlySelectedServer);

    final response = await http.get(Uri.parse(url), headers: headers);
    Iterable i = handleResponse(response);

    return List<Subscription>.from(i.map((e) => Subscription.fromJson(e))).indexWhere((element) => element.authorId == channelId) > -1;
  }

  Future<VideoComments> getComments(String videoId, {String? continuation, String? sortBy, String? source}) async {
    Map<String, String> queryStr = {};
    if (continuation != null) queryStr.putIfAbsent('continuation', () => continuation);
    if (sortBy != null) queryStr.putIfAbsent('sort_by', () => sortBy);
    if (source != null) queryStr.putIfAbsent('source', () => source);

    final response = await http.get(buildUrl(GET_COMMENTS, pathParams: {':id': videoId}, query: queryStr));
    return VideoComments.fromJson(handleResponse(response));
  }

  Future<Channel> getChannel(String channelId) async {
    String url = db.getCurrentlySelectedServer().url + (GET_CHANNEL.replaceAll(":id", channelId));
    log.info('Calling $url');
    final response = await http.get(Uri.parse(url), headers: {'Content-Type': 'application/json; charset=utf-16'});

    return Channel.fromJson(handleResponse(response));
  }

  Future<VideosWithContinuation> getChannelVideos(String channelId, String? continuation) async {
    Uri uri = buildUrl(GET_CHANNEL_VIDEOS, pathParams: {':id': channelId}, query: {'continuation': continuation});
    final response = await http.get(uri, headers: {'Content-Type': 'application/json; charset=utf-16'});

    return VideosWithContinuation.fromJson(handleResponse(response));
  }

  Future<VideosWithContinuation> getChannelStreams(String channelId, String? continuation) async {
    Uri uri = buildUrl(GET_CHANNEL_STREAMS, pathParams: {':id': channelId}, query: {'continuation': continuation});
    final response = await http.get(uri, headers: {'Content-Type': 'application/json; charset=utf-16'});

    return VideosWithContinuation.fromJson(handleResponse(response));
  }

  Future<List<Playlist>> getUserPlaylists() async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${GET_USER_PLAYLISTS}';

    log.info('Calling $url');
    var headers = getAuthenticationHeaders(currentlySelectedServer);

    final response = await http.get(Uri.parse(url), headers: headers);
    Iterable i = handleResponse(response);
    return List<Playlist>.from(i.map((e) => Playlist.fromJson(e)));
  }

  Future<ChannelPlaylists> getChannelPlaylists(String channelId, {String? continuation}) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    Uri uri = buildUrl(GET_CHANNEL_PLAYLISTS, pathParams: {':id': channelId}, query: {'continuation': continuation});

    final response = await http.get(uri);
    return ChannelPlaylists.fromJson(handleResponse(response));
  }

  Future<String?> createPlayList(String name, String type) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${POST_USER_PLAYLIST}';

    log.info('Calling $url');
    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

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
    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

    Map<String, String> body = {
      'videoId': videoId,
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    handleResponse(response);
  }

  Future<void> deleteUserPlaylist(String playListId) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${DELETE_USER_PLAYLIST.replaceAll(":id", playListId)}';

    log.info('Calling $url');
    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

    final response = await http.delete(Uri.parse(url), headers: headers);
    handleResponse(response);
  }

  Future<void> deleteUserPlaylistVideo(String playListId, String indexId) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = '${currentlySelectedServer.url}${DELETE_USER_PLAYLIST_VIDEO.replaceAll(":id", playListId).replaceAll(":index", indexId)}';

    log.info('Calling $url');
    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

    final response = await http.delete(Uri.parse(url), headers: headers);
    handleResponse(response);
  }

  Future<Duration?> pingServer(String url) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    String fullUri = '$url${STATS}';
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

  Future<Playlist> getPublicPlaylists(String playlistId, {int? page}) async {
    Uri uri = buildUrl(GET_PUBLIC_PLAYLIST, pathParams: {':id': playlistId}, query: {'page': page?.toString()});

    final response = await http.get(uri);
    return Playlist.fromJson(handleResponse(response));
  }
}
