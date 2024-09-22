import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/globals.dart';

part 'tv_video.freezed.dart';

double defaultBottomOffset = -400;

class TvVideoCubit extends Cubit<TvVideoState> {
  final ScrollController scrollController;

  TvVideoCubit(super.initialState, {ScrollController? scrollController})
      : scrollController = scrollController ?? ScrollController();

  @override
  close() async {
    scrollController.dispose();
    super.close();
  }

  scrollUp() {
    var state = this.state.copyWith();
    scrollController.animateTo(0,
        duration: animationDuration ~/ 2, curve: Curves.easeInOutQuad);
    emit(state.copyWith(showImage: true));
  }

  scrollDown() {
    emit(state.copyWith(showImage: false));
  }
}

@freezed
class TvVideoState with _$TvVideoState {
  const factory TvVideoState({@Default(true) bool showImage}) = _TvVideoState;
}
