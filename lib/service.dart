import 'dart:convert';

import 'package:invidious/globals.dart';
import 'package:invidious/models/sponsorSegment.dart';
import 'package:invidious/models/userFeed.dart';
import 'package:invidious/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:invidious/models/videoInList.dart';

import 'models/searchSuggestion.dart';

const GET_VIDEO = '/api/v1/videos/:id';
const GET_TRENDING = '/api/v1/trending';
const GET_POPULAR = '/api/v1/popular';
const GET_USER_FEED = '/api/v1/auth/feed';
const SEARCH_SUGGESTIONS = '/api/v1/search/suggestions?q=:query';
const SEARCH = '/api/v1/search?q=:query';
const GET_SPONSOR_SEGMENTS = 'https://sponsor.ajay.app/api/skipSegments?videoID=:id';

class Service {
  Future<Video> getVideo(String videoId) async {
    String url = db.getCurrentlySelectedServer().url + (GET_VIDEO.replaceAll(":id", videoId));
    print('Calling $url');
    final response = await http.get(Uri.parse(url));

    return Video.fromJson(jsonDecode(response.body));
  }

  Future<List<VideoInList>> getTrending() async {
    String url = db.getCurrentlySelectedServer().url + (GET_TRENDING);
    print('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = jsonDecode(response.body);
    return List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
  }

  Future<List<VideoInList>> getPopular() async {
    String url = db.getCurrentlySelectedServer().url + (GET_POPULAR);
    print('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = jsonDecode(response.body);
    return List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
  }

  Future<List<VideoInList>> search(String query) async {
    String url = db.getCurrentlySelectedServer().url + SEARCH.replaceAll(":q", query);
    print('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = jsonDecode(response.body);
    // only getting videos for now
    return List<VideoInList>.from(i.where((e) => e['type'] == 'video').map((e) => VideoInList.fromJson(e)));
  }

  Future<UserFeed> getUserFeed() async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + GET_USER_FEED + "?max_results=20&page=1";

    print('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.get(Uri.parse(url), headers: headers);
    return UserFeed.fromJson(jsonDecode(response.body));
  }

  Future<List<SponsorSegment>> getSponsorSegments(String videoId) async {
    try {
      String url = GET_SPONSOR_SEGMENTS.replaceAll(":id", videoId);
      print('Calling $url');
      final response = await http.get(Uri.parse(url));
      Iterable i = jsonDecode(response.body);
      return List<SponsorSegment>.from(i.map((e) => SponsorSegment.fromJson(e)));
    } catch (err) {
      return [];
    }
  }

  Future<SearchSuggestion> getSearchSuggestion(String query) async {
    var currentlySelectedServer = db.getCurrentlySelectedServer();
    String url = currentlySelectedServer.url + SEARCH_SUGGESTIONS.replaceAll(":query", query);

    print('Calling $url');
    var headers = {'Authorization': 'Bearer ${currentlySelectedServer.authToken}'};

    final response = await http.get(Uri.parse(url), headers: headers);
    return SearchSuggestion.fromJson(jsonDecode(response.body));
  }
}
