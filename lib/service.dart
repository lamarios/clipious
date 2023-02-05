import 'dart:convert';

import 'package:invidious/globals.dart';
import 'package:invidious/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:invidious/models/videoInList.dart';

const GET_VIDEO = '/api/v1/videos/:id';
const GET_TRENDING = '/api/v1/trending';
const GET_POPULAR = '/api/v1/popular';

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
}
