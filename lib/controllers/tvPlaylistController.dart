import 'package:invidious/controllers/playlistController.dart';

class TvPlaylistController extends PlaylistController {
  bool showImage = true;

  @override
  onReady() {
    super.onReady();
  }

  TvPlaylistController({required super.playlist, required super.playlistItemHeight});

  void setShowImage(bool bool) {
    showImage = bool;
    scrollController.jumpTo(0);
    update();
  }
}
