import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:invidious/globals.dart';

class TvHomeCubit extends Cubit<bool> {
  ScrollController scrollController = ScrollController();
  TvHomeCubit(super.initialState);

  menuItemFocusChanged(bool focus) {
    if (focus) {
      EasyDebounce.cancel('expand-home-menu');
      emit(true);
    } else {
      EasyDebounce.debounce(
          'expand-home-menu', const Duration(milliseconds: 50), () {
        emit(false);
      });
    }
  }

  @override
  close() async {
    scrollController.dispose();
    super.close();
  }

  scrollToTop() {
    scrollController.animateTo(0,
        duration: animationDuration, curve: Curves.easeInOutQuad);
  }
}
