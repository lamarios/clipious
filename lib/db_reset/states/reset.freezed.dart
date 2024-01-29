// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DbResetState {
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbResetStateCopyWith<DbResetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbResetStateCopyWith<$Res> {
  factory $DbResetStateCopyWith(
          DbResetState value, $Res Function(DbResetState) then) =
      _$DbResetStateCopyWithImpl<$Res, DbResetState>;
  @useResult
  $Res call({bool loading});
}

/// @nodoc
class _$DbResetStateCopyWithImpl<$Res, $Val extends DbResetState>
    implements $DbResetStateCopyWith<$Res> {
  _$DbResetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DbResetStateImplCopyWith<$Res>
    implements $DbResetStateCopyWith<$Res> {
  factory _$$DbResetStateImplCopyWith(
          _$DbResetStateImpl value, $Res Function(_$DbResetStateImpl) then) =
      __$$DbResetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading});
}

/// @nodoc
class __$$DbResetStateImplCopyWithImpl<$Res>
    extends _$DbResetStateCopyWithImpl<$Res, _$DbResetStateImpl>
    implements _$$DbResetStateImplCopyWith<$Res> {
  __$$DbResetStateImplCopyWithImpl(
      _$DbResetStateImpl _value, $Res Function(_$DbResetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
  }) {
    return _then(_$DbResetStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DbResetStateImpl implements _DbResetState {
  const _$DbResetStateImpl({this.loading = false});

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'DbResetState(loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DbResetStateImpl &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DbResetStateImplCopyWith<_$DbResetStateImpl> get copyWith =>
      __$$DbResetStateImplCopyWithImpl<_$DbResetStateImpl>(this, _$identity);
}

abstract class _DbResetState implements DbResetState {
  const factory _DbResetState({final bool loading}) = _$DbResetStateImpl;

  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$DbResetStateImplCopyWith<_$DbResetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
