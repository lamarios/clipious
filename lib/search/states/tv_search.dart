import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_search.freezed.dart';

class TvSearchCubit extends Cubit<TvSearchState> {
  final FocusNode resultFocus = FocusNode();
  final FocusNode searchFocus = FocusNode();
  final ScrollController scrollController = ScrollController();

  TvSearchCubit(super.initialState);

  @override
  close() async {
    resultFocus.dispose();
    searchFocus.dispose();
    scrollController.dispose();
    super.close();
  }

  KeyEventResult handleResultScopeKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.goBack) {
      searchFocus.requestFocus();
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

@freezed
class TvSearchState with _$TvSearchState {
  const factory TvSearchState(
      {@Default(false) bool hasVideos,
      @Default(false) bool hasChannels,
      @Default(false) bool hasPlaylists}) = _TvSearchState;
}
