import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/search_date.dart';
import '../models/search_duration.dart';
import '../models/search_sort_by.dart';

part 'search_filter.freezed.dart';

class SearchFiltersCubit<T extends SearchFiltersState>
    extends Cubit<SearchFiltersState> {
  SearchFiltersCubit(super.initialState);

  setDate(SearchDate? newValue) {
    emit(state.copyWith(date: newValue ?? SearchDate.any));
  }

  setDuration(SearchDuration? newValue) {
    emit(state.copyWith(duration: newValue ?? SearchDuration.any));
  }

  setSortBy(SearchSortBy? newValue) {
    emit(state.copyWith(sortBy: newValue ?? SearchSortBy.relevance));
  }
}

@freezed
sealed class SearchFiltersState with _$SearchFiltersState {
  const factory SearchFiltersState(
      {@Default(SearchDate.any) date,
      @Default(SearchDuration.any) duration,
      @Default(SearchSortBy.relevance) sortBy}) = _SearchFiltersState;
}
