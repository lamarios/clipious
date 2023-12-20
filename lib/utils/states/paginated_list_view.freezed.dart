// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginatedListViewController<T> {
  PaginatedList<T> get paginatedList => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedListViewControllerCopyWith<T, PaginatedListViewController<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedListViewControllerCopyWith<T, $Res> {
  factory $PaginatedListViewControllerCopyWith(
          PaginatedListViewController<T> value,
          $Res Function(PaginatedListViewController<T>) then) =
      _$PaginatedListViewControllerCopyWithImpl<T, $Res,
          PaginatedListViewController<T>>;
  @useResult
  $Res call({PaginatedList<T> paginatedList, List<T> items, bool loading});
}

/// @nodoc
class _$PaginatedListViewControllerCopyWithImpl<T, $Res,
        $Val extends PaginatedListViewController<T>>
    implements $PaginatedListViewControllerCopyWith<T, $Res> {
  _$PaginatedListViewControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginatedList = null,
    Object? items = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      paginatedList: null == paginatedList
          ? _value.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedListViewControllerImplCopyWith<T, $Res>
    implements $PaginatedListViewControllerCopyWith<T, $Res> {
  factory _$$PaginatedListViewControllerImplCopyWith(
          _$PaginatedListViewControllerImpl<T> value,
          $Res Function(_$PaginatedListViewControllerImpl<T>) then) =
      __$$PaginatedListViewControllerImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({PaginatedList<T> paginatedList, List<T> items, bool loading});
}

/// @nodoc
class __$$PaginatedListViewControllerImplCopyWithImpl<T, $Res>
    extends _$PaginatedListViewControllerCopyWithImpl<T, $Res,
        _$PaginatedListViewControllerImpl<T>>
    implements _$$PaginatedListViewControllerImplCopyWith<T, $Res> {
  __$$PaginatedListViewControllerImplCopyWithImpl(
      _$PaginatedListViewControllerImpl<T> _value,
      $Res Function(_$PaginatedListViewControllerImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginatedList = null,
    Object? items = null,
    Object? loading = null,
  }) {
    return _then(_$PaginatedListViewControllerImpl<T>(
      paginatedList: null == paginatedList
          ? _value.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<T>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaginatedListViewControllerImpl<T>
    implements _PaginatedListViewController<T> {
  const _$PaginatedListViewControllerImpl(
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

  @override
  String toString() {
    return 'PaginatedListViewController<$T>(paginatedList: $paginatedList, items: $items, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedListViewControllerImpl<T> &&
            (identical(other.paginatedList, paginatedList) ||
                other.paginatedList == paginatedList) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginatedList,
      const DeepCollectionEquality().hash(_items), loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedListViewControllerImplCopyWith<T,
          _$PaginatedListViewControllerImpl<T>>
      get copyWith => __$$PaginatedListViewControllerImplCopyWithImpl<T,
          _$PaginatedListViewControllerImpl<T>>(this, _$identity);
}

abstract class _PaginatedListViewController<T>
    implements PaginatedListViewController<T> {
  const factory _PaginatedListViewController(
      {required final PaginatedList<T> paginatedList,
      final List<T> items,
      final bool loading}) = _$PaginatedListViewControllerImpl<T>;

  @override
  PaginatedList<T> get paginatedList;
  @override
  List<T> get items;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedListViewControllerImplCopyWith<T,
          _$PaginatedListViewControllerImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
