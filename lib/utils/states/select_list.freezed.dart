// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectListState<T> {
  List<T> get filteredItems;
  bool get loading;

  /// Create a copy of SelectListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectListStateCopyWith<T, SelectListState<T>> get copyWith =>
      _$SelectListStateCopyWithImpl<T, SelectListState<T>>(
          this as SelectListState<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectListState<T> &&
            const DeepCollectionEquality()
                .equals(other.filteredItems, filteredItems) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(filteredItems), loading);

  @override
  String toString() {
    return 'SelectListState<$T>(filteredItems: $filteredItems, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class $SelectListStateCopyWith<T, $Res> {
  factory $SelectListStateCopyWith(
          SelectListState<T> value, $Res Function(SelectListState<T>) _then) =
      _$SelectListStateCopyWithImpl;
  @useResult
  $Res call({List<T> filteredItems, bool loading});
}

/// @nodoc
class _$SelectListStateCopyWithImpl<T, $Res>
    implements $SelectListStateCopyWith<T, $Res> {
  _$SelectListStateCopyWithImpl(this._self, this._then);

  final SelectListState<T> _self;
  final $Res Function(SelectListState<T>) _then;

  /// Create a copy of SelectListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredItems = null,
    Object? loading = null,
  }) {
    return _then(_self.copyWith(
      filteredItems: null == filteredItems
          ? _self.filteredItems
          : filteredItems // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SelectListState].
extension SelectListStatePatterns<T> on SelectListState<T> {
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
    TResult Function(_SelectListState<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelectListState() when $default != null:
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
    TResult Function(_SelectListState<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectListState():
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
    TResult? Function(_SelectListState<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectListState() when $default != null:
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
    TResult Function(List<T> filteredItems, bool loading)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelectListState() when $default != null:
        return $default(_that.filteredItems, _that.loading);
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
    TResult Function(List<T> filteredItems, bool loading) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectListState():
        return $default(_that.filteredItems, _that.loading);
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
    TResult? Function(List<T> filteredItems, bool loading)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectListState() when $default != null:
        return $default(_that.filteredItems, _that.loading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SelectListState<T> implements SelectListState<T> {
  const _SelectListState(
      {final List<T> filteredItems = const [], this.loading = false})
      : _filteredItems = filteredItems;

  final List<T> _filteredItems;
  @override
  @JsonKey()
  List<T> get filteredItems {
    if (_filteredItems is EqualUnmodifiableListView) return _filteredItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredItems);
  }

  @override
  @JsonKey()
  final bool loading;

  /// Create a copy of SelectListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectListStateCopyWith<T, _SelectListState<T>> get copyWith =>
      __$SelectListStateCopyWithImpl<T, _SelectListState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectListState<T> &&
            const DeepCollectionEquality()
                .equals(other._filteredItems, _filteredItems) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filteredItems), loading);

  @override
  String toString() {
    return 'SelectListState<$T>(filteredItems: $filteredItems, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class _$SelectListStateCopyWith<T, $Res>
    implements $SelectListStateCopyWith<T, $Res> {
  factory _$SelectListStateCopyWith(
          _SelectListState<T> value, $Res Function(_SelectListState<T>) _then) =
      __$SelectListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<T> filteredItems, bool loading});
}

/// @nodoc
class __$SelectListStateCopyWithImpl<T, $Res>
    implements _$SelectListStateCopyWith<T, $Res> {
  __$SelectListStateCopyWithImpl(this._self, this._then);

  final _SelectListState<T> _self;
  final $Res Function(_SelectListState<T>) _then;

  /// Create a copy of SelectListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filteredItems = null,
    Object? loading = null,
  }) {
    return _then(_SelectListState<T>(
      filteredItems: null == filteredItems
          ? _self._filteredItems
          : filteredItems // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
