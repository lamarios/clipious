import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/states/item_list.dart';

import '../models/db/history_video_cache.dart';

part 'history.freezed.dart';

class HistoryCubit extends Cubit<void> {
  final ItemListCubit<String> historyListCubit;

  HistoryCubit(super.initialState, this.historyListCubit);

  removeFromHistory(String videoId) async {
    await service.deleteFromUserHistory(videoId);
    historyListCubit.refreshItems();
  }

  clearHistory() async {
    await service.clearUserHistory();
    historyListCubit.refreshItems();
  }
}

class HistoryItemCubit extends Cubit<HistoryItemState> {
  HistoryItemCubit(super.initialState) {
    onReady();
  }

  void onReady() {
    getVideo();
  }

  getVideo() async {
    emit(state.copyWith(loading: true));

    var cachedVid = await HistoryVideoCache.fromVideoIdToVideo(state.videoId);

    if (!isClosed) {
      emit(state.copyWith(cachedVid: cachedVid, loading: false));
    }
  }
}

@freezed
class HistoryItemState with _$HistoryItemState {
  const factory HistoryItemState(
      {required String videoId,
      @Default(true) bool loading,
      HistoryVideoCache? cachedVid}) = _HistoryItemState;
}
