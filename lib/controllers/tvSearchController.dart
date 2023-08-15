import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'tvSearchController.g.dart';

class TvSearchCubit extends Cubit<TvSearchController> {
  TvSearchCubit(super.initialState);

  @override
  emit(TvSearchController state) {
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
class TvSearchController {
  FocusNode resultFocus = FocusNode();
  FocusNode searchFocus = FocusNode();

  TvSearchController();
  TvSearchController._(this.resultFocus, this.searchFocus);
}
