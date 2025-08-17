import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_list.freezed.dart';

class SelectListCubit<T> extends Cubit<SelectListState<T>> {
  SelectListCubit(super.initialState);

  filterItems(
      Future<List<T>> Function(String filter)? asyncSearch,
      bool Function(String filter, T value)? searchFilter,
      List<T>? values,
      String searchQuery) async {
    List<T> result = [];

    if (searchFilter != null && values != null) {
      result = values
          .where((element) => searchFilter(searchQuery, element))
          .toList();
    } else if (asyncSearch != null) {
      emit(state.copyWith(loading: true));
      result = await asyncSearch(searchQuery);
    } else {
      result = values ?? [];
    }

    emit(state.copyWith(filteredItems: result, loading: false));
  }
}

@freezed
sealed class SelectListState<T> with _$SelectListState<T> {
  const factory SelectListState(
      {@Default([]) List<T> filteredItems,
      @Default(false) bool loading}) = _SelectListState<T>;
}
