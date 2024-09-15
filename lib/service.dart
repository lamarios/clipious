import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:cronet_http/cronet_http.dart';
import 'package:invidious/channels/models/channel_sort_by.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/playlists/models/playlist.dart';
import 'package:invidious/search/models/search_date.dart';
import 'package:invidious/search/models/search_duration.dart';
import 'package:invidious/search/models/search_results.dart';
import 'package:invidious/search/models/search_sort_by.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/settings/models/errors/cannot_add_server_error.dart';
import 'package:invidious/settings/models/errors/invidious_service_error.dart';
import 'package:invidious/settings/models/errors/missing_software_key.dart';
import 'package:invidious/settings/models/errors/unreacheable_server.dart';
import 'package:invidious/utils/models/imgur_error.dart';
import 'package:invidious/utils/video_post_processing.dart';
import 'package:invidious/videos/models/db/progress.dart';
import 'package:invidious/videos/models/dearrow.dart';
import 'package:invidious/videos/models/dislike.dart';
import 'package:invidious/videos/models/sponsor_segment.dart';
import 'package:invidious/videos/models/user_feed.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:logging/logging.dart';

import 'channels/models/channel.dart';
import 'channels/models/channel_playlists.dart';
import 'channels/models/channel_videos.dart';
import 'comments/models/video_comments.dart';
import 'notifications/models/db/subscription_notifications.dart';
import 'search/models/search_suggestion.dart';
import 'settings/models/db/server.dart';
import 'settings/models/invidious_public_server.dart';
import 'subscription_management/models/subscription.dart';
import 'videos/models/sponsor_segment_types.dart';

const urlGetInvidiousPublicServers = 'https://api.invidious.io/instances.json';
const urlGetVideo = '/api/v1/videos/:id';
const urlGetTrending = '/api/v1/trending';
const urlGetPopular = '/api/v1/popular';
const urlGetUserFeed = '/api/v1/auth/feed';
const urlSearchSuggestions = '/api/v1/search/suggestions';
const urlSearch = '/api/v1/search';
const urlStats = '/api/v1/stats';
const urlGetSubscriptions = '/api/v1/auth/subscriptions';
const urlAddDeleteSubscriptions = '/api/v1/auth/subscriptions/:ucid';
const urlGetComments = '/api/v1/comments/:id';
const urlGetChannel = '/api/v1/channels/:id';
const urlGetChannelVideos = '/api/v1/channels/:id/videos';
const urlGetChannelStreams = '/api/v1/channels/:id/streams';
const urlGetChannelShorts = '/api/v1/channels/:id/shorts';
const urlGetSponsorSegments =
    'https://sponsor.ajay.app/api/skipSegments?videoID=:id';
const urlGetDeArrow = 'https://sponsor.ajay.app/api/branding?videoID=:id';
const urlGetUserPlaylists = '/api/v1/auth/playlists';
const urlGetUserPlaylist = '/api/v1/auth/playlists/:id';
const urlPostUserPlaylists = '/api/v1/auth/playlists';
const urlGetChannelPlaylists = '/api/v1/channels/:id/playlists';
const urlPostUserPlaylistVideo = '/api/v1/auth/playlists/:id/videos';
const urlDeleteUserPlaylist = '/api/v1/auth/playlists/:id';
const urlDeleteUserPlaylistVideo = '/api/v1/auth/playlists/:id/videos/:index';
const urlGetPublicPlaylist = '/api/v1/playlists/:id';
const urlGetDislikes = 'https://returnyoutubedislikeapi.com/votes?videoId=';
const urlGetClearHistory = '/api/v1/auth/history';
const urlAddDeleteHistory = '/api/v1/auth/history/:id';
const urlImgurScreenshotUpload = 'https://api.imgur.com/3/image';

const imgurClientId = 'Client-ID 2cfbc27ce77879d';

const maxPing = 9007199254740991;

