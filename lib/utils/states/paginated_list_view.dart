import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:invidious/utils/models/paginatedList.dart';

part 'paginated_list_view.g.dart';

class PaginatedListCubit<T> extends Cubit<PaginatedListViewController<T>> {
  PaginatedListCubit(super.initialState) {
    onInit();
  }

  void onInit() {
    state.scrollController.addListener(getMore);
    getItems();
  }

  @override
  close() async {
    state.scrollController.dispose();
    super.close();
  }

  getItems() async {
    emit(state.copyWith(loading: true));
    var items = await state.paginatedList.getItems();

    emit(state.copyWith(loading: false, items: items));
  }

  getMore() {
    if (state.paginatedList.getHasMore()) {
      if (state.scrollController.hasClients) {
        if (state.scrollController.position.maxScrollExtent * 0.9 < state.scrollController.offset) {
          EasyDebounce.debounce('get-more-playlists', const Duration(milliseconds: 250), () async {
            var state = this.state.copyWith();
            state.loading = true;
            emit(state);

            List<T> i = await state.paginatedList.getMoreItems();
            state = this.state.copyWith();
            state.items.addAll(i);
            state.loading = false;
            emit(state);
          });
        }
      }
    }
  }
}

@CopyWith(constructor: "_")
class PaginatedListViewController<T> {
  ScrollController scrollController = ScrollController();
  PaginatedList<T> paginatedList;
  List<T> items = [];
  bool loading = false;

  PaginatedListViewController._(this.scrollController, this.paginatedList, this.items, this.loading);

  PaginatedListViewController({required this.paginatedList, List<T>? startItems}) {
    if (startItems != null) {
      items.addAll(startItems);
    }
  }
}
