// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'migration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DbMigrationState {
  double get progress => throw _privateConstructorUsedError;
  int get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbMigrationStateCopyWith<DbMigrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbMigrationStateCopyWith<$Res> {
  factory $DbMigrationStateCopyWith(
          DbMigrationState value, $Res Function(DbMigrationState) then) =
      _$DbMigrationStateCopyWithImpl<$Res, DbMigrationState>;
  @useResult
  $Res call({double progress, int timer});
}

/// @nodoc
class _$DbMigrationStateCopyWithImpl<$Res, $Val extends DbMigrationState>
    implements $DbMigrationStateCopyWith<$Res> {
  _$DbMigrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? timer = null,
  }) {
    return _then(_value.copyWith(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DbMigrationStateImplCopyWith<$Res>
    implements $DbMigrationStateCopyWith<$Res> {
  factory _$$DbMigrationStateImplCopyWith(_$DbMigrationStateImpl value,
          $Res Function(_$DbMigrationStateImpl) then) =
      __$$DbMigrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double progress, int timer});
}

/// @nodoc
class __$$DbMigrationStateImplCopyWithImpl<$Res>
    extends _$DbMigrationStateCopyWithImpl<$Res, _$DbMigrationStateImpl>
    implements _$$DbMigrationStateImplCopyWith<$Res> {
  __$$DbMigrationStateImplCopyWithImpl(_$DbMigrationStateImpl _value,
      $Res Function(_$DbMigrationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? timer = null,
  }) {
    return _then(_$DbMigrationStateImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DbMigrationStateImpl implements _DbMigrationState {
  const _$DbMigrationStateImpl({this.progress = 0, this.timer = 10});

  @override
  @JsonKey()
  final double progress;
  @override
  @JsonKey()
  final int timer;

  @override
  String toString() {
    return 'DbMigrationState(progress: $progress, timer: $timer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DbMigrationStateImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.timer, timer) || other.timer == timer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, timer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DbMigrationStateImplCopyWith<_$DbMigrationStateImpl> get copyWith =>
      __$$DbMigrationStateImplCopyWithImpl<_$DbMigrationStateImpl>(
          this, _$identity);
}

abstract class _DbMigrationState implements DbMigrationState {
  const factory _DbMigrationState({final double progress, final int timer}) =
      _$DbMigrationStateImpl;

  @override
  double get progress;
  @override
  int get timer;
  @override
  @JsonKey(ignore: true)
  _$$DbMigrationStateImplCopyWith<_$DbMigrationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