class Service {
  final log = Logger('Service');
  final Client httpClient;

  Service()
      : httpClient = Platform.isAndroid
            ? CronetClient.fromCronetEngine(
                CronetEngine.build(
                    cacheMode: CacheMode.memory, cacheMaxSize: 2 * 1024 * 1024),
                closeEngine: true)
            : http.Client();

  String urlFormatForLog(Uri? uri) {
    return kDebugMode ? uri.toString() : '${uri?.replace(host: 'xxxxxxxxxx')}';
  }

  handleResponse(Response response) {
    var body = utf8.decode(response.bodyBytes);
    log.info(
        "Response from ${response.request?.method} ${urlFormatForLog(response.request?.url)}, status: ${response.statusCode}");

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
      log.severe(
          'Error making request to ${response.request?.url}, \n status: ${response.statusCode}, \n Body: ${response.body}');
      throw InvidiousServiceError(
          'Couldn\'t make request, response code: ${response.statusCode}');
    }
  }

  bool useProxy() {
    return db.getSettings(useProxySettingName)?.value == 'true';
  }

  Future<ServerRequest> buildRequest(String baseUrl,
      {Map<String, String>? pathParams,
      Map<String, String?>? query,
      bool authenticated = false,
      bool utf16 = false,
      bool forceJson = false,
      Server? serverOverride}) async {
    try {
      final server = serverOverride ?? (await db.getCurrentlySelectedServer());
      String url = '${(server).url}$baseUrl';

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

      final Map<String, String> headers = Map.from(server.customHeaders);

      if (authenticated) {
        headers.addAll(getAuthenticationHeaders(server));
      }

      if (utf16) {
        headers['Content-Type'] = 'application/json; charset=utf-16';
      }

      if (forceJson) {
        headers['Content-Type'] = 'application/json';
      }

      return ServerRequest(uri: uri, headers: headers);
    } catch (err) {
      log.severe('Couldn\'t build url', err);
      rethrow;
    }
  }

  handleErrors(Response response) {}

  Future<Video> getVideo(String videoId, {Server? serverOverride}) async {
    var req = await buildRequest(urlGetVideo,
        pathParams: {':id': videoId},
        utf16: true,
        serverOverride: serverOverride);
    final response = await httpClient.get(req.uri, headers: req.headers);

    var video = Video.fromJson(handleResponse(response));
    await DeArrow.processVideos([video]);
    video.recommendedVideos =
        (await postProcessVideos(video.recommendedVideos)).cast();
    return video;
  }

  Future<String> loginWithCookies(
      String serverUrl, String username, String password,
      {Map<String, String>? headers}) async {
    try {
      String url = '$serverUrl/login?type=invidious';
      var map = {'email': username, 'password': password};

      final response =
          await httpClient.post(Uri.parse(url), body: map, headers: headers);
      if (response.statusCode == 302 &&
          response.headers.containsKey('set-cookie')) {
        // we have a cookie to parse
        return response.headers['set-cookie']!
            .split(';')
            .firstWhere((element) => element.startsWith('SID='));
      } else {
        throw InvidiousServiceError(
            'wrong error code (${response.statusCode}) or no cookie headers: ${response.headers['set-cookie']}');
      }
    } catch (err, stacktrace) {
      if (err is InvidiousServiceError) {
        log.severe('Failed to log in with cookies: \n ${err.message}', err,
            stacktrace);
      }
      throw InvidiousServiceError('Wrong username or password');
    }
  }

  Future<String?> logIn(String serverUrl) async {
    String url =
        '$serverUrl/authorize_token?scopes=:feed,:subscriptions*,:playlists*,:history*&callback_url=clipious-auth://';
    final result = await FlutterWebAuth.authenticate(
        url: url, callbackUrlScheme: 'clipious-auth');

    final token = Uri.parse(result).queryParameters['token'];

    Server? server = db.getServer(serverUrl);

    if (server != null) {
      server = server.copyWith(authToken: Uri.decodeComponent(token ?? ''));

      await db.upsertServer(server);
      if (server.inUse) {
        fileDb.useServer(server);
      }

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
      throw InvidiousServiceError(
          'No authentication method provided to access authenticated endpoint');
    }
  }

  Future<List<VideoInList>> getTrending({String? type}) async {
    String countryCode = db.getSettings(browsingCountry)?.value ?? 'US';
    // parse.queryParameters['region'] = countryCode;
    Map<String, String>? query = {'region': countryCode};

    if (type != null) {
      query.putIfAbsent('type', () => type);
    }

    var req = await buildRequest(urlGetTrending, query: query);
    final response = await httpClient.get(req.uri, headers: req.headers);

    Iterable i = handleResponse(response);
    var list = List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
    list = (await postProcessVideos(list)).cast();
    return list;
  }

  Future<List<VideoInList>> getPopular() async {
    var req = await buildRequest(urlGetPopular);
    final response = await httpClient.get(req.uri, headers: req.headers);
    Iterable i = handleResponse(response);
    var list = List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
    list = (await postProcessVideos(list)).cast();
    return list;
  }

  Future<SearchResults> search(String query,
      {SearchType? type,
      int? page,
      SearchSortBy? sortBy,
      SearchDate date = SearchDate.any,
      SearchDuration duration = SearchDuration.any}) async {
    String countryCode = db.getSettings(browsingCountry)?.value ?? 'US';
    final req = await buildRequest(urlSearch, query: {
      'q': Uri.encodeQueryComponent(query),
      'type': type?.name,
      'page': page?.toString() ?? '1',
      'sort': sortBy?.name,
      'region': countryCode,
      'date': date != SearchDate.any ? date.name : null,
      'duration': duration != SearchDuration.any ? duration.name : null,
    });
    final response = await httpClient.get(req.uri, headers: req.headers);
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

    results.videos = (await postProcessVideos(results.videos)).cast();
    return results;
  }

  Future<UserFeed> getUserFeed(
      {int? maxResults, int? page, bool saveLastSeen = true}) async {
    // for background service to be able to use
    final req = await buildRequest(urlGetUserFeed,
        query: {
          'max_results': maxResults?.toString(),
          'page': page?.toString()
        },
        authenticated: true);

    final response = await httpClient.get(req.uri, headers: req.headers);
    var feed = UserFeed.fromJson(handleResponse(response));
    feed.videos = (await postProcessVideos(feed.videos ?? [])).cast();
    feed.notifications =
        (await postProcessVideos(feed.notifications ?? [])).cast();

    // we only save the last video seen if we're on the first page otherwise it does not make sense
    if (saveLastSeen && (page ?? 1) == 1) {
      var videos = List.from(feed.notifications ?? [], growable: true);
      videos.addAll(feed.videos ?? []);
      if (videos.isNotEmpty) {
        var toSave = SubscriptionNotification(
            videos.first.videoId, DateTime.now().millisecondsSinceEpoch);
        await fileDb.setLastSubscriptionNotification(toSave);
      }
    }

    return feed;
  }

  Future<List<SponsorSegment>> getSponsorSegments(
      String videoId, List<SponsorSegmentType> categories) async {
    try {
      String url = urlGetSponsorSegments.replaceAll(":id", videoId);

      if (categories.isNotEmpty) {
        url +=
            '&categories=[${categories.map((e) => '"${e.segmentName}"').join(",")}]';
      }

      log.info('Calling $url');
      final response = await httpClient.get(Uri.parse(url));
      Iterable i = handleResponse(response);
      return List<SponsorSegment>.from(
          i.map((e) => SponsorSegment.fromJson(e)));
    } catch (err) {
      return [];
    }
  }

  Future<DeArrow?> getDeArrow(String videoId) async {
    try {
      String url = urlGetDeArrow.replaceAll(":id", videoId);

      log.fine("calling $url");
      final response = await httpClient.get((Uri.parse(url)));
      var body = utf8.decode(response.bodyBytes);
      var deArrow = DeArrow.fromJson(jsonDecode(body));
      deArrow.videoId = videoId;
      return deArrow;
    } catch (err) {
      return null;
    }
  }

  Future<bool> testDeArrowThumbnail(String? url) async {
    if (url != null) {
      final response = await httpClient.head(Uri.parse(url));
      log.fine("calling $url => ${response.statusCode}");
      return response.statusCode == 200;
    } else {
      return false;
    }
  }

  Future<SearchSuggestion> getSearchSuggestion(String query) async {
    if (query.isEmpty) return SearchSuggestion(query, []);
    var request = await buildRequest(urlSearchSuggestions,
        query: {"q": Uri.encodeQueryComponent(query)});
    final response =
        await httpClient.get(request.uri, headers: request.headers);
    SearchSuggestion search =
        SearchSuggestion.fromJson(handleResponse(response));
    if (search.suggestions.any((element) => element.contains(";"))) {
      search.suggestions = search.suggestions
          .map((s) => s.replaceAll(" ", "&#32;").replaceAllMapped(
              RegExp(r"&#\w*;"),
              (m) => String.fromCharCode(
                  int.parse(m[0]!.replaceAll(RegExp(r"&#|;"), "")))))
          .toList();
    }

    return search;
  }

  Future<void> validateServer(
      String serverUrl, Map<String, String>? headers) async {
    try {
      String url = serverUrl + urlStats;
      log.info('Calling $url');
      final response = await httpClient.get(Uri.parse(url), headers: headers);
      Map<String, dynamic> json = handleResponse(response);

      if (json.containsKey("software") &&
          json['software']['name'] == 'invidious') {
        return;
      } else {
        throw MissingSoftwareKeyError(jsonEncode(json));
      }
    } catch (err) {
      if (err is InvidiousServiceError) {
        throw UnreachableServerError(error: err.message);
      } else if (err is CannotAddServerError) {
        rethrow;
      } else {
        throw CannotAddServerError(error: err.toString());
      }
    }
  }

  Future<bool> isLoggedIn() async {
    return await db.isLoggedInToCurrentServer();
  }

  Future<bool> subscribe(String channelId) async {
    if (!await isLoggedIn()) return false;
    final req = await buildRequest(urlAddDeleteSubscriptions,
        pathParams: {":ucid": channelId}, authenticated: true);

    final response = await httpClient.post(req.uri, headers: req.headers);
    log.info('${response.statusCode} - ${response.body}');

    if (response.statusCode == 204 || response.statusCode == 403) {
      return response.statusCode == 204;
    } else {
      throw InvidiousServiceError("Couldn't subscribe to channel");
    }
  }

  Future<bool> unSubscribe(String channelId) async {
    if (!await isLoggedIn()) return false;

    final req = await buildRequest(urlAddDeleteSubscriptions,
        pathParams: {":ucid": channelId}, authenticated: true);

    final response = await httpClient.delete(req.uri, headers: req.headers);
    log.info('${response.statusCode} - ${response.body}');

    if (response.statusCode == 204 || response.statusCode == 403) {
      return response.statusCode == 204;
    } else {
      throw InvidiousServiceError("Couldn't subscribe to channel");
    }
  }

  Future<bool> isSubscribedToChannel(String channelId) async {
    if (!await isLoggedIn()) return false;

    return (await getSubscriptions())
            .indexWhere((element) => element.authorId == channelId) >
        -1;
  }

  Future<List<Subscription>> getSubscriptions() async {
    if (!await isLoggedIn()) return [];

    var req = await buildRequest(urlGetSubscriptions, authenticated: true);

    final response = await httpClient.get(req.uri, headers: req.headers);
    Iterable i = handleResponse(response);

    return List<Subscription>.from(i.map((e) => Subscription.fromJson(e)));
  }

  Future<VideoComments> getComments(String videoId,
      {String? continuation, String? sortBy, String? source}) async {
    Map<String, String> queryStr = {};
    if (continuation != null) {
      queryStr.putIfAbsent('continuation', () => continuation);
    }
    if (sortBy != null) queryStr.putIfAbsent('sort_by', () => sortBy);
    if (source != null) queryStr.putIfAbsent('source', () => source);

    var req = await buildRequest(urlGetComments,
        pathParams: {':id': videoId}, query: queryStr);
    final response = await httpClient.get(req.uri, headers: req.headers);
    return VideoComments.fromJson(handleResponse(response));
  }

  Future<Channel> getChannel(String channelId) async {
    // sometimes the api gives the channel with /channel/<channelid> format
    channelId = channelId.replaceAll("/channel/", '');
    var req = await buildRequest(urlGetChannel,
        pathParams: {':id': channelId}, utf16: true);

    final response = await httpClient.get(req.uri, headers: req.headers);

    var channel = Channel.fromJson(handleResponse(response));
    channel.latestVideos =
        (await postProcessVideos(channel.latestVideos ?? [])).cast();

    if (channel.latestVideos != null && channel.latestVideos!.isNotEmpty) {
      await fileDb.setChannelNotificationLastViewedVideo(
          channel.authorUrl, channel.latestVideos![0].videoId);
    }
    return channel;
  }

  Future<VideosWithContinuation> getChannelVideos(
      String channelId, String? continuation,
      {bool saveLastSeen = true,
      ChannelSortBy sortBy = ChannelSortBy.newest}) async {
    final req = await buildRequest(urlGetChannelVideos,
        pathParams: {':id': channelId},
        query: {
          'continuation': continuation,
          'sort_by': sortBy.name,
        },
        utf16: true);
    final response = await httpClient.get(req.uri, headers: req.headers);

    var videosWithContinuation =
        VideosWithContinuation.fromJson(handleResponse(response));
    videosWithContinuation.videos =
        (await postProcessVideos(videosWithContinuation.videos)).cast();

    if (saveLastSeen && videosWithContinuation.videos.isNotEmpty) {
      await fileDb.setChannelNotificationLastViewedVideo(
          channelId, videosWithContinuation.videos.first.videoId);
    }
    return videosWithContinuation;
  }

  Future<VideosWithContinuation> getChannelStreams(
      String channelId, String? continuation) async {
    final req = await buildRequest(urlGetChannelStreams,
        pathParams: {':id': channelId},
        query: {'continuation': continuation},
        utf16: true);
    final response = await httpClient.get(req.uri, headers: req.headers);

    var videosWithContinuation =
        VideosWithContinuation.fromJson(handleResponse(response));
    videosWithContinuation.videos =
        (await postProcessVideos(videosWithContinuation.videos)).cast();
    return videosWithContinuation;
  }

  Future<VideosWithContinuation> getChannelShorts(
      String channelId, String? continuation) async {
    final req = await buildRequest(urlGetChannelShorts,
        pathParams: {':id': channelId},
        query: {'continuation': continuation},
        utf16: true);
    final response = await httpClient.get(req.uri, headers: req.headers);

    var videosWithContinuation =
        VideosWithContinuation.fromJson(handleResponse(response));
    videosWithContinuation.videos =
        (await postProcessVideos(videosWithContinuation.videos)).cast();
    return videosWithContinuation;
  }

  Future<List<Playlist>> getUserPlaylists({bool postProcessing = true}) async {
    try {
      var req = await buildRequest(urlGetUserPlaylists, authenticated: true);

      final response = await httpClient.get(req.uri, headers: req.headers);
      Iterable i = handleResponse(response);
      var list = List<Playlist>.from(i.map((e) => Playlist.fromJson(e)));
      if (postProcessing) {
        for (var pl in list) {
          pl.videos = (await postProcessVideos(pl.videos)).cast();
        }
      }
      return list.sortByReversed((e) => e.updated ?? 0).toList();
    } catch (e) {
      return [];
    }
  }

  Future<ChannelPlaylists> getChannelPlaylists(String channelId,
      {String? continuation}) async {
    final req = await buildRequest(urlGetChannelPlaylists,
        pathParams: {':id': channelId}, query: {'continuation': continuation});

    final response = await httpClient.get(req.uri, headers: req.headers);
    var channelPlaylists = ChannelPlaylists.fromJson(handleResponse(response));
    for (var pl in channelPlaylists.playlists) {
      pl.videos = (await postProcessVideos(pl.videos)).cast();
    }
    return channelPlaylists;
  }

  Future<String?> createPlayList(String name, String type) async {
    var req = await buildRequest(urlPostUserPlaylists,
        authenticated: true, forceJson: true);

    Map<String, String> body = {
      'title': name,
      'privacy': type,
    };

    log.info(jsonEncode(body));

    final response = await httpClient.post(req.uri,
        headers: req.headers, body: jsonEncode(body));
    Map<String, dynamic> playlist = handleResponse(response);
    return playlist['playlistId'] as String;
  }

  Future<void> addVideoToPlaylist(String playListId, String videoId) async {
    var req = await buildRequest(urlPostUserPlaylistVideo,
        pathParams: {":id": playListId}, authenticated: true, forceJson: true);

    Map<String, String> body = {
      'videoId': videoId,
    };

    final response = await httpClient.post(req.uri,
        headers: req.headers, body: jsonEncode(body));
    handleResponse(response);
  }

  Future<void> deleteUserPlaylist(String playListId) async {
    var req = await buildRequest(urlDeleteUserPlaylist,
        pathParams: {":id": playListId}, authenticated: true, forceJson: true);

    final response = await httpClient.delete(req.uri, headers: req.headers);
    handleResponse(response);
  }

  Future<void> deleteUserPlaylistVideo(
      String playListId, String indexId) async {
    final req = await buildRequest(urlDeleteUserPlaylistVideo,
        pathParams: {':id': playListId, ':index': indexId},
        authenticated: true,
        forceJson: true);

    final response = await httpClient.delete(req.uri, headers: req.headers);
    handleResponse(response);
  }

  Future<List<String>> getUserHistory(int page, int maxResults) async {
    final req = await buildRequest(urlGetClearHistory,
        query: {'page': page.toString(), 'max_results': maxResults.toString()},
        authenticated: true,
        forceJson: true);

    final response = await httpClient.get(req.uri, headers: req.headers);
    Iterable i = handleResponse(response);

    return List<String>.from(i.map((e) => e as String));
  }

  void syncHistory() async {
    try {
      if (await db.isLoggedInToCurrentServer()) {
        (await getUserHistory(1, 200))
            .where((element) => db.getVideoProgress(element) == 0)
            .forEach((element) async {
          await db.saveProgress(Progress.named(progress: 1, videoId: element));
          log.fine('updated watch status of $element');
        });
      }
    } catch (err) {
      log.fine('failed to sync history, probably not logged in');
    }
  }

  Future<void> clearUserHistory() async {
    var req = await buildRequest(urlGetClearHistory,
        authenticated: true, forceJson: true);

    final response = await httpClient.delete(req.uri, headers: req.headers);
    handleResponse(response);
  }

  Future<void> deleteFromUserHistory(String videoId) async {
    var req = await buildRequest(urlAddDeleteHistory,
        pathParams: {':id': videoId}, authenticated: true, forceJson: true);
    final response = await httpClient.delete(req.uri, headers: req.headers);
    handleResponse(response);
  }

  Future<void> addToUserHistory(String videoId) async {
    var req = await buildRequest(urlAddDeleteHistory,
        pathParams: {':id': videoId}, authenticated: true, forceJson: true);

    final response = await httpClient.post(req.uri, headers: req.headers);
    handleResponse(response);
  }

  Future<Duration?> pingServer(String url) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    String fullUri = '$url$urlStats';
    log.fine('ping $fullUri');
    final response = await httpClient.get(Uri.parse(fullUri),
        headers: {'Content-Type': 'application/json; charset=utf-16'});

    try {
      handleResponse(response);
      var diff = DateTime.now().millisecondsSinceEpoch - start;
      return Duration(milliseconds: diff);
    } catch (err, stacktrace) {
      log.severe('couldn;t ping $url', err, stacktrace);
      return null;
    }
  }

  Future<List<InvidiousPublicServer>> getPublicServers() async {
    final response =
        await httpClient.get(Uri.parse(urlGetInvidiousPublicServers));
    List<InvidiousPublicServer> servers = [];
    Iterable i = handleResponse(response);

    for (var element in i) {
      Iterable s = element as Iterable;
      if (s.length == 2) {
        servers.add(InvidiousPublicServer.fromJson(
            s.toList()[1] as Map<String, dynamic>));
      }
    }

    return servers
        .where((s) => (s.api ?? false) && (s.stats?.openRegistrations ?? false))
        .toList();
  }

  Future<Playlist> getPublicPlaylists(String playlistId,
      {int? page, bool saveLastSeen = true}) async {
    final req = await buildRequest(urlGetPublicPlaylist,
        pathParams: {':id': playlistId}, query: {'page': page?.toString()});

    final response = await httpClient.get(req.uri, headers: req.headers);
    var playlist = Playlist.fromJson(handleResponse(response));
    var oldLength = playlist.videos.length;
    playlist.videos = (await postProcessVideos(playlist.videos)).cast();
    playlist.removedByFilter = oldLength - playlist.videos.length;

    if (saveLastSeen) {
      await fileDb.setPlaylistNotificationLastViewedVideo(
          playlist.playlistId, playlist.videoCount);
    }

    return playlist;
  }

  Future<Playlist> getUserPlaylist(String playlistId) async {
    final req = await buildRequest(urlGetUserPlaylist,
        pathParams: {':id': playlistId}, authenticated: true);

    final response = await httpClient.get(req.uri, headers: req.headers);
    var playlist = Playlist.fromJson(handleResponse(response));
    var oldLength = playlist.videos.length;
    playlist.videos = (await postProcessVideos(playlist.videos)).cast();
    playlist.removedByFilter = oldLength - playlist.videos.length;

    return playlist;
  }

  Future<Dislike> getDislikes(String videoId) async {
    final customUrl =
        db.getSettings(returnYoutubeDislikeUrlSettingName)?.value ?? '';

    Uri uri = Uri.parse((customUrl.trim().isNotEmpty
            ? '${customUrl}votes?videoId='
            : urlGetDislikes) +
        videoId);

    final response = await httpClient.get(uri);
    return Dislike.fromJson(handleResponse(response));
  }

  Future<String> uploadImageToImgur(String base64Image) async {
    Uri uri = Uri.parse(urlImgurScreenshotUpload);
    final headers = {'Authorization': imgurClientId};

    final data = <String, String>{'image': base64Image};

    final response = await httpClient.post(uri, headers: headers, body: data);
    if (response.statusCode != 200) {
      throw ImgurError("Non 200 response from Imgur (${response.statusCode})");
    } else {
      var body = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> decoded = jsonDecode(body);

      if (decoded.containsKey('data')) {
        final Map<String, dynamic> data = decoded['data'];

        if (data.containsKey('link')) {
          return data['link'].toString();
        } else {
          throw ImgurError("Response does not containt 'link' key");
        }
      } else {
        throw ImgurError("Response does not containt 'data' key");
      }
    }
  }
}

class ServerRequest {
  final Uri uri;
  final Map<String, String> headers;

  ServerRequest({required this.uri, required this.headers});
}
