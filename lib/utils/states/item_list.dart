import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/settings/models/errors/invidious_service_error.dart';
import 'package:logging/logging.dart';

import '../models/paginated_list.dart';

part 'item_list.freezed.dart';

enum ItemListErrors { none, couldNotFetchItems, invalidScope }

var log = Logger('ItemListCubit');

class ItemListCubit<T> extends Cubit<ItemListState<T>> {
  ScrollController scrollController = ScrollController();

  ItemListCubit(super.initialState) {
    onReady();
  }

  @override
  close() async {
    scrollController.dispose();
    super.close();
  }

  onReady() {
    getItems();
    scrollController.addListener(onScrollEvent);
  }

  onScrollEvent() {
    if (scrollController.hasClients) {
      if (scrollController.position.maxScrollExtent * 0.9 <
          scrollController.offset) {
        EasyDebounce.debounce('loading-more-videos',
            const Duration(milliseconds: 500), getMoreItems);
      }
    }
  }

  getMoreItems() async {
    if (!state.loading && state.itemList.getHasMore()) {
      loadItems(() async {
        List<T> items = await state.itemList.getMoreItems();
        List<T> currentItems = List.from(state.items)..addAll(items);
        return currentItems;
      });
    }
  }

  refreshItems() async {
    loadItems(state.itemList.refresh);
  }

  getItems() async {
    loadItems(state.itemList.getItems);
  }

  loadItems(Future<List<T>> Function() refreshFunction) async {
    emit(state.copyWith(error: ItemListErrors.none, loading: true));
    try {
      var items = await refreshFunction();
      if (!isClosed) {
        emit(state.copyWith(loading: false, items: items));
      }
    } catch (err) {
      late ItemListErrors error;
      if (err is InvidiousServiceError && err.message == "Invalid scope") {
        error = ItemListErrors.invalidScope;
      } else {
        error = ItemListErrors.couldNotFetchItems;
      }
      if (!isClosed) {
        emit(state.copyWith(error: error, items: [], loading: false));
      }
      rethrow;
    }
  }

  // similar
  focusChanged(bool value, int index) {}
}

@freezed
class ItemListState<T> with _$ItemListState<T> {
  const factory ItemListState({
    required PaginatedList<T> itemList,
    @Default([]) List<T> items,
    @Default(true) bool loading,
    @Default(ItemListErrors.none) ItemListErrors error,
  }) = _ItemListState<T>;
}
