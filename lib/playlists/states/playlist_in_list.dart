import 'package:bloc/bloc.dart';

import '../../globals.dart';
import '../models/playlist.dart';

class PlaylistInListCubit extends Cubit<Playlist> {
  PlaylistInListCubit(super.initialState) {
    getThumbnailsFromYoutube();
  }

  Future<void> getThumbnailsFromYoutube() async {
    if (state.videoCount > 0 && state.videos.length < state.videoCount) {
      // something is not right, let's get the full playlist
      Playlist playlist = await service.getPublicPlaylists(state.playlistId);
      if (!isClosed) {
        emit(playlist);
      }
    }
  }
}
