import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/globals.dart';

part 'tv_channel.freezed.dart';

class TvChannelCubit extends Cubit<TvChannelController> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey videosTitle = GlobalKey();
  final GlobalKey shortTitle = GlobalKey();
  final GlobalKey streamTitle = GlobalKey();

  GlobalKey playlistsTitle = GlobalKey();

  TvChannelCubit(super.initialState) {
    onReady();
  }

  Future<void> onReady() async {
    scrollController.addListener(onScroll);
  }

  @override
  close() async {
    scrollController.dispose();
    super.close();
  }

  scrollToTop(bool scroll) {
    if (scroll) {
      scrollController.animateTo(0, duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
    }
  }

  // we only update those values if is false because with continuation there could be no new values but we still want to display those
  // meaning we expect it to be modified once.
  setHasPlaylists(bool value) {
    var state = this.state.copyWith();
    if (!state.hasPlaylist) {
      emit(state.copyWith(hasPlaylist: value));
    }
  }

  setHasStreams(bool value) {
    var state = this.state.copyWith();
    if (!state.hasStreams) {
      emit(state.copyWith(hasStreams: value));
    }
  }

  setHasVideos(bool value) {
    var state = this.state.copyWith();
    if (!state.hasVideos) {
      emit(state.copyWith(hasVideos: value));
    }
  }

  setHasShorts(bool value) {
    var state = this.state.copyWith();
    if (!state.hasShorts) {
      emit(state.copyWith(hasShorts: value));
    }
  }

  scrollTo(GlobalKey key, bool focus) {
    if (key.currentContext != null && focus) {
      Scrollable.ensureVisible(key.currentContext!,
          alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
          duration: animationDuration,
          curve: Curves.easeInOutQuad);
    }
  }

  void onScroll() {
    var state = this.state.copyWith();
    if (scrollController.offset == 0) {
      emit(state.copyWith(showBackground: false));
    } else if (!state.showBackground) {
      emit(state.copyWith(showBackground: true));
    }
  }
}

@freezed
class TvChannelController with _$TvChannelController {
  const factory TvChannelController({
    @Default(false) bool showBackground,
    @Default(false) bool hasShorts,
    @Default(false) bool hasVideos,
    @Default(false) bool hasStreams,
    @Default(false) bool hasPlaylist,
  }) = _TvChannelController;
}
