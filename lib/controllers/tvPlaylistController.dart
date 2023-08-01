import 'package:invidious/controllers/playlistController.dart';

class TvPlaylistController extends PlaylistController {
  bool miniTop = false;

  @override
  onReady() {
    super.onReady();
    scrollController.addListener(onScroll);
  }

  TvPlaylistController({required super.playlist, required super.playlistItemHeight});
  void setMiniTop(bool bool) {
    miniTop = bool;
    update();
  }

  void onScroll() {
    if (scrollController.offset == 0) {
      setMiniTop(false);
    } else if (!miniTop) {
      setMiniTop(true);
    }
  }
}
