import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:invidious/player/states/player.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../../videos/models/video_in_list.dart';
import '../models/playlist.dart';

part 'playlist.g.dart';

final log = Logger('PlaylistController');

class PlaylistCubit extends Cubit<PlaylistState> {
  final PlayerCubit player;

  PlaylistCubit(super.initialState, this.player) {
    onReady();
  }

  void onReady() {
    getAllVideos();
  }

  deletePlaylist() async {
    await service.deleteUserPlaylist(state.playlist.playlistId);
  }

  Future<bool> removeVideoFromPlayList(VideoInList v) async {
    var state = this.state.copyWith();
    await service.deleteUserPlaylistVideo(state.playlist.playlistId, v.indexId ?? '');
    state.playlist.videos.remove(v);
    emit(state);

    return false;
  }

  play(bool? isAudio) {
    player.playVideo(state.playlist.videos, goBack: false, audio: isAudio);
  }

  scrollToTop() {
    state.scrollController.animateTo(0, duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
  }

  getAllVideos() async {
    var state = this.state.copyWith();
    if (state.playlist.videoCount > 0 && state.playlist.videos.length < state.playlist.videoCount) {
      int page = 1;
      int totalFiltered = 0;
      // something is not right, let's get the full playlist
      Playlist pl;
      do {
        pl = await service.getPublicPlaylists(state.playlist.playlistId, page: page);

        var toAdd = pl.videos.where((v) => state.playlist.videos.indexWhere((v2) => v2.videoId == v.videoId) == -1).toList();

        if (page == 1) {
          state.playlist.videos = toAdd;
        } else {
          state.playlist.videos.addAll(toAdd);
        }

        totalFiltered += pl.removedByFilter;
        log.fine('filtered removed ${pl.removedByFilter} videos,adding ${pl.videos.length}');
        page++;

        state.loadingProgress = (state.playlist.videos.length + totalFiltered) / state.playlist.videoCount;
        emit(state);
        state = this.state.copyWith();
      } while (pl.videos.isNotEmpty || pl.removedByFilter > 0);

      state = this.state.copyWith();
      state.loading = false;
    } else {
      state.loading = false;
    }
    emit(state);
  }

  @override
  close() async {
    state.scrollController.dispose();
    super.close();
  }

  void setShowImage(bool bool) {
    var state = this.state.copyWith();
    state.showImage = bool;
    state.scrollController.jumpTo(0);
    emit(state);
  }
}

@CopyWith(constructor: "_")
class PlaylistState {
  double loadingProgress = 0;
  Playlist playlist;
  bool loading = true;
  ScrollController scrollController = ScrollController();
  double playlistItemHeight;

  // for TV ui
  bool showImage = true;

  PlaylistState({required this.playlist, required this.playlistItemHeight});

  PlaylistState._(this.showImage, this.loadingProgress, this.playlist, this.loading, this.scrollController, this.playlistItemHeight);
}
