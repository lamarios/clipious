import 'dart:convert';

import 'package:invidious/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:invidious/models/videoInList.dart';

const GET_VIDEO = '/api/v1/videos/:id';
const GET_TRENDING = '/api/v1/trending';
const GET_POPULAR = '/api/v1/popular';

class Service {
  Future<Video> getVideo(String serverUrl, String videoId) async {
    String url = serverUrl + (GET_VIDEO.replaceAll(":id", videoId));
    print('Calling $url');
    final response = await http.get(Uri.parse(url));

    return Video.fromJson(jsonDecode(response.body));
  }

  Future<List<VideoInList>> getTrending(String serverUrl) async {
    String url = serverUrl + (GET_TRENDING);
    print('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = jsonDecode(response.body);
    return List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
  }

  Future<List<VideoInList>> getPopular(String serverUrl) async {
    String url = serverUrl + (GET_POPULAR);
    print('Calling $url');
    final response = await http.get(Uri.parse(url));
    Iterable i = jsonDecode(response.body);
    return List<VideoInList>.from(i.map((e) => VideoInList.fromJson(e)));
  }
}
