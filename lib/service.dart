import 'dart:convert';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/searchHistoryItem.dart';
import 'package:invidious/models/db/videoFilter.dart';
import 'package:invidious/models/dislike.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/searchResult.dart';
import 'package:invidious/models/searchSortBy.dart';
import 'package:invidious/models/searchType.dart';
import 'package:invidious/models/sponsorSegment.dart';
import 'package:invidious/models/userFeed.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:logging/logging.dart';

import 'models/channel.dart';
import 'models/channelPlaylists.dart';
import 'models/channelVideos.dart';
import 'models/db/server.dart';
import 'models/invidiousPublicServer.dart';
import 'models/searchSuggestion.dart';
import 'models/sponsorSegmentTypes.dart';
import 'models/subscription.dart';
import 'models/videoComments.dart';

const GET_INVIDIOUS_PUBLIC_SERVERS = 'https://api.invidious.io/instances.json';
const GET_VIDEO = '/api/v1/videos/:id';
const GET_TRENDING = '/api/v1/trending';
const GET_POPULAR = '/api/v1/popular';
const GET_USER_FEED = '/api/v1/auth/feed';
const SEARCH_SUGGESTIONS = '/api/v1/search/suggestions?q=:query';
const SEARCH = '/api/v1/search';
const STATS = '/api/v1/stats';
const GET_SUBSCIPTIONS = '/api/v1/auth/subscriptions';
const ADD_DELETE_SUBSCRIPTION = '/api/v1/auth/subscriptions/:ucid';
const GET_COMMENTS = '/api/v1/comments/:id';
const GET_CHANNEL = '/api/v1/channels/:id';
const GET_CHANNEL_VIDEOS = '/api/v1/channels/:id/videos';
const GET_CHANNEL_STREAMS = '/api/v1/channels/:id/streams';
const GET_CHANNEL_SHORTS = '/api/v1/channels/:id/shorts';
const GET_SPONSOR_SEGMENTS = 'https://sponsor.ajay.app/api/skipSegments?videoID=:id';
const GET_USER_PLAYLISTS = '/api/v1/auth/playlists';
const POST_USER_PLAYLIST = '/api/v1/auth/playlists';
const GET_CHANNEL_PLAYLISTS = '/api/v1/channels/:id/playlists';
const POST_USER_PLAYLIST_VIDEO = '/api/v1/auth/playlists/:id/videos';
const DELETE_USER_PLAYLIST = '/api/v1/auth/playlists/:id';
const DELETE_USER_PLAYLIST_VIDEO = '/api/v1/auth/playlists/:id/videos/:index';
const GET_PUBLIC_PLAYLIST = '/api/v1/playlists/:id';
const GET_DISLIKES = 'https://returnyoutubedislikeapi.com/votes?videoId=';

const MAX_PING = 9007199254740991;

class Service {
  final log = Logger('Service');
  Client client = Client();

  String urlFormatForLog(Uri? uri) {
    return '${uri?.replace(host: 'xxxxxxxxxx')}';
  }

  handleResponse(Response response) {
    var body = utf8.decode(response.bodyBytes);
    log.info("Response from ${response.request?.method} ${urlFormatForLog(response.request?.url)}, status: ${response.statusCode}");

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
        log.severe('Error while calling service: $error');
        throw InvidiousServiceError(error);
      }

