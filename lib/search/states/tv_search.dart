import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'tv_search.g.dart';

class TvSearchCubit extends Cubit<TvSearchState> {
  TvSearchCubit(super.initialState);

  @override
  emit(TvSearchState state) {
    super.emit(state.copyWith());
  }

  @override
  close() async {
    super.close();
    state.resultFocus.dispose();
    state.searchFocus.dispose();
  }

  KeyEventResult handleResultScopeKeyEvent(FocusNode node, KeyEvent event) {
    print(event);
    if (event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.goBack) {
      state.searchFocus.requestFocus();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}

@CopyWith(constructor: "_")
class TvSearchState {
  FocusNode resultFocus = FocusNode();
  FocusNode searchFocus = FocusNode();

  TvSearchState();
  TvSearchState._(this.resultFocus, this.searchFocus);
}
