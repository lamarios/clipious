import 'package:bloc/bloc.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/player/states/player.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../models/playlist.dart';

part 'playlist.freezed.dart';

final log = Logger('PlaylistController');

class PlaylistCubit extends Cubit<PlaylistState> {
  ScrollController scrollController = ScrollController();
  final PlayerCubit player;

  PlaylistCubit(super.initialState, this.player) {
    onReady();
  }

  void onReady() {
    getAllVideos();
  }

  void refreshPlaylist({required bool userPlaylist}) async {
    if (userPlaylist) {
      emit(state.copyWith(loading: true));
      final playlist = await service.getUserPlaylist(state.playlist.playlistId);
      emit(state.copyWith(loading: false, playlist: playlist));
    }
  }

  deletePlaylist() async {
    await service.deleteUserPlaylist(state.playlist.playlistId);
  }

  Future<bool> removeVideoFromPlayList(Video v) async {
    emit(state.copyWith(loading: true));
    await service.deleteUserPlaylistVideo(
        state.playlist.playlistId, v.indexId ?? '');
    var videos = List<Video>.from(state.playlist.videos);
    videos.remove(v);
    var playlist = state.playlist.copyWith(videos: videos);
    emit(state.copyWith(playlist: playlist, loading: false));
    return false;
  }

  play(bool? isAudio) {
    player.playVideo(state.playlist.videos, audio: isAudio);
  }

  scrollToTop() {
    scrollController.animateTo(0,
        duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
  }

  getAllVideos() async {
    if (state.playlist.videoCount > 0 &&
        state.playlist.videos.length < state.playlist.videoCount) {
      int page = 1;
      int totalFiltered = 0;
      // something is not right, let's get the full playlist
      Playlist pl;
      do {
        pl = await service.getPublicPlaylists(state.playlist.playlistId,
            page: page);

        var toAdd = pl.videos
            .where((v) =>
                state.playlist.videos
                    .indexWhere((v2) => v2.videoId == v.videoId) ==
                -1)
            .toList();

        var playlist = state.playlist;
        List<Video> videos = List.from(playlist.videos);
        videos.addAll(toAdd);
        playlist = playlist.copyWith(videos: videos);

        totalFiltered += pl.removedByFilter;
        log.fine(
            'filtered removed ${pl.removedByFilter} videos,adding ${pl.videos.length}');
        page++;

        var loadingProgress = (state.playlist.videos.length + totalFiltered) /
            state.playlist.videoCount;
        if (!isClosed) {
          emit(state.copyWith(
              loadingProgress: loadingProgress, playlist: playlist));
        } else {
          return;
        }
      } while (!isClosed && pl.videos.isNotEmpty || pl.removedByFilter > 0);
    }
    if (!isClosed) emit(state.copyWith(loading: false));
  }

  @override
  close() async {
    scrollController.dispose();
    super.close();
  }

  void setShowImage(bool bool) {
    scrollController.jumpTo(0);
    emit(state.copyWith(showImage: bool));
  }
}

@freezed
sealed class PlaylistState with _$PlaylistState {
  const factory PlaylistState({
    @Default(0) double loadingProgress,
    required Playlist playlist,
    @Default(true) bool loading,
    required double playlistItemHeight,
    @Default(true) bool showImage,
  }) = _PlaylistState;
}
