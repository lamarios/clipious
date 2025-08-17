// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchFiltersState {
  dynamic get date;
  dynamic get duration;
  dynamic get sortBy;

  /// Create a copy of SearchFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchFiltersStateCopyWith<SearchFiltersState> get copyWith =>
      _$SearchFiltersStateCopyWithImpl<SearchFiltersState>(
          this as SearchFiltersState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchFiltersState &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.sortBy, sortBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(sortBy));

  @override
  String toString() {
    return 'SearchFiltersState(date: $date, duration: $duration, sortBy: $sortBy)';
  }
}

/// @nodoc
abstract mixin class $SearchFiltersStateCopyWith<$Res> {
  factory $SearchFiltersStateCopyWith(
          SearchFiltersState value, $Res Function(SearchFiltersState) _then) =
      _$SearchFiltersStateCopyWithImpl;
  @useResult
  $Res call({dynamic date, dynamic duration, dynamic sortBy});
}

/// @nodoc
class _$SearchFiltersStateCopyWithImpl<$Res>
    implements $SearchFiltersStateCopyWith<$Res> {
  _$SearchFiltersStateCopyWithImpl(this._self, this._then);

  final SearchFiltersState _self;
  final $Res Function(SearchFiltersState) _then;

  /// Create a copy of SearchFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? duration = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_self.copyWith(
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sortBy: freezed == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchFiltersState].
extension SearchFiltersStatePatterns on SearchFiltersState {
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
    TResult Function(_SearchFiltersState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchFiltersState() when $default != null:
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
    TResult Function(_SearchFiltersState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFiltersState():
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
    TResult? Function(_SearchFiltersState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFiltersState() when $default != null:
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
    TResult Function(dynamic date, dynamic duration, dynamic sortBy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchFiltersState() when $default != null:
        return $default(_that.date, _that.duration, _that.sortBy);
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
    TResult Function(dynamic date, dynamic duration, dynamic sortBy) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFiltersState():
        return $default(_that.date, _that.duration, _that.sortBy);
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
    TResult? Function(dynamic date, dynamic duration, dynamic sortBy)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFiltersState() when $default != null:
        return $default(_that.date, _that.duration, _that.sortBy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchFiltersState implements SearchFiltersState {
  const _SearchFiltersState(
      {this.date = SearchDate.any,
      this.duration = SearchDuration.any,
      this.sortBy = SearchSortBy.relevance});

  @override
  @JsonKey()
  final dynamic date;
  @override
  @JsonKey()
  final dynamic duration;
  @override
  @JsonKey()
  final dynamic sortBy;

  /// Create a copy of SearchFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchFiltersStateCopyWith<_SearchFiltersState> get copyWith =>
      __$SearchFiltersStateCopyWithImpl<_SearchFiltersState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchFiltersState &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.sortBy, sortBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(sortBy));

  @override
  String toString() {
    return 'SearchFiltersState(date: $date, duration: $duration, sortBy: $sortBy)';
  }
}

/// @nodoc
abstract mixin class _$SearchFiltersStateCopyWith<$Res>
    implements $SearchFiltersStateCopyWith<$Res> {
  factory _$SearchFiltersStateCopyWith(
          _SearchFiltersState value, $Res Function(_SearchFiltersState) _then) =
      __$SearchFiltersStateCopyWithImpl;
  @override
  @useResult
  $Res call({dynamic date, dynamic duration, dynamic sortBy});
}

/// @nodoc
class __$SearchFiltersStateCopyWithImpl<$Res>
    implements _$SearchFiltersStateCopyWith<$Res> {
  __$SearchFiltersStateCopyWithImpl(this._self, this._then);

  final _SearchFiltersState _self;
  final $Res Function(_SearchFiltersState) _then;

  /// Create a copy of SearchFiltersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = freezed,
    Object? duration = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_SearchFiltersState(
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sortBy: freezed == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
