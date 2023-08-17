import 'package:bloc/bloc.dart';

import '../../globals.dart';
import '../models/playlist.dart';
import '../../videos/models/video_in_list.dart';

class PlaylistInListCubit extends Cubit<Playlist> {
  PlaylistInListCubit(super.initialState);

  Future<List<VideoInList>> getThumbnailsFromYoutube() async {
    if (state.videoCount > 0 && state.videos.length < state.videoCount) {
      // something is not right, let's get the full playlist
      Playlist playlist = await service.getPublicPlaylists(state.playlistId);
      return playlist.videos;
    } else {
      return state.videos;
    }
  }
}
