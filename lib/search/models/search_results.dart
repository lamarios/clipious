import 'dart:core';

import '../../channels/models/channel.dart';
import '../../playlists/models/playlist.dart';
import '../../videos/models/video_in_list.dart';

class SearchResults {
  List<VideoInList> videos = [];
  List<Playlist> playlists = [];
  List<Channel> channels = [];
}
