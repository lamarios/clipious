import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/playlistListController.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/playlist.dart';
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
    playlist.videos.remove(v);
    update();

    return false;
  }

  play(bool? isAudio) {
    MiniPlayerController.to()?.playVideo(playlist.videos, goBack: false, audio: isAudio);
  }

  scrollToTop() {
    scrollController.animateTo(0, duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
  }

  getAllVideos() async {
    if (playlist.videoCount > 0 && playlist.videos.length < playlist.videoCount) {
      loading = true;
      update();
      int page = 1;
      int totalFiltered = 0;
      // something is not right, let's get the full playlist
      Playlist pl;
      do {
        pl = await service.getPublicPlaylists(playlist.playlistId, page: page);
        playlist.videos.addAll(pl.videos);

        totalFiltered += pl.removedByFilter;
        log.fine('filtered removed ${pl.removedByFilter} videos');
        page++;

        loadingProgress = (playlist.videos.length + totalFiltered) / playlist.videoCount;
        update();
      } while (pl.videos.isNotEmpty || pl.removedByFilter > 0);

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
