import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/models/image_object.dart';
import 'package:invidious/utils/states/item_list.dart';

import '../models/db/history_video_cache.dart';

part 'history.g.dart';

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
    var state = this.state.copyWith();
    state = this.state.copyWith();
    state.loading = true;
    emit(state);

    state = state.copyWith();

    state.cachedVid = await HistoryVideoCache.fromVideoIdToVideo(state.videoId);

    state.loading = false;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class HistoryItemState {
  final String videoId;
  bool loading = true;
  HistoryVideoCache? cachedVid;

  HistoryItemState({required this.videoId});

  HistoryItemState._(this.videoId, this.loading, this.cachedVid);
}
