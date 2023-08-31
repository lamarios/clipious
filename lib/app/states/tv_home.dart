import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:invidious/globals.dart';

part 'tv_home.g.dart';

class TvHomeCubit extends Cubit<TvHomeState> {
  TvHomeCubit(super.initialState);

  menuItemFocusChanged(bool focus) {
    if (focus) {
      EasyDebounce.cancel('expand-home-menu');
      emit(state.copyWith(expandMenu: true));
    } else {
      EasyDebounce.debounce('expand-home-menu', const Duration(milliseconds: 50), () {
        emit(state.copyWith(expandMenu: false));
      });
    }
  }

  scrollToTop(){
    state.scrollController.animateTo(0, duration: animationDuration, curve: Curves.easeInOutQuad);
  }
}

@CopyWith(constructor: "_")
class TvHomeState{
   bool expandMenu = false;
   ScrollController scrollController = ScrollController();

   TvHomeState();

  TvHomeState._(this.expandMenu, this.scrollController);
}
