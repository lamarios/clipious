import 'package:get/get.dart';
import 'package:invidious/models/playlist.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/videoInList.dart';
import 'playlistListController.dart';

const String likePlaylistName = '❤️';

class VideoLikeButtonController extends GetxController {
  var log = Logger('VideoLikeButtonController');
  bool isLoggedIn = service.isLoggedIn();
  final String? videoId;
  bool isVideoLiked = false;
  bool loading = false;

  VideoLikeButtonController({this.videoId});

  @override
  onReady() {
    checkVideoLikeStatus();
  }

  Future<Playlist?> getPlaylist() async {
    List<Playlist> playlists = await service.getUserPlaylists();
    return playlists.firstWhereOrNull((pl) => pl.title == likePlaylistName);
  }

  checkVideoLikeStatus() async {
    Playlist? p = await getPlaylist();
    VideoInList? video = p?.videos.firstWhereOrNull((element) => element.videoId == videoId);

    isVideoLiked = video != null;

    update();
  }

  addVideoToPlaylist() {}

  Future<Playlist?> createPlayList() async {
    await service.createPlayList(likePlaylistName, "private");
    return getPlaylist();
  }

  toggleLike() async {
    loading = true;
    update();
    await checkVideoLikeStatus();
    Playlist? p = await getPlaylist();
    p ??= await createPlayList();

    if (p != null && videoId != null) {
      if (isVideoLiked) {
        VideoInList? v = p!.videos.firstWhereOrNull((element) => element.videoId == videoId!);
        if (v?.indexId != null) {
          service.deleteUserPlaylistVideo(p.playlistId, v!.indexId!);
          isVideoLiked = !isVideoLiked;
        }
      } else {
        await service.addVideoToPlaylist(p.playlistId, videoId!);
        isVideoLiked = !isVideoLiked;
      }
    }
    loading = false;
    update();
    PlaylistListController.to(tag: PlaylistListController.getTag(userPlayListTag))?.refreshPlaylists();
  }
}
