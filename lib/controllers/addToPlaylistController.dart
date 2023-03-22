import 'package:get/get.dart';
import 'package:invidious/controllers/addToPlaylistButtonController.dart';
import 'package:invidious/controllers/videoLikeController.dart';

import '../globals.dart';
import '../models/playlist.dart';

class AddToPlaylistController extends GetxController {
  List<Playlist> playlists = [];
  int playListCount = 0;
  String videoId;

  bool loading = true;

  AddToPlaylistController(this.videoId);

  bool videoInPlaylist(String playlistId) {
    Playlist? pl = playlists.firstWhereOrNull((pl) => pl.playlistId == playlistId);

    return (pl?.videos.indexWhere((element) => element.videoId == videoId) ?? -1) >= 0;
  }

  addToPlaylist(String playlistId) async {
    await service.addVideoToPlaylist(playlistId, videoId);

    AddToPlaylistButtonController.to(tag: AddToPlaylistButtonController.tags(videoId))?.countPlaylistsForVideo();
    VideoLikeButtonController.to(tag: VideoLikeButtonController.tags(videoId))?.checkVideoLikeStatus();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    List<Playlist> pl = await service.getUserPlaylists();
    loading = false;
    playlists = pl;
    update();
  }
}
