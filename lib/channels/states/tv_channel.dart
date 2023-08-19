import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';

part 'tv_channel.g.dart';

class TvChannelCubit extends Cubit<TvChannelController> {
  TvChannelCubit(super.initialState) {
    onReady();
  }

  Future<void> onReady() async {
    state.scrollController.addListener(onScroll);
  }

  @override
  close() async {
    state.scrollController.dispose();
    super.close();
  }

  scrollToTop(bool scroll) {
    if (scroll) {
      state.scrollController.animateTo(0, duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
    }
  }

  // we only update those values if is false because with continuation there could be no new values but we still want to display those
  // meaning we expect it to be modified once.
  setHasPlaylists(bool value) {
    var state = this.state.copyWith();
    if (!state.hasPlaylist) {
      state.hasPlaylist = value;
      emit(state);
    }
  }

  setHasStreams(bool value) {
    var state = this.state.copyWith();
    if (!state.hasStreams) {
      state.hasStreams = value;
      emit(state);
    }
  }

  setHasVideos(bool value) {
    var state = this.state.copyWith();
    if (!state.hasVideos) {
      state.hasVideos = value;
      emit(state);
    }
  }

  setHasShorts(bool value) {
    var state = this.state.copyWith();
    if (!state.hasShorts) {
      state.hasShorts = value;
      emit(state);
    }
  }

  void onScroll() {
    var state = this.state.copyWith();
    if (state.scrollController.offset == 0) {
      state.showBackground = false;
      emit(state);
    } else if (!state.showBackground) {
      state.showBackground = true;
      emit(state);
    }
  }
}

@CopyWith(constructor: "_")
class TvChannelController {
  ScrollController scrollController = ScrollController();
  bool showBackground = false;
  bool hasShorts = false, hasStreams = false, hasVideos = false, hasPlaylist = false;

  TvChannelController();

  TvChannelController._(this.scrollController, this.showBackground, this.hasShorts, this.hasStreams, this.hasVideos, this.hasPlaylist);
}
