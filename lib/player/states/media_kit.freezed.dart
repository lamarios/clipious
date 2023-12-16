// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_kit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MediaKitState {
  Duration? get startAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaKitStateCopyWith<MediaKitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaKitStateCopyWith<$Res> {
  factory $MediaKitStateCopyWith(
          MediaKitState value, $Res Function(MediaKitState) then) =
      _$MediaKitStateCopyWithImpl<$Res, MediaKitState>;
  @useResult
  $Res call({Duration? startAt});
}

/// @nodoc
class _$MediaKitStateCopyWithImpl<$Res, $Val extends MediaKitState>
    implements $MediaKitStateCopyWith<$Res> {
  _$MediaKitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = freezed,
  }) {
    return _then(_value.copyWith(
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaKitStateImplCopyWith<$Res>
    implements $MediaKitStateCopyWith<$Res> {
  factory _$$MediaKitStateImplCopyWith(
          _$MediaKitStateImpl value, $Res Function(_$MediaKitStateImpl) then) =
      __$$MediaKitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration? startAt});
}

/// @nodoc
class __$$MediaKitStateImplCopyWithImpl<$Res>
    extends _$MediaKitStateCopyWithImpl<$Res, _$MediaKitStateImpl>
    implements _$$MediaKitStateImplCopyWith<$Res> {
  __$$MediaKitStateImplCopyWithImpl(
      _$MediaKitStateImpl _value, $Res Function(_$MediaKitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = freezed,
  }) {
    return _then(_$MediaKitStateImpl(
      freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$MediaKitStateImpl extends _MediaKitState {
  const _$MediaKitStateImpl(this.startAt) : super._();

  @override
  final Duration? startAt;

  @override
  String toString() {
    return 'MediaKitState(startAt: $startAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaKitStateImpl &&
            (identical(other.startAt, startAt) || other.startAt == startAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaKitStateImplCopyWith<_$MediaKitStateImpl> get copyWith =>
      __$$MediaKitStateImplCopyWithImpl<_$MediaKitStateImpl>(this, _$identity);
}

abstract class _MediaKitState extends MediaKitState {
  const factory _MediaKitState(final Duration? startAt) = _$MediaKitStateImpl;
  const _MediaKitState._() : super._();

  @override
  Duration? get startAt;
  @override
  @JsonKey(ignore: true)
  _$$MediaKitStateImplCopyWith<_$MediaKitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
