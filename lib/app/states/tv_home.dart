import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:get/get.dart';

class TvHomeCubit extends Cubit<bool> {
  TvHomeCubit(super.initialState);

  menuItemFocusChanged(bool focus) {
    if (focus) {
      EasyDebounce.cancel('expand-home-menu');
      emit(true);
    } else {
      EasyDebounce.debounce('expand-home-menu', const Duration(milliseconds: 50), () {
        emit(false);
      });
    }
  }
}
