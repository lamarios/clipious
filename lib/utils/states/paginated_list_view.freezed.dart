// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedListViewController<T> {
  PaginatedList<T> get paginatedList;
  List<T> get items;
  bool get loading;

  /// Create a copy of PaginatedListViewController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedListViewControllerCopyWith<T, PaginatedListViewController<T>>
      get copyWith => _$PaginatedListViewControllerCopyWithImpl<T,
              PaginatedListViewController<T>>(
          this as PaginatedListViewController<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedListViewController<T> &&
            (identical(other.paginatedList, paginatedList) ||
                other.paginatedList == paginatedList) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginatedList,
      const DeepCollectionEquality().hash(items), loading);

  @override
  String toString() {
    return 'PaginatedListViewController<$T>(paginatedList: $paginatedList, items: $items, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class $PaginatedListViewControllerCopyWith<T, $Res> {
  factory $PaginatedListViewControllerCopyWith(
          PaginatedListViewController<T> value,
          $Res Function(PaginatedListViewController<T>) _then) =
      _$PaginatedListViewControllerCopyWithImpl;
  @useResult
  $Res call({PaginatedList<T> paginatedList, List<T> items, bool loading});
}

/// @nodoc
class _$PaginatedListViewControllerCopyWithImpl<T, $Res>
    implements $PaginatedListViewControllerCopyWith<T, $Res> {
  _$PaginatedListViewControllerCopyWithImpl(this._self, this._then);

  final PaginatedListViewController<T> _self;
  final $Res Function(PaginatedListViewController<T>) _then;

  /// Create a copy of PaginatedListViewController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginatedList = null,
    Object? items = null,
    Object? loading = null,
  }) {
    return _then(_self.copyWith(
      paginatedList: null == paginatedList
          ? _self.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginatedListViewController].
extension PaginatedListViewControllerPatterns<T>
    on PaginatedListViewController<T> {
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
    TResult Function(_PaginatedListViewController<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedListViewController() when $default != null:
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
    TResult Function(_PaginatedListViewController<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedListViewController():
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
    TResult? Function(_PaginatedListViewController<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedListViewController() when $default != null:
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
            PaginatedList<T> paginatedList, List<T> items, bool loading)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedListViewController() when $default != null:
        return $default(_that.paginatedList, _that.items, _that.loading);
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
            PaginatedList<T> paginatedList, List<T> items, bool loading)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedListViewController():
        return $default(_that.paginatedList, _that.items, _that.loading);
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
            PaginatedList<T> paginatedList, List<T> items, bool loading)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedListViewController() when $default != null:
        return $default(_that.paginatedList, _that.items, _that.loading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaginatedListViewController<T>
    implements PaginatedListViewController<T> {
  const _PaginatedListViewController(
      {required this.paginatedList,
      final List<T> items = const [],
      this.loading = false})
      : _items = items;

  @override
  final PaginatedList<T> paginatedList;
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

  /// Create a copy of PaginatedListViewController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginatedListViewControllerCopyWith<T, _PaginatedListViewController<T>>
      get copyWith => __$PaginatedListViewControllerCopyWithImpl<T,
          _PaginatedListViewController<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginatedListViewController<T> &&
            (identical(other.paginatedList, paginatedList) ||
                other.paginatedList == paginatedList) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginatedList,
      const DeepCollectionEquality().hash(_items), loading);

  @override
  String toString() {
    return 'PaginatedListViewController<$T>(paginatedList: $paginatedList, items: $items, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class _$PaginatedListViewControllerCopyWith<T, $Res>
    implements $PaginatedListViewControllerCopyWith<T, $Res> {
  factory _$PaginatedListViewControllerCopyWith(
          _PaginatedListViewController<T> value,
          $Res Function(_PaginatedListViewController<T>) _then) =
      __$PaginatedListViewControllerCopyWithImpl;
  @override
  @useResult
  $Res call({PaginatedList<T> paginatedList, List<T> items, bool loading});
}

/// @nodoc
class __$PaginatedListViewControllerCopyWithImpl<T, $Res>
    implements _$PaginatedListViewControllerCopyWith<T, $Res> {
  __$PaginatedListViewControllerCopyWithImpl(this._self, this._then);

  final _PaginatedListViewController<T> _self;
  final $Res Function(_PaginatedListViewController<T>) _then;

  /// Create a copy of PaginatedListViewController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paginatedList = null,
    Object? items = null,
    Object? loading = null,
  }) {
    return _then(_PaginatedListViewController<T>(
      paginatedList: null == paginatedList
          ? _self.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
