// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchable_dynamic_select_from_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchableSelectFromListState<T> {
  List<T> get items;
  TextEditingController get controller;
  bool get loading;

  /// Create a copy of SearchableSelectFromListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchableSelectFromListStateCopyWith<T, SearchableSelectFromListState<T>>
      get copyWith => _$SearchableSelectFromListStateCopyWithImpl<T,
              SearchableSelectFromListState<T>>(
          this as SearchableSelectFromListState<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchableSelectFromListState<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), controller, loading);

  @override
  String toString() {
    return 'SearchableSelectFromListState<$T>(items: $items, controller: $controller, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class $SearchableSelectFromListStateCopyWith<T, $Res> {
  factory $SearchableSelectFromListStateCopyWith(
          SearchableSelectFromListState<T> value,
          $Res Function(SearchableSelectFromListState<T>) _then) =
      _$SearchableSelectFromListStateCopyWithImpl;
  @useResult
  $Res call({List<T> items, TextEditingController controller, bool loading});
}

/// @nodoc
class _$SearchableSelectFromListStateCopyWithImpl<T, $Res>
    implements $SearchableSelectFromListStateCopyWith<T, $Res> {
  _$SearchableSelectFromListStateCopyWithImpl(this._self, this._then);

  final SearchableSelectFromListState<T> _self;
  final $Res Function(SearchableSelectFromListState<T>) _then;

  /// Create a copy of SearchableSelectFromListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? controller = null,
    Object? loading = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      controller: null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchableSelectFromListState].
extension SearchableSelectFromListStatePatterns<T>
    on SearchableSelectFromListState<T> {
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
    TResult Function(_SearchableSelectFromListState<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchableSelectFromListState() when $default != null:
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
    TResult Function(_SearchableSelectFromListState<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchableSelectFromListState():
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
    TResult? Function(_SearchableSelectFromListState<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchableSelectFromListState() when $default != null:
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
            List<T> items, TextEditingController controller, bool loading)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchableSelectFromListState() when $default != null:
        return $default(_that.items, _that.controller, _that.loading);
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
            List<T> items, TextEditingController controller, bool loading)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchableSelectFromListState():
        return $default(_that.items, _that.controller, _that.loading);
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
            List<T> items, TextEditingController controller, bool loading)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchableSelectFromListState() when $default != null:
        return $default(_that.items, _that.controller, _that.loading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchableSelectFromListState<T>
    implements SearchableSelectFromListState<T> {
  const _SearchableSelectFromListState(final List<T> items,
      {required this.controller, this.loading = false})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final TextEditingController controller;
  @override
  @JsonKey()
  final bool loading;

  /// Create a copy of SearchableSelectFromListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchableSelectFromListStateCopyWith<T, _SearchableSelectFromListState<T>>
      get copyWith => __$SearchableSelectFromListStateCopyWithImpl<T,
          _SearchableSelectFromListState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchableSelectFromListState<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), controller, loading);

  @override
  String toString() {
    return 'SearchableSelectFromListState<$T>(items: $items, controller: $controller, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class _$SearchableSelectFromListStateCopyWith<T, $Res>
    implements $SearchableSelectFromListStateCopyWith<T, $Res> {
  factory _$SearchableSelectFromListStateCopyWith(
          _SearchableSelectFromListState<T> value,
          $Res Function(_SearchableSelectFromListState<T>) _then) =
      __$SearchableSelectFromListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<T> items, TextEditingController controller, bool loading});
}

/// @nodoc
class __$SearchableSelectFromListStateCopyWithImpl<T, $Res>
    implements _$SearchableSelectFromListStateCopyWith<T, $Res> {
  __$SearchableSelectFromListStateCopyWithImpl(this._self, this._then);

  final _SearchableSelectFromListState<T> _self;
  final $Res Function(_SearchableSelectFromListState<T>) _then;

  /// Create a copy of SearchableSelectFromListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? controller = null,
    Object? loading = null,
  }) {
    return _then(_SearchableSelectFromListState<T>(
      null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      controller: null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
