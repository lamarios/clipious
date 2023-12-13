// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectListState<T> {
  List<T> get filteredItems => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectListStateCopyWith<T, SelectListState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectListStateCopyWith<T, $Res> {
  factory $SelectListStateCopyWith(
          SelectListState<T> value, $Res Function(SelectListState<T>) then) =
      _$SelectListStateCopyWithImpl<T, $Res, SelectListState<T>>;
  @useResult
  $Res call({List<T> filteredItems, bool loading});
}

/// @nodoc
class _$SelectListStateCopyWithImpl<T, $Res, $Val extends SelectListState<T>>
    implements $SelectListStateCopyWith<T, $Res> {
  _$SelectListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredItems = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      filteredItems: null == filteredItems
          ? _value.filteredItems
          : filteredItems // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectListStateImplCopyWith<T, $Res>
    implements $SelectListStateCopyWith<T, $Res> {
  factory _$$SelectListStateImplCopyWith(_$SelectListStateImpl<T> value,
          $Res Function(_$SelectListStateImpl<T>) then) =
      __$$SelectListStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> filteredItems, bool loading});
}

/// @nodoc
class __$$SelectListStateImplCopyWithImpl<T, $Res>
    extends _$SelectListStateCopyWithImpl<T, $Res, _$SelectListStateImpl<T>>
    implements _$$SelectListStateImplCopyWith<T, $Res> {
  __$$SelectListStateImplCopyWithImpl(_$SelectListStateImpl<T> _value,
      $Res Function(_$SelectListStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredItems = null,
    Object? loading = null,
  }) {
    return _then(_$SelectListStateImpl<T>(
      filteredItems: null == filteredItems
          ? _value._filteredItems
          : filteredItems // ignore: cast_nullable_to_non_nullable
              as List<T>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SelectListStateImpl<T> implements _SelectListState<T> {
  const _$SelectListStateImpl(
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

  @override
  String toString() {
    return 'SelectListState<$T>(filteredItems: $filteredItems, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectListStateImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._filteredItems, _filteredItems) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filteredItems), loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectListStateImplCopyWith<T, _$SelectListStateImpl<T>> get copyWith =>
      __$$SelectListStateImplCopyWithImpl<T, _$SelectListStateImpl<T>>(
          this, _$identity);
}

abstract class _SelectListState<T> implements SelectListState<T> {
  const factory _SelectListState(
      {final List<T> filteredItems,
      final bool loading}) = _$SelectListStateImpl<T>;

  @override
  List<T> get filteredItems;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$SelectListStateImplCopyWith<T, _$SelectListStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
