import 'package:get/get.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/videoInList.dart';
import 'addToPlaylistButtonController.dart';
import 'playlistListController.dart';

const String likePlaylistName = '❤️';

class VideoLikeButtonController extends GetxController {
  static VideoLikeButtonController? to({String? tag}) => safeGet(tag: tag);

  static String tags(String videoId) => 'video-live-button-controller-$videoId';

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
    Playlist? pl =
        playlists.firstWhereOrNull((pl) => pl.title == likePlaylistName);

    return pl;
  }

  checkVideoLikeStatus() async {
    Playlist? p = await getPlaylist();
    VideoInList? video =
        p?.videos.firstWhereOrNull((element) => element.videoId == videoId);

    isVideoLiked = video != null;

    update();

    log.fine('video is currently liked ? $isVideoLiked');
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
        log.fine('Video is liked, unliking it');
        VideoInList? v =
            p.videos.firstWhereOrNull((element) => element.videoId == videoId!);
        if (v?.indexId != null) {
          await service.deleteUserPlaylistVideo(p.playlistId, v!.indexId!);
          isVideoLiked = !isVideoLiked;
        }
      } else {
        log.fine('Video is not liked yet, we add it to the like playlist');
        await service.addVideoToPlaylist(p.playlistId, videoId!);
        isVideoLiked = !isVideoLiked;
      }
    }
    loading = false;
    update();
    PlaylistListController.to(
            tag: PlaylistListController.getTag(userPlayListTag))
        ?.refreshPlaylists();
    AddToPlaylistButtonController.to(
            tag: AddToPlaylistButtonController.tags(videoId ?? ''))
        ?.countPlaylistsForVideo();
  }
}
