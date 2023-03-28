import 'package:get/get.dart';

import '../globals.dart';
import '../models/playlist.dart';
import '../utils.dart';


class AddToPlaylistButtonController extends GetxController {
  static AddToPlaylistButtonController? to({String? tag}) => safeGet(tag: tag);
  static String? tags(String videoId) => 'add-to-playlist-controller-button-${videoId}';

  String? videoId;
  bool isLoggedIn = service.isLoggedIn();

  AddToPlaylistButtonController({this.videoId});

  int playListCount = 0;

  @override
  onReady() {
    super.onReady();
    countPlaylistsForVideo();
  }

  countPlaylistsForVideo() async {
    List<Playlist> lists = await service.getUserPlaylists();

    playListCount = lists.where((list) => list.videos.indexWhere((video) => video.videoId == videoId) >= 0).length;
    log.info('playlist count $playListCount');
    update();
  }
}
