import 'package:get/get.dart';

import '../globals.dart';
import '../models/playlist.dart';
import '../models/videoInList.dart';

class PlaylistItemController extends GetxController {
  List<VideoInList> videos = [];
  Playlist playlist;

  PlaylistItemController({required this.playlist});

  static String getTag(String playListId) {
    return 'playlist-item-controller-$playListId';
  }

  getThumbnailsFromYoutube() async {
    if (playlist.videoCount > 0 &&
        playlist.videos.length < playlist.videoCount) {
      // something is not right, let's get the full playlist
      Playlist playlist =
          await service.getPublicPlaylists(this.playlist.playlistId);
      videos = playlist.videos;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getThumbnailsFromYoutube();
  }
}
