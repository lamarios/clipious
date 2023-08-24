import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'home.g.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState);

  setScroll(bool scrolled) {
    if (scrolled != state.scrolled) {
      var state = this.state.copyWith();
      state.scrolled = scrolled;
      emit(state);
    }
  }
}

@CopyWith(constructor: "_")
class HomeState {
  bool scrolled;

  HomeState({this.scrolled = false});

  HomeState._(this.scrolled);
}
