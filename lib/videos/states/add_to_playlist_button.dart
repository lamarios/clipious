import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../../playlists/models/playlist.dart';
import '../../utils.dart';
part 'add_to_playlist_button.g.dart';

var log = Logger('AddToPlaylistButtonController');

class AddToPlaylistButtonCubit extends Cubit<AddToPlaylistButtonState> {
  AddToPlaylistButtonCubit(super.initialState) {
    onReady();
  }

  onReady() {
    countPlaylistsForVideo();
  }

  countPlaylistsForVideo() async {
    var state = this.state.copyWith();
    List<Playlist> lists = await service.getUserPlaylists();

    state.playListCount = lists.where((list) => list.videos.indexWhere((video) => video.videoId == state.videoId) >= 0).length;
    log.fine('playlist count $state.playListCount');
    emit(state);
  }
}

@CopyWith(constructor: "_")
class AddToPlaylistButtonState {
  String? videoId;
  bool isLoggedIn = service.isLoggedIn();

  AddToPlaylistButtonState({this.videoId});

  int playListCount = 0;

  AddToPlaylistButtonState._(this.videoId, this.isLoggedIn, this.playListCount);
}
