import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';

part 'searchable_dynamic_select_from_list.g.dart';

class SearchableSelectFromListCubit<T> extends Cubit<SearchableSelectFromListState<T>> {
  final Future<List<T>> Function(String query) fetchItems;

  SearchableSelectFromListCubit(super.initialState, this.fetchItems);

  searchItems(String query) {
    emit(state.copyWith(loading: true));
    fetchItems(query).then((value) => emit(state.copyWith(items: value, loading: false)));
  }
}

@CopyWith(constructor: "_")
class SearchableSelectFromListState<T> {
  final List<T> items;
  final TextEditingController controller;
  final bool loading;

  SearchableSelectFromListState(this.items, {this.loading = false, required this.controller});

  SearchableSelectFromListState._(this.items, this.controller, this.loading);
}