      return decoded;
    } else if (response.statusCode < 200 || response.statusCode >= 400) {
      log.severe('Error making request to ${response.request?.url}, \n status: ${response.statusCode}, \n Body: ${response.body}');
      throw InvidiousServiceError('Couldn\'t make request, response code: ${response.statusCode}');
    }
  }

  bool useProxy() {
    return db.getSettings(USE_PROXY)?.value == 'true';
  }

  Uri buildUrl(String baseUrl, {Map<String, String>? pathParams, Map<String, String?>? query}) {
    try {
      String url = '${db.getCurrentlySelectedServer().url}$baseUrl';

      pathParams?.forEach((key, value) {
        url = url.replaceAll(key, value);
      });

      if (useProxy()) {
        query ??= {};
        query['local'] = 'true';
      }

      List<String> queryStr = [];
      query?.forEach((key, value) {
        if (value != null) {
          queryStr.add('$key=$value');
        }
      });

      if (queryStr.isNotEmpty) {
        url += '?${queryStr.join('&')}';
      }

      var uri = Uri.parse(url);
      log.info('calling ${urlFormatForLog(uri)}');
      return uri;
    } catch (err) {
      log.severe('Couldn\'t build url', err);
      rethrow;
    }
  }

  handleErrors(Response response) {}

  Future<Video> getVideo(String videoId) async {
    final response = await client.get(buildUrl(GET_VIDEO, pathParams: {':id': videoId}), headers: {'Content-Type': 'application/json; charset=utf-16'});

    return Video.fromJson(handleResponse(response));
  }

  Future<String> loginWithCookies(String serverUrl, String username, String password) async {
    try {
      String url = '$serverUrl/login?type=invidious';
      var map = {'email': username, 'password': password};

      final response = await client.post(Uri.parse(url), body: map);
      if (response.statusCode == 302 && response.headers.containsKey('set-cookie')) {
        // we have a cookie to parse
        return response.headers['set-cookie']!.split(';').firstWhere((element) => element.startsWith('SID='));
      } else {
        throw InvidiousServiceError('wrong error code (${response.statusCode}) or no cookie headers: ${response.headers['set-cookie']}');
      }
    } catch (err, stacktrace) {
      if (err is InvidiousServiceError) {
        log.severe('Failed to log in with cookies: \n ${err.message}', err, stacktrace);
      }
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
      log.fine('logged in with token');
      return {'Authorization': 'Bearer ${s.authToken}'};
    } else if (s.sidCookie != null && s.sidCookie!.isNotEmpty) {
      log.fine('logged in with cookie');
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

    final response = await client.get(buildUrl(GET_TRENDING, query: query));

    Iterable i = handleResponse(response);
    var list = List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
    VideoFilter.filterVideos(list);
    return list;
  }

  Future<List<VideoInList>> getPopular() async {
    final response = await client.get(buildUrl(GET_POPULAR));
    Iterable i = handleResponse(response);
    var list = List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
    VideoFilter.filterVideos(list);
    return list;
  }

  Future<SearchResults> search(String query, {SearchType? type, int? page, SearchSortBy? sortBy}) async {
    String countryCode = db.getSettings(BROWSING_COUNTRY)?.value ?? 'US';
    Uri uri = buildUrl(SEARCH, query: {'q': Uri.encodeQueryComponent(query), 'type': type?.name, 'page': page?.toString() ?? '1', 'sort_by': sortBy?.name, 'region': countryCode});
    final response = await client.get(uri);
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

    if (query.isNotEmpty && db.getSettings(USE_SEARCH_HISTORY)?.value == 'true') {
      db.addToSearchHistory(SearchHistoryItem(query, (DateTime.now().millisecondsSinceEpoch / 1000).round()));
    }

    VideoFilter.filterVideos(results.videos);
    return results;
  }

  Future<UserFeed> getUserFeed({int? maxResults, int? page}) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();

    Uri uri = buildUrl(GET_USER_FEED, query: {'max_results': maxResults?.toString(), 'page': page?.toString()});

    var headers = getAuthenticationHeaders(currentlySelectedServer);
    final response = await client.get(uri, headers: headers);
    var feed = UserFeed.fromJson(handleResponse(response));
    VideoFilter.filterVideos(feed.videos);
    VideoFilter.filterVideos(feed.notifications);
    return feed;
  }

  Future<List<SponsorSegment>> getSponsorSegments(String videoId, List<SponsorSegmentType> categories) async {
    try {
      String url = GET_SPONSOR_SEGMENTS.replaceAll(":id", videoId);

      if (categories.isNotEmpty) {
        url += '&categories=[${categories.map((e) => '"${e.name}"').join(",")}]';
      }

      log.info('Calling $url');
      final response = await client.get(Uri.parse(url));
      Iterable i = handleResponse(response);
      return List<SponsorSegment>.from(i.map((e) => SponsorSegment.fromJson(e)));
    } catch (err) {
      return [];
    }
  }

  Future<SearchSuggestion> getSearchSuggestion(String query) async {
    if (query.isEmpty) return SearchSuggestion(query, []);
    final response = await client.get(buildUrl(SEARCH_SUGGESTIONS, pathParams: {":query": Uri.encodeQueryComponent(query)}));
    SearchSuggestion search = SearchSuggestion.fromJson(handleResponse(response));
    if (search.suggestions.any((element) => element.contains(";"))) {
      search.suggestions =
          search.suggestions.map((s) => s.split(";").where((e) => e.isNotEmpty && e.startsWith("&#")).map((e) => String.fromCharCode(int.parse(e.replaceAll("&#", "")))).toList().join("")).toList();
    }

    return search;
  }

  Future<bool> isValidServer(String serverUrl) async {
    String url = serverUrl + STATS;
    log.info('Calling $url');
    final response = await client.get(Uri.parse(url));
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

    var url = buildUrl(ADD_DELETE_SUBSCRIPTION, pathParams: {":ucid": channelId});
    var headers = getAuthenticationHeaders(currentlySelectedServer);

    final response = await client.post(url, headers: headers);
  }

  Future<void> unSubscribe(String channelId) async {
    if (!isLoggedIn()) return;

    var currentlySelectedServer = db.getCurrentlySelectedServer();

    var url = buildUrl(ADD_DELETE_SUBSCRIPTION, pathParams: {":ucid": channelId});
    var headers = getAuthenticationHeaders(currentlySelectedServer);

    final response = await client.delete(url, headers: headers);
    log.info('${response.statusCode} - ${response.body}');
  }

  Future<bool> isSubscribedToChannel(String channelId) async {
    if (!isLoggedIn()) return false;

    var currentlySelectedServer = db.getCurrentlySelectedServer();

    var url = buildUrl(GET_SUBSCIPTIONS);
    var headers = getAuthenticationHeaders(currentlySelectedServer);

    final response = await client.get(url, headers: headers);
    Iterable i = handleResponse(response);

    return List<Subscription>.from(i.map((e) => Subscription.fromJson(e))).indexWhere((element) => element.authorId == channelId) > -1;
  }

  Future<VideoComments> getComments(String videoId, {String? continuation, String? sortBy, String? source}) async {
    Map<String, String> queryStr = {};
    if (continuation != null) queryStr.putIfAbsent('continuation', () => continuation);
    if (sortBy != null) queryStr.putIfAbsent('sort_by', () => sortBy);
    if (source != null) queryStr.putIfAbsent('source', () => source);

    final response = await client.get(buildUrl(GET_COMMENTS, pathParams: {':id': videoId}, query: queryStr));
    return VideoComments.fromJson(handleResponse(response));
  }

  Future<Channel> getChannel(String channelId) async {
    // sometimes the api gives the channel with /channel/<channelid> format
    channelId = channelId.replaceAll("/channel/", '');
    final response = await client.get(buildUrl(GET_CHANNEL, pathParams: {':id': channelId}), headers: {'Content-Type': 'application/json; charset=utf-16'});

    var channel = Channel.fromJson(handleResponse(response));
    VideoFilter.filterVideos(channel.latestVideos);
    return channel;
  }

  Future<VideosWithContinuation> getChannelVideos(String channelId, String? continuation) async {
    Uri uri = buildUrl(GET_CHANNEL_VIDEOS, pathParams: {':id': channelId}, query: {'continuation': continuation});
    final response = await client.get(uri, headers: {'Content-Type': 'application/json; charset=utf-16'});

    var videosWithContinuation = VideosWithContinuation.fromJson(handleResponse(response));
    VideoFilter.filterVideos(videosWithContinuation.videos);
    return videosWithContinuation;
  }

  Future<VideosWithContinuation> getChannelStreams(String channelId, String? continuation) async {
    Uri uri = buildUrl(GET_CHANNEL_STREAMS, pathParams: {':id': channelId}, query: {'continuation': continuation});
    final response = await client.get(uri, headers: {'Content-Type': 'application/json; charset=utf-16'});

    var videosWithContinuation = VideosWithContinuation.fromJson(handleResponse(response));
    VideoFilter.filterVideos(videosWithContinuation.videos);
    return videosWithContinuation;
  }

  Future<VideosWithContinuation> getChannelShorts(String channelId, String? continuation) async {
    Uri uri = buildUrl(GET_CHANNEL_SHORTS, pathParams: {':id': channelId}, query: {'continuation': continuation});
    final response = await client.get(uri, headers: {'Content-Type': 'application/json; charset=utf-16'});

    var videosWithContinuation = VideosWithContinuation.fromJson(handleResponse(response));
    VideoFilter.filterVideos(videosWithContinuation.videos);
    return videosWithContinuation;
  }

  Future<List<Playlist>> getUserPlaylists() async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();

    try {
      var url = buildUrl(GET_USER_PLAYLISTS);
      var headers = getAuthenticationHeaders(currentlySelectedServer);

      final response = await client.get(url, headers: headers);
      Iterable i = handleResponse(response);
      var list = List<Playlist>.from(i.map((e) => Playlist.fromJson(e)));
      for (var pl in list) {
        VideoFilter.filterVideos(pl.videos);
      }
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<ChannelPlaylists> getChannelPlaylists(String channelId, {String? continuation}) async {
    Uri uri = buildUrl(GET_CHANNEL_PLAYLISTS, pathParams: {':id': channelId}, query: {'continuation': continuation});

    final response = await client.get(uri);
    var channelPlaylists = ChannelPlaylists.fromJson(handleResponse(response));
    for (var pl in channelPlaylists.playlists) {
      VideoFilter.filterVideos(pl.videos);
    }
    return channelPlaylists;
  }

  Future<String?> createPlayList(String name, String type) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();

    var url = buildUrl(POST_USER_PLAYLIST);
    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

    Map<String, String> body = {
      'title': name,
      'privacy': type,
    };

    log.info(jsonEncode(body));

    final response = await client.post(url, headers: headers, body: jsonEncode(body));
    Map<String, dynamic> playlist = handleResponse(response);
    return playlist['playlistId'] as String;
  }

  Future<void> addVideoToPlaylist(String playListId, String videoId) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();

    var url = buildUrl(POST_USER_PLAYLIST_VIDEO, pathParams: {":id": playListId});
    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

    Map<String, String> body = {
      'videoId': videoId,
    };

    final response = await client.post(url, headers: headers, body: jsonEncode(body));
    handleResponse(response);
  }

  Future<void> deleteUserPlaylist(String playListId) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();

    var url = buildUrl(DELETE_USER_PLAYLIST, pathParams: {":id": playListId});

    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

    final response = await client.delete(url, headers: headers);
    handleResponse(response);
  }

  Future<void> deleteUserPlaylistVideo(String playListId, String indexId) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();

    var url = buildUrl(DELETE_USER_PLAYLIST_VIDEO, pathParams: {':id': playListId, ':index': indexId});
    var headers = getAuthenticationHeaders(currentlySelectedServer);
    headers['Content-Type'] = 'application/json';

    final response = await client.delete(url, headers: headers);
    handleResponse(response);
  }

  Future<Duration?> pingServer(String url) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    String fullUri = '$url${STATS}';
    log.fine('ping ${fullUri}');
    final response = await client.get(Uri.parse(fullUri), headers: {'Content-Type': 'application/json; charset=utf-16'});

    try {
      handleResponse(response);
      var diff = DateTime.now().millisecondsSinceEpoch - start;
      return Duration(milliseconds: diff);
    } catch (err, stacktrace) {
      log.severe('couldn\;t ping ${url}', err, stacktrace);
      return null;
    }
  }

  Future<List<InvidiousPublicServer>> getPublicServers() async {
    final response = await client.get(Uri.parse(GET_INVIDIOUS_PUBLIC_SERVERS));
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

    final response = await client.get(uri);
    var playlist = Playlist.fromJson(handleResponse(response));
    playlist.removedByFilter = VideoFilter.filterVideos(playlist.videos);

    return playlist;
  }

  Future<Dislike> getDislikes(String videoId) async {
    Uri uri = Uri.parse(GET_DISLIKES + videoId);

    final response = await client.get(uri);
    return Dislike.fromJson(handleResponse(response));
  }
}
