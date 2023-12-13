import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<bool> {
  HomeCubit(super.initialState);

  setScroll(bool scrolled) {
    if (scrolled != state) {
      emit(scrolled);
    }
  }
}
