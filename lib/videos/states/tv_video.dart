import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';

part 'tv_video.g.dart';

double defaultBottomOffset = -400;

class TvVideoCubit extends Cubit<TvVideoState> {
  TvVideoCubit(super.initialState);

  @override
  close() async {
    state.scrollController.dispose();
    super.close();
  }

  scrollUp() {
    var state = this.state.copyWith();
    state.scrollController.animateTo(0, duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
    state.showImage = true;
    emit(state);
  }

  scrollDown() {
    var state = this.state.copyWith();
    state.showImage = false;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class TvVideoState {
  final ScrollController scrollController;
  bool showImage = true;

  TvVideoState({ScrollController? scrollController}) : scrollController = scrollController ?? ScrollController();

  TvVideoState._(ScrollController? scrollController, this.showImage) : scrollController = scrollController ?? ScrollController();
}
