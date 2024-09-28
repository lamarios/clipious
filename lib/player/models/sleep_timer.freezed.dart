// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepTimer {
  Duration get duration => throw _privateConstructorUsedError;
  bool get stopVideo => throw _privateConstructorUsedError;

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepTimerCopyWith<SleepTimer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepTimerCopyWith<$Res> {
  factory $SleepTimerCopyWith(
          SleepTimer value, $Res Function(SleepTimer) then) =
      _$SleepTimerCopyWithImpl<$Res, SleepTimer>;
  @useResult
  $Res call({Duration duration, bool stopVideo});
}

/// @nodoc
class _$SleepTimerCopyWithImpl<$Res, $Val extends SleepTimer>
    implements $SleepTimerCopyWith<$Res> {
  _$SleepTimerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? stopVideo = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      stopVideo: null == stopVideo
          ? _value.stopVideo
          : stopVideo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepTimerImplCopyWith<$Res>
    implements $SleepTimerCopyWith<$Res> {
  factory _$$SleepTimerImplCopyWith(
          _$SleepTimerImpl value, $Res Function(_$SleepTimerImpl) then) =
      __$$SleepTimerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration duration, bool stopVideo});
}

/// @nodoc
class __$$SleepTimerImplCopyWithImpl<$Res>
    extends _$SleepTimerCopyWithImpl<$Res, _$SleepTimerImpl>
    implements _$$SleepTimerImplCopyWith<$Res> {
  __$$SleepTimerImplCopyWithImpl(
      _$SleepTimerImpl _value, $Res Function(_$SleepTimerImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? stopVideo = null,
  }) {
    return _then(_$SleepTimerImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      stopVideo: null == stopVideo
          ? _value.stopVideo
          : stopVideo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SleepTimerImpl implements _SleepTimer {
  const _$SleepTimerImpl(
      {this.duration = const Duration(minutes: 5), this.stopVideo = true});

  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final bool stopVideo;

  @override
  String toString() {
    return 'SleepTimer(duration: $duration, stopVideo: $stopVideo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepTimerImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.stopVideo, stopVideo) ||
                other.stopVideo == stopVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, stopVideo);

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepTimerImplCopyWith<_$SleepTimerImpl> get copyWith =>
      __$$SleepTimerImplCopyWithImpl<_$SleepTimerImpl>(this, _$identity);
}

abstract class _SleepTimer implements SleepTimer {
  const factory _SleepTimer({final Duration duration, final bool stopVideo}) =
      _$SleepTimerImpl;

  @override
  Duration get duration;
  @override
  bool get stopVideo;

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepTimerImplCopyWith<_$SleepTimerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
