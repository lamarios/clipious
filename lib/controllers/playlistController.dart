import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/playlistListController.dart';
import 'package:invidious/views/miniPlayer.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/playlist.dart';
import '../models/video.dart';
import '../models/videoInList.dart';

class PlaylistController extends GetxController {
  final log = Logger('PlaylistController');
  double loadingProgress = 0;
  late Playlist playlist;
  bool loading = false;
  ScrollController scrollController = ScrollController();
  late double playlistItemHeight;

  PlaylistController({required this.playlist, required this.playlistItemHeight});

  static String getTags(String playlistId) {
    return 'playlist-$playlistId';
  }

  deletePlaylist() async {
    await service.deleteUserPlaylist(playlist.playlistId);
    PlaylistListController.to(tag: PlaylistListController.getTag(userPlayListTag))?.refreshPlaylists();
  }

  Future<bool> removeVideoFromPlayList(VideoInList v) async {
    await service.deleteUserPlaylistVideo(playlist.playlistId, v.indexId ?? '');
    PlaylistListController.to(tag: PlaylistListController.getTag(userPlayListTag))?.refreshPlaylists();

    update();

    return false;
  }

  play(){
    MiniPlayerController.to()?.playVideo(playlist.videos,  goBack: false);
  }

  getAllVideos() async {
    if (playlist.videoCount > 0 && playlist.videos.length < playlist.videoCount) {
      loading = true;
      update();
      int page = 1;
      List<VideoInList> videos = [];
      // something is not right, let's get the full playlist
      while (videos.length < playlist.videoCount) {
        Playlist playlist = await service.getPublicPlaylists(this.playlist.playlistId, page: page);
        videos.addAll(playlist.videos);
        page++;

        loadingProgress = videos.length / this.playlist.videoCount;
        update();
      }

      var pl = playlist;
      pl.videos = videos;
      playlist = pl;
      loading = false;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getAllVideos();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
