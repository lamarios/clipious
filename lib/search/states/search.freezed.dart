// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  TextEditingController get queryController =>
      throw _privateConstructorUsedError;
  bool get searchNow => throw _privateConstructorUsedError;
  List<String> get suggestions => throw _privateConstructorUsedError;
  SearchSortBy get sortBy => throw _privateConstructorUsedError;
  bool get showResults => throw _privateConstructorUsedError;
  int get videoPage => throw _privateConstructorUsedError;
  int get channelPage => throw _privateConstructorUsedError;
  int get playlistPage => throw _privateConstructorUsedError;
  List<String> get searchHistory => throw _privateConstructorUsedError;
  SearchFiltersState get filters => throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {TextEditingController queryController,
      bool searchNow,
      List<String> suggestions,
      SearchSortBy sortBy,
      bool showResults,
      int videoPage,
      int channelPage,
      int playlistPage,
      List<String> searchHistory,
      SearchFiltersState filters});

  $SearchFiltersStateCopyWith<$Res> get filters;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryController = null,
    Object? searchNow = null,
    Object? suggestions = null,
    Object? sortBy = null,
    Object? showResults = null,
    Object? videoPage = null,
    Object? channelPage = null,
    Object? playlistPage = null,
    Object? searchHistory = null,
    Object? filters = null,
  }) {
    return _then(_value.copyWith(
      queryController: null == queryController
          ? _value.queryController
          : queryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      searchNow: null == searchNow
          ? _value.searchNow
          : searchNow // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SearchSortBy,
      showResults: null == showResults
          ? _value.showResults
          : showResults // ignore: cast_nullable_to_non_nullable
              as bool,
      videoPage: null == videoPage
          ? _value.videoPage
          : videoPage // ignore: cast_nullable_to_non_nullable
              as int,
      channelPage: null == channelPage
          ? _value.channelPage
          : channelPage // ignore: cast_nullable_to_non_nullable
              as int,
      playlistPage: null == playlistPage
          ? _value.playlistPage
          : playlistPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchHistory: null == searchHistory
          ? _value.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFiltersState,
    ) as $Val);
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchFiltersStateCopyWith<$Res> get filters {
    return $SearchFiltersStateCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController queryController,
      bool searchNow,
      List<String> suggestions,
      SearchSortBy sortBy,
      bool showResults,
      int videoPage,
      int channelPage,
      int playlistPage,
      List<String> searchHistory,
      SearchFiltersState filters});

  @override
  $SearchFiltersStateCopyWith<$Res> get filters;
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryController = null,
    Object? searchNow = null,
    Object? suggestions = null,
    Object? sortBy = null,
    Object? showResults = null,
    Object? videoPage = null,
    Object? channelPage = null,
    Object? playlistPage = null,
    Object? searchHistory = null,
    Object? filters = null,
  }) {
    return _then(_$SearchStateImpl(
      queryController: null == queryController
          ? _value.queryController
          : queryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      searchNow: null == searchNow
          ? _value.searchNow
          : searchNow // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SearchSortBy,
      showResults: null == showResults
          ? _value.showResults
          : showResults // ignore: cast_nullable_to_non_nullable
              as bool,
      videoPage: null == videoPage
          ? _value.videoPage
          : videoPage // ignore: cast_nullable_to_non_nullable
              as int,
      channelPage: null == channelPage
          ? _value.channelPage
          : channelPage // ignore: cast_nullable_to_non_nullable
              as int,
      playlistPage: null == playlistPage
          ? _value.playlistPage
          : playlistPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchHistory: null == searchHistory
          ? _value._searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFiltersState,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {required this.queryController,
      this.searchNow = false,
      final List<String> suggestions = const [],
      this.sortBy = SearchSortBy.relevance,
      this.showResults = false,
      this.videoPage = 1,
      this.channelPage = 1,
      this.playlistPage = 1,
      final List<String> searchHistory = const [],
      this.filters = const SearchFiltersState()})
      : _suggestions = suggestions,
        _searchHistory = searchHistory;

  @override
  final TextEditingController queryController;
  @override
  @JsonKey()
  final bool searchNow;
  final List<String> _suggestions;
  @override
  @JsonKey()
  List<String> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  @JsonKey()
  final SearchSortBy sortBy;
  @override
  @JsonKey()
  final bool showResults;
  @override
  @JsonKey()
  final int videoPage;
  @override
  @JsonKey()
  final int channelPage;
  @override
  @JsonKey()
  final int playlistPage;
  final List<String> _searchHistory;
  @override
  @JsonKey()
  List<String> get searchHistory {
    if (_searchHistory is EqualUnmodifiableListView) return _searchHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchHistory);
  }

  @override
  @JsonKey()
  final SearchFiltersState filters;

  @override
  String toString() {
    return 'SearchState(queryController: $queryController, searchNow: $searchNow, suggestions: $suggestions, sortBy: $sortBy, showResults: $showResults, videoPage: $videoPage, channelPage: $channelPage, playlistPage: $playlistPage, searchHistory: $searchHistory, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.queryController, queryController) ||
                other.queryController == queryController) &&
            (identical(other.searchNow, searchNow) ||
                other.searchNow == searchNow) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.showResults, showResults) ||
                other.showResults == showResults) &&
            (identical(other.videoPage, videoPage) ||
                other.videoPage == videoPage) &&
            (identical(other.channelPage, channelPage) ||
                other.channelPage == channelPage) &&
            (identical(other.playlistPage, playlistPage) ||
                other.playlistPage == playlistPage) &&
            const DeepCollectionEquality()
                .equals(other._searchHistory, _searchHistory) &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      queryController,
      searchNow,
      const DeepCollectionEquality().hash(_suggestions),
      sortBy,
      showResults,
      videoPage,
      channelPage,
      playlistPage,
      const DeepCollectionEquality().hash(_searchHistory),
      filters);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final TextEditingController queryController,
      final bool searchNow,
      final List<String> suggestions,
      final SearchSortBy sortBy,
      final bool showResults,
      final int videoPage,
      final int channelPage,
      final int playlistPage,
      final List<String> searchHistory,
      final SearchFiltersState filters}) = _$SearchStateImpl;

  @override
  TextEditingController get queryController;
  @override
  bool get searchNow;
  @override
  List<String> get suggestions;
  @override
  SearchSortBy get sortBy;
  @override
  bool get showResults;
  @override
  int get videoPage;
  @override
  int get channelPage;
  @override
  int get playlistPage;
  @override
  List<String> get searchHistory;
  @override
  SearchFiltersState get filters;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
