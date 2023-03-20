import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistListController.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/playlist.dart';
import '../models/video.dart';
import '../models/videoInList.dart';

class PlaylistController extends GetxController {
  final log = Logger('PlaylistController');
  bool playingVideo = false;
  Video? currentlyPlaying;
  int selectedIndex = 0;
  double progress = 0;
  double loadingProgress = 0;
  late Playlist playlist;
  bool loading = false;
  ScrollController scrollController = ScrollController();
  late double playlistItemHeight;

  PlaylistController({required this.playlist, required this.playlistItemHeight});

  static String getTags(String playlistId){
    return 'playlist-$playlistId';
  }

  videoListener(BetterPlayerEvent event) {
    if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
      var progress = (event.parameters?['progress'] as Duration).inSeconds / (currentlyPlaying?.lengthSeconds ?? 1);
      this.progress = progress;
      update();
    }

    if (event.betterPlayerEventType == BetterPlayerEventType.finished) {
      playNextVideo();
    }
  }

  startVideo() async {
    if (playlist.videos.isNotEmpty) {
      if (selectedIndex < playlist.videos.length) {
        scrollController.animateTo(selectedIndex * playlistItemHeight, duration: animationDuration, curve: Curves.easeInOutQuad);
        var vid = await service.getVideo(playlist.videos[selectedIndex].videoId);
        playingVideo = true;
        progress = 0;
        currentlyPlaying = vid;
        update();
      } else {
        selectedIndex = 0;
        update();
        startVideo();
      }
    }
  }

  playVideo(BuildContext context, VideoInList v) {
    int index = playlist.videos.indexWhere((element) => element.videoId == v.videoId);
    if (index >= 0) {
      selectedIndex = index;
      startVideo();
      update();
    }
  }

  playPreviousVideo() {
    int index = selectedIndex - 1;
    if (index < 0) {
      index = playlist.videos.length - 1;
    }

    selectedIndex = index;
    startVideo();
    update();
  }

  playNextVideo() {
    int index = selectedIndex + 1;
    if (index >= playlist.videos.length) {
      index = 0;
    }

    selectedIndex = index;
    startVideo();
    update();
  }

  deletePlaylist() async {
    await service.deleteUserPlaylist(playlist.playlistId);
    Get.find<PlaylistListController>(tag: PlaylistListController.getTag(userPlayListTag)).refreshPlaylists();
  }

  Future<bool> removeVideoFromPlayList(VideoInList v) async {
    bool playing = currentlyPlaying?.videoId == v.videoId;
    int videoCount = playlist.videos.length;
    int index = playlist.videos.indexWhere((element) => element.videoId == v.videoId);

    await service.deleteUserPlaylistVideo(playlist.playlistId, v.indexId ?? '');
    try {
      Get.find<PlaylistListController>(tag: PlaylistListController.getTag(userPlayListTag)).refreshPlaylists();
    }catch(err){
      log.info('tried to refresh playlist view but it was not found');
    }
    if (playing && videoCount >= 2) {
      // we have a fallback video
      playNextVideo();
      var playlist = this.playlist;
      playlist.videos.removeAt(index);
      playlist.videoCount--;

      this.playlist = playlist;
      update();
    } else if (videoCount >= 2) {
      var playlist = this.playlist;
      playlist.videos.removeAt(index);
      playlist.videoCount--;

      this.playlist = playlist;
      update();
    } else if (videoCount < 2) {
      // no more video next;
      return true;
    }

    return false;
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
      startVideo();
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    startVideo();
    getAllVideos();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
