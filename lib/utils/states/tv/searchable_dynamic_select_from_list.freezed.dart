// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchable_dynamic_select_from_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchableSelectFromListState<T> {
  List<T> get items => throw _privateConstructorUsedError;
  TextEditingController get controller => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchableSelectFromListStateCopyWith<T, SearchableSelectFromListState<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchableSelectFromListStateCopyWith<T, $Res> {
  factory $SearchableSelectFromListStateCopyWith(
          SearchableSelectFromListState<T> value,
          $Res Function(SearchableSelectFromListState<T>) then) =
      _$SearchableSelectFromListStateCopyWithImpl<T, $Res,
          SearchableSelectFromListState<T>>;
  @useResult
  $Res call({List<T> items, TextEditingController controller, bool loading});
}

/// @nodoc
class _$SearchableSelectFromListStateCopyWithImpl<T, $Res,
        $Val extends SearchableSelectFromListState<T>>
    implements $SearchableSelectFromListStateCopyWith<T, $Res> {
  _$SearchableSelectFromListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? controller = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchableSelectFromListStateImplCopyWith<T, $Res>
    implements $SearchableSelectFromListStateCopyWith<T, $Res> {
  factory _$$SearchableSelectFromListStateImplCopyWith(
          _$SearchableSelectFromListStateImpl<T> value,
          $Res Function(_$SearchableSelectFromListStateImpl<T>) then) =
      __$$SearchableSelectFromListStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items, TextEditingController controller, bool loading});
}

/// @nodoc
class __$$SearchableSelectFromListStateImplCopyWithImpl<T, $Res>
    extends _$SearchableSelectFromListStateCopyWithImpl<T, $Res,
        _$SearchableSelectFromListStateImpl<T>>
    implements _$$SearchableSelectFromListStateImplCopyWith<T, $Res> {
  __$$SearchableSelectFromListStateImplCopyWithImpl(
      _$SearchableSelectFromListStateImpl<T> _value,
      $Res Function(_$SearchableSelectFromListStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? controller = null,
    Object? loading = null,
  }) {
    return _then(_$SearchableSelectFromListStateImpl<T>(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchableSelectFromListStateImpl<T>
    implements _SearchableSelectFromListState<T> {
  const _$SearchableSelectFromListStateImpl(final List<T> items,
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

  @override
  String toString() {
    return 'SearchableSelectFromListState<$T>(items: $items, controller: $controller, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchableSelectFromListStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), controller, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchableSelectFromListStateImplCopyWith<T,
          _$SearchableSelectFromListStateImpl<T>>
      get copyWith => __$$SearchableSelectFromListStateImplCopyWithImpl<T,
          _$SearchableSelectFromListStateImpl<T>>(this, _$identity);
}

abstract class _SearchableSelectFromListState<T>
    implements SearchableSelectFromListState<T> {
  const factory _SearchableSelectFromListState(final List<T> items,
      {required final TextEditingController controller,
      final bool loading}) = _$SearchableSelectFromListStateImpl<T>;

  @override
  List<T> get items;
  @override
  TextEditingController get controller;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$SearchableSelectFromListStateImplCopyWith<T,
          _$SearchableSelectFromListStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
