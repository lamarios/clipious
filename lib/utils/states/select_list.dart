import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';

part 'select_list.g.dart';

class SelectListCubit<T> extends Cubit<SelectListState<T>> {
  SelectListCubit(super.initialState);

  filterItems(Future<List<T>> Function(String filter)? asyncSearch, bool Function(String filter, T value)? searchFilter, List<T>? values, String searchQuery) async {
    List<T> result = [];

    if (searchFilter != null && values != null) {
      result = values.where((element) => searchFilter(searchQuery, element)).toList();
    } else if (asyncSearch != null) {
      emit(state.copyWith(loading: true));
      result = await asyncSearch(searchQuery);
    } else {
      result = values ?? [];
    }

    emit(state.copyWith(filteredItems: result, loading: false));
  }
}

@CopyWith(constructor: "_")
class SelectListState<T> {
  List<T> filteredItems = [];
  bool loading = false;

  SelectListState(List<T>? values) {
    if (values != null) {
      filteredItems = values;
    }
  }

  SelectListState._(this.filteredItems, this.loading);
}
