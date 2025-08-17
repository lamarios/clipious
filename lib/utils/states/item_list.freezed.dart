// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemListState<T> {
  PaginatedList<T> get itemList;
  List<T> get items;
  bool get loading;
  ItemListErrors get error;

  /// Create a copy of ItemListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemListStateCopyWith<T, ItemListState<T>> get copyWith =>
      _$ItemListStateCopyWithImpl<T, ItemListState<T>>(
          this as ItemListState<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemListState<T> &&
            (identical(other.itemList, itemList) ||
                other.itemList == itemList) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemList,
      const DeepCollectionEquality().hash(items), loading, error);

  @override
  String toString() {
    return 'ItemListState<$T>(itemList: $itemList, items: $items, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class $ItemListStateCopyWith<T, $Res> {
  factory $ItemListStateCopyWith(
          ItemListState<T> value, $Res Function(ItemListState<T>) _then) =
      _$ItemListStateCopyWithImpl;
  @useResult
  $Res call(
      {PaginatedList<T> itemList,
      List<T> items,
      bool loading,
      ItemListErrors error});
}

/// @nodoc
class _$ItemListStateCopyWithImpl<T, $Res>
    implements $ItemListStateCopyWith<T, $Res> {
  _$ItemListStateCopyWithImpl(this._self, this._then);

  final ItemListState<T> _self;
  final $Res Function(ItemListState<T>) _then;

  /// Create a copy of ItemListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemList = null,
    Object? items = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_self.copyWith(
      itemList: null == itemList
          ? _self.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ItemListErrors,
    ));
  }
}

/// Adds pattern-matching-related methods to [ItemListState].
extension ItemListStatePatterns<T> on ItemListState<T> {
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
    TResult Function(_ItemListState<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemListState() when $default != null:
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
    TResult Function(_ItemListState<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemListState():
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
    TResult? Function(_ItemListState<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemListState() when $default != null:
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
    TResult Function(PaginatedList<T> itemList, List<T> items, bool loading,
            ItemListErrors error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemListState() when $default != null:
        return $default(
            _that.itemList, _that.items, _that.loading, _that.error);
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
    TResult Function(PaginatedList<T> itemList, List<T> items, bool loading,
            ItemListErrors error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemListState():
        return $default(
            _that.itemList, _that.items, _that.loading, _that.error);
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
    TResult? Function(PaginatedList<T> itemList, List<T> items, bool loading,
            ItemListErrors error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemListState() when $default != null:
        return $default(
            _that.itemList, _that.items, _that.loading, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ItemListState<T> implements ItemListState<T> {
  const _ItemListState(
      {required this.itemList,
      final List<T> items = const [],
      this.loading = true,
      this.error = ItemListErrors.none})
      : _items = items;

  @override
  final PaginatedList<T> itemList;
  final List<T> _items;
  @override
  @JsonKey()
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final ItemListErrors error;

  /// Create a copy of ItemListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemListStateCopyWith<T, _ItemListState<T>> get copyWith =>
      __$ItemListStateCopyWithImpl<T, _ItemListState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemListState<T> &&
            (identical(other.itemList, itemList) ||
                other.itemList == itemList) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemList,
      const DeepCollectionEquality().hash(_items), loading, error);

  @override
  String toString() {
    return 'ItemListState<$T>(itemList: $itemList, items: $items, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ItemListStateCopyWith<T, $Res>
    implements $ItemListStateCopyWith<T, $Res> {
  factory _$ItemListStateCopyWith(
          _ItemListState<T> value, $Res Function(_ItemListState<T>) _then) =
      __$ItemListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PaginatedList<T> itemList,
      List<T> items,
      bool loading,
      ItemListErrors error});
}

/// @nodoc
class __$ItemListStateCopyWithImpl<T, $Res>
    implements _$ItemListStateCopyWith<T, $Res> {
  __$ItemListStateCopyWithImpl(this._self, this._then);

  final _ItemListState<T> _self;
  final $Res Function(_ItemListState<T>) _then;

  /// Create a copy of ItemListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? itemList = null,
    Object? items = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_ItemListState<T>(
      itemList: null == itemList
          ? _self.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ItemListErrors,
    ));
  }
}

// dart format on
