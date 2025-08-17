// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchState {
  TextEditingController get queryController;
  bool get searchNow;
  List<String> get suggestions;
  SearchSortBy get sortBy;
  bool get showResults;
  int get videoPage;
  int get channelPage;
  int get playlistPage;
  List<String> get searchHistory;
  SearchFiltersState get filters;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<SearchState> get copyWith =>
      _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchState &&
            (identical(other.queryController, queryController) ||
                other.queryController == queryController) &&
            (identical(other.searchNow, searchNow) ||
                other.searchNow == searchNow) &&
            const DeepCollectionEquality()
                .equals(other.suggestions, suggestions) &&
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
                .equals(other.searchHistory, searchHistory) &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      queryController,
      searchNow,
      const DeepCollectionEquality().hash(suggestions),
      sortBy,
      showResults,
      videoPage,
      channelPage,
      playlistPage,
      const DeepCollectionEquality().hash(searchHistory),
      filters);

  @override
  String toString() {
    return 'SearchState(queryController: $queryController, searchNow: $searchNow, suggestions: $suggestions, sortBy: $sortBy, showResults: $showResults, videoPage: $videoPage, channelPage: $channelPage, playlistPage: $playlistPage, searchHistory: $searchHistory, filters: $filters)';
  }
}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) _then) =
      _$SearchStateCopyWithImpl;
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
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

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
    return _then(_self.copyWith(
      queryController: null == queryController
          ? _self.queryController
          : queryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      searchNow: null == searchNow
          ? _self.searchNow
          : searchNow // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestions: null == suggestions
          ? _self.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SearchSortBy,
      showResults: null == showResults
          ? _self.showResults
          : showResults // ignore: cast_nullable_to_non_nullable
              as bool,
      videoPage: null == videoPage
          ? _self.videoPage
          : videoPage // ignore: cast_nullable_to_non_nullable
              as int,
      channelPage: null == channelPage
          ? _self.channelPage
          : channelPage // ignore: cast_nullable_to_non_nullable
              as int,
      playlistPage: null == playlistPage
          ? _self.playlistPage
          : playlistPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchHistory: null == searchHistory
          ? _self.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filters: null == filters
          ? _self.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFiltersState,
    ));
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchFiltersStateCopyWith<$Res> get filters {
    return $SearchFiltersStateCopyWith<$Res>(_self.filters, (value) {
      return _then(_self.copyWith(filters: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            TextEditingController queryController,
            bool searchNow,
            List<String> suggestions,
            SearchSortBy sortBy,
            bool showResults,
            int videoPage,
            int channelPage,
            int playlistPage,
            List<String> searchHistory,
            SearchFiltersState filters)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
            _that.queryController,
            _that.searchNow,
            _that.suggestions,
            _that.sortBy,
            _that.showResults,
            _that.videoPage,
            _that.channelPage,
            _that.playlistPage,
            _that.searchHistory,
            _that.filters);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            TextEditingController queryController,
            bool searchNow,
            List<String> suggestions,
            SearchSortBy sortBy,
            bool showResults,
            int videoPage,
            int channelPage,
            int playlistPage,
            List<String> searchHistory,
            SearchFiltersState filters)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
        return $default(
            _that.queryController,
            _that.searchNow,
            _that.suggestions,
            _that.sortBy,
            _that.showResults,
            _that.videoPage,
            _that.channelPage,
            _that.playlistPage,
            _that.searchHistory,
            _that.filters);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            TextEditingController queryController,
            bool searchNow,
            List<String> suggestions,
            SearchSortBy sortBy,
            bool showResults,
            int videoPage,
            int channelPage,
            int playlistPage,
            List<String> searchHistory,
            SearchFiltersState filters)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
            _that.queryController,
            _that.searchNow,
            _that.suggestions,
            _that.sortBy,
            _that.showResults,
            _that.videoPage,
            _that.channelPage,
            _that.playlistPage,
            _that.searchHistory,
            _that.filters);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchState implements SearchState {
  const _SearchState(
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

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
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

  @override
  String toString() {
    return 'SearchState(queryController: $queryController, searchNow: $searchNow, suggestions: $suggestions, sortBy: $sortBy, showResults: $showResults, videoPage: $videoPage, channelPage: $channelPage, playlistPage: $playlistPage, searchHistory: $searchHistory, filters: $filters)';
  }
}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) _then) =
      __$SearchStateCopyWithImpl;
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
class __$SearchStateCopyWithImpl<$Res> implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_SearchState(
      queryController: null == queryController
          ? _self.queryController
          : queryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      searchNow: null == searchNow
          ? _self.searchNow
          : searchNow // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestions: null == suggestions
          ? _self._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SearchSortBy,
      showResults: null == showResults
          ? _self.showResults
          : showResults // ignore: cast_nullable_to_non_nullable
              as bool,
      videoPage: null == videoPage
          ? _self.videoPage
          : videoPage // ignore: cast_nullable_to_non_nullable
              as int,
      channelPage: null == channelPage
          ? _self.channelPage
          : channelPage // ignore: cast_nullable_to_non_nullable
              as int,
      playlistPage: null == playlistPage
          ? _self.playlistPage
          : playlistPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchHistory: null == searchHistory
          ? _self._searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filters: null == filters
          ? _self.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFiltersState,
    ));
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchFiltersStateCopyWith<$Res> get filters {
    return $SearchFiltersStateCopyWith<$Res>(_self.filters, (value) {
      return _then(_self.copyWith(filters: value));
    });
  }
}

// dart format on
