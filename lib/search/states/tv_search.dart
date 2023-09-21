import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'tv_search.g.dart';

class TvSearchCubit extends Cubit<TvSearchState> {
  TvSearchCubit(super.initialState);

  @override
  close() async {
    super.close();
    state.resultFocus.dispose();
    state.searchFocus.dispose();
  }

  KeyEventResult handleResultScopeKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.goBack) {
      state.searchFocus.requestFocus();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  setHasVideo(bool hasVideos) {
    emit(state.copyWith(hasVideos: hasVideos));
  }

  setHasChannels(bool hasChannels) {
    emit(state.copyWith(hasChannels: hasChannels));
  }

  setHasPlaylists(bool hasPlaylists) {
    emit(state.copyWith(hasPlaylists: hasPlaylists));
  }
}

@CopyWith(constructor: "_")
class TvSearchState {
  FocusNode resultFocus = FocusNode();
  FocusNode searchFocus = FocusNode();
  ScrollController scrollController = ScrollController();

  bool hasVideos = false, hasChannels = false, hasPlaylists = false;

  TvSearchState();

  TvSearchState._(this.resultFocus, this.searchFocus, this.hasChannels, this.hasVideos, this.hasPlaylists);
}
