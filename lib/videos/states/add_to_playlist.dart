import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../../playlists/models/playlist.dart';

part 'add_to_playlist.g.dart';

const String likePlaylistName = '❤️';

class AddToPlaylistCubit extends Cubit<AddToPlaylistController> {

  final log = Logger('AddToPlaylistcubit');

  AddToPlaylistCubit(super.initialState) {
    onReady();
  }

  bool videoInPlaylist(String playlistId) {
    Playlist? pl = state.playlists.firstWhere((pl) => pl.playlistId == playlistId);

    return (pl?.videos.indexWhere((element) => element.videoId == state.videoId) ?? -1) >= 0;
  }

  addToPlaylist(String playlistId) async {
    await service.addVideoToPlaylist(playlistId, state.videoId);
    onReady();
  }

  Future<void> onReady() async {
   await  getAllPlaylists();
   await  countPlaylistsForVideo();
   await  checkVideoLikeStatus();
  }

  getAllPlaylists() async {
    var state = this.state.copyWith();
    if (state.isLoggedIn) {
      state.playlists = await service.getUserPlaylists();
    }
    state.loading = false;
    emit(state);
  }

  Future<Playlist?> getPlaylist() async {
    List<Playlist> playlists = await service.getUserPlaylists();
    Playlist? pl = playlists.firstWhereOrNull((pl) => pl.title == likePlaylistName);

    return pl;
  }

  checkVideoLikeStatus() async {
    var state = this.state.copyWith();
    Playlist? p = await getPlaylist();
    VideoInList? video = p?.videos.firstWhereOrNull((element) => element.videoId == state.videoId);

    state.isVideoLiked = video != null;

    if (!isClosed) {
      emit(state);
      log.fine('video is currently liked ? $state.isVideoLiked');
    }
  }

  Future<Playlist?> createPlayList() async {
    await service.createPlayList(likePlaylistName, "private");
    return getPlaylist();
  }

  countPlaylistsForVideo() async {
    var state = this.state.copyWith();
    List<Playlist> lists = await service.getUserPlaylists();

    state.playListCount =
        lists.where((list) => list.videos.indexWhere((video) => video.videoId == state.videoId) >= 0).length;
    log.fine('playlist count ${state.playListCount}');
    if (!isClosed) {
      emit(state);
    }
  }

  Future<void> toggleLike() async {
    var state = this.state.copyWith();
    state.loading = true;
    emit(state);

    state = this.state.copyWith();
    await checkVideoLikeStatus();
    Playlist? p = await getPlaylist();
    p ??= await createPlayList();

    if (p != null && state.videoId != null) {
      if (state.isVideoLiked) {
        log.fine('Video is liked, unliking it');
        VideoInList? v = p.videos.firstWhereOrNull((element) => element.videoId == state.videoId!);
        if (v?.indexId != null) {
          await service.deleteUserPlaylistVideo(p.playlistId, v!.indexId!);
          state.isVideoLiked = !state.isVideoLiked;
        }
      } else {
        log.fine('Video is not liked yet, we add it to the like playlist');
        await service.addVideoToPlaylist(p.playlistId, state.videoId!);
        state.isVideoLiked = !state.isVideoLiked;
      }
    }
    state.loading = false;
    emit(state);
    onReady();
  }

  saveVideoToPlaylist(String selectedPlaylistId) async {
    await service.addVideoToPlaylist(selectedPlaylistId, state.videoId);
    await onReady();
  }
}

@CopyWith(constructor: "_")
class AddToPlaylistController {
  List<Playlist> playlists = [];
  int playListCount = 0;
  String videoId;
  bool isVideoLiked = false;

  bool loading = true;
  bool isLoggedIn = service.isLoggedIn();

  AddToPlaylistController(this.videoId);

  AddToPlaylistController._(this.playlists, this.playListCount, this.videoId, this.loading, this.isLoggedIn, this.isVideoLiked);
}
