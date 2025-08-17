import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchable_dynamic_select_from_list.freezed.dart';

class SearchableSelectFromListCubit<T>
    extends Cubit<SearchableSelectFromListState<T>> {
  final Future<List<T>> Function(String query) fetchItems;

  SearchableSelectFromListCubit(super.initialState, this.fetchItems);

  searchItems(String query) {
    emit(state.copyWith(loading: true));
    fetchItems(query)
        .then((value) => emit(state.copyWith(items: value, loading: false)));
  }
}

@freezed
sealed class SearchableSelectFromListState<T>
    with _$SearchableSelectFromListState<T> {
  const factory SearchableSelectFromListState(
    List<T> items, {
    required TextEditingController controller,
    @Default(false) bool loading,
  }) = _SearchableSelectFromListState<T>;
}
