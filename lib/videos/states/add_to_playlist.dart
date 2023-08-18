import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:invidious/videos/states/add_to_playlist_button.dart';
import 'package:invidious/videos/states/video_like.dart';

import '../../globals.dart';
import '../../playlists/models/playlist.dart';

part 'add_to_playlist.g.dart';

class AddToPlaylistCubit extends Cubit<AddToPlaylistController> {
  final AddToPlaylistButtonCubit? addToPlaylistButtonCubit;
  final VideoLikeButtonCubit? videoLikeButtonCubit;

  AddToPlaylistCubit(super.initialState, {this.videoLikeButtonCubit, this.addToPlaylistButtonCubit}) {
    onReady();
  }

  bool videoInPlaylist(String playlistId) {
    Playlist? pl = state.playlists.firstWhereOrNull((pl) => pl.playlistId == playlistId);

    return (pl?.videos.indexWhere((element) => element.videoId == state.videoId) ?? -1) >= 0;
  }

  addToPlaylist(String playlistId) async {
    await service.addVideoToPlaylist(playlistId, state.videoId);

    addToPlaylistButtonCubit?.countPlaylistsForVideo();
    videoLikeButtonCubit?.checkVideoLikeStatus();
  }

  Future<void> onReady() async {
    var state = this.state.copyWith();
    if (state.isLoggedIn) {
      state.playlists = await service.getUserPlaylists();
    }
    state.loading = false;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class AddToPlaylistController {
  List<Playlist> playlists = [];
  int playListCount = 0;
  String videoId;

  bool loading = true;
  bool isLoggedIn = service.isLoggedIn();

  AddToPlaylistController(this.videoId);

  AddToPlaylistController._(this.playlists, this.playListCount, this.videoId, this.loading, this.isLoggedIn);
}
