import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:invidious/playlists/models/playlist.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../models/video_in_list.dart';
import 'add_to_playlist_button.dart';

part 'video_like.g.dart';

const String likePlaylistName = '❤️';

final log = Logger('VideoLikeButtonController');

class VideoLikeButtonCubit extends Cubit<VideoLikeButtonController> {
  final AddToPlaylistButtonCubit addToPlaylistButtonCubit;
  //TODO: need add to playlistbutton cubit
  VideoLikeButtonCubit(super.initialState, {required this.addToPlaylistButtonCubit}) {
    onReady();
  }

  onReady() {
    checkVideoLikeStatus();
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

    emit(state);

    log.fine('video is currently liked ? $state.isVideoLiked');
  }

  addVideoToPlaylist() {}

  Future<Playlist?> createPlayList() async {
    await service.createPlayList(likePlaylistName, "private");
    return getPlaylist();
  }

  toggleLike() async {
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

    //TODO: Updat app playlistbutton cubit
    addToPlaylistButtonCubit.countPlaylistsForVideo();
  }
}

@CopyWith(constructor: "_")
class VideoLikeButtonController {
  bool isLoggedIn = service.isLoggedIn();
  final String? videoId;
  bool isVideoLiked = false;
  bool loading = false;

  VideoLikeButtonController({this.videoId});

  VideoLikeButtonController._(this.isLoggedIn, this.videoId, this.isVideoLiked, this.loading);
}
