import 'dart:core';

import 'package:clipious/videos/models/video.dart';

import '../../channels/models/channel.dart';
import '../../playlists/models/playlist.dart';

class SearchResults {
  List<Video> videos = [];
  List<Playlist> playlists = [];
  List<Channel> channels = [];
}
