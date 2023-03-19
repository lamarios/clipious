import 'package:get/get.dart';

import '../globals.dart';
import '../models/playlist.dart';

class AddToPlaylistController extends GetxController {
  List<Playlist> playlists = [];

  bool loading = true;

  addToPlaylist(String playlistId, videoId) async {
    await service.addVideoToPlaylist(playlistId, videoId);
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
