// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemListState<T> {
  PaginatedList<T> get itemList => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  ItemListErrors get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemListStateCopyWith<T, ItemListState<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListStateCopyWith<T, $Res> {
  factory $ItemListStateCopyWith(ItemListState<T> value, $Res Function(ItemListState<T>) then) =
      _$ItemListStateCopyWithImpl<T, $Res, ItemListState<T>>;
  @useResult
  $Res call({PaginatedList<T> itemList, List<T> items, bool loading, ItemListErrors error});
}

/// @nodoc
class _$ItemListStateCopyWithImpl<T, $Res, $Val extends ItemListState<T>> implements $ItemListStateCopyWith<T, $Res> {
  _$ItemListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemList = null,
    Object? items = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      itemList: null == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ItemListErrors,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemListStateImplCopyWith<T, $Res> implements $ItemListStateCopyWith<T, $Res> {
  factory _$$ItemListStateImplCopyWith(_$ItemListStateImpl<T> value, $Res Function(_$ItemListStateImpl<T>) then) =
      __$$ItemListStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({PaginatedList<T> itemList, List<T> items, bool loading, ItemListErrors error});
}

/// @nodoc
class __$$ItemListStateImplCopyWithImpl<T, $Res> extends _$ItemListStateCopyWithImpl<T, $Res, _$ItemListStateImpl<T>>
    implements _$$ItemListStateImplCopyWith<T, $Res> {
  __$$ItemListStateImplCopyWithImpl(_$ItemListStateImpl<T> _value, $Res Function(_$ItemListStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemList = null,
    Object? items = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_$ItemListStateImpl<T>(
      itemList: null == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ItemListErrors,
    ));
  }
}

/// @nodoc

class _$ItemListStateImpl<T> implements _ItemListState<T> {
  const _$ItemListStateImpl(
      {required this.itemList, final List<T> items = const [], this.loading = true, this.error = ItemListErrors.none})
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

  @override
  String toString() {
    return 'ItemListState<$T>(itemList: $itemList, items: $items, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemListStateImpl<T> &&
            (identical(other.itemList, itemList) || other.itemList == itemList) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemList, const DeepCollectionEquality().hash(_items), loading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemListStateImplCopyWith<T, _$ItemListStateImpl<T>> get copyWith =>
      __$$ItemListStateImplCopyWithImpl<T, _$ItemListStateImpl<T>>(this, _$identity);
}

abstract class _ItemListState<T> implements ItemListState<T> {
  const factory _ItemListState(
      {required final PaginatedList<T> itemList,
      final List<T> items,
      final bool loading,
      final ItemListErrors error}) = _$ItemListStateImpl<T>;

  @override
  PaginatedList<T> get itemList;
  @override
  List<T> get items;
  @override
  bool get loading;
  @override
  ItemListErrors get error;
  @override
  @JsonKey(ignore: true)
  _$$ItemListStateImplCopyWith<T, _$ItemListStateImpl<T>> get copyWith => throw _privateConstructorUsedError;
}
