import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/utils/models/paginatedList.dart';

part 'paginated_list_view.freezed.dart';

class PaginatedListCubit<T> extends Cubit<PaginatedListViewController<T>> {
  final ScrollController scrollController = ScrollController();

  PaginatedListCubit(super.initialState) {
    onInit();
  }

  void onInit() {
    scrollController.addListener(getMore);
    getItems();
  }

  @override
  close() async {
    scrollController.dispose();
    super.close();
  }

  getItems() async {
    emit(state.copyWith(loading: true));
    var items = await state.paginatedList.getItems();

    emit(state.copyWith(loading: false, items: items));
  }

  getMore() {
    if (state.paginatedList.getHasMore()) {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent * 0.9 <
            scrollController.offset) {
          EasyDebounce.debounce(
              'get-more-playlists', const Duration(milliseconds: 250),
              () async {
            emit(state.copyWith(loading: true));

            List<T> i = await state.paginatedList.getMoreItems();
            var items = List<T>.from(state.items)..addAll(i);
            emit(state.copyWith(items: items, loading: false));
          });
        }
      }
    }
  }
}

@freezed
class PaginatedListViewController<T> with _$PaginatedListViewController<T> {
  const factory PaginatedListViewController(
      {required PaginatedList<T> paginatedList,
      @Default([]) List<T> items,
      @Default(false) bool loading}) = _PaginatedListViewController<T>;

  static PaginatedListViewController<V> init<V>(
      {required PaginatedList<V> paginatedList, List<V>? startItems}) {
    return PaginatedListViewController<V>(
        paginatedList: paginatedList, items: startItems ?? []);
  }
}
