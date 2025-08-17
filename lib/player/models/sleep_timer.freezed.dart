// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SleepTimer {
  Duration get duration;
  bool get stopVideo;

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SleepTimerCopyWith<SleepTimer> get copyWith =>
      _$SleepTimerCopyWithImpl<SleepTimer>(this as SleepTimer, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SleepTimer &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.stopVideo, stopVideo) ||
                other.stopVideo == stopVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, stopVideo);

  @override
  String toString() {
    return 'SleepTimer(duration: $duration, stopVideo: $stopVideo)';
  }
}

/// @nodoc
abstract mixin class $SleepTimerCopyWith<$Res> {
  factory $SleepTimerCopyWith(
          SleepTimer value, $Res Function(SleepTimer) _then) =
      _$SleepTimerCopyWithImpl;
  @useResult
  $Res call({Duration duration, bool stopVideo});
}

/// @nodoc
class _$SleepTimerCopyWithImpl<$Res> implements $SleepTimerCopyWith<$Res> {
  _$SleepTimerCopyWithImpl(this._self, this._then);

  final SleepTimer _self;
  final $Res Function(SleepTimer) _then;

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? stopVideo = null,
  }) {
    return _then(_self.copyWith(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      stopVideo: null == stopVideo
          ? _self.stopVideo
          : stopVideo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SleepTimer].
extension SleepTimerPatterns on SleepTimer {
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
    TResult Function(_SleepTimer value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SleepTimer() when $default != null:
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
    TResult Function(_SleepTimer value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SleepTimer():
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
    TResult? Function(_SleepTimer value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SleepTimer() when $default != null:
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
    TResult Function(Duration duration, bool stopVideo)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SleepTimer() when $default != null:
        return $default(_that.duration, _that.stopVideo);
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
    TResult Function(Duration duration, bool stopVideo) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SleepTimer():
        return $default(_that.duration, _that.stopVideo);
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
    TResult? Function(Duration duration, bool stopVideo)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SleepTimer() when $default != null:
        return $default(_that.duration, _that.stopVideo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SleepTimer implements SleepTimer {
  const _SleepTimer(
      {this.duration = const Duration(minutes: 5), this.stopVideo = true});

  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final bool stopVideo;

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SleepTimerCopyWith<_SleepTimer> get copyWith =>
      __$SleepTimerCopyWithImpl<_SleepTimer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SleepTimer &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.stopVideo, stopVideo) ||
                other.stopVideo == stopVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, stopVideo);

  @override
  String toString() {
    return 'SleepTimer(duration: $duration, stopVideo: $stopVideo)';
  }
}

/// @nodoc
abstract mixin class _$SleepTimerCopyWith<$Res>
    implements $SleepTimerCopyWith<$Res> {
  factory _$SleepTimerCopyWith(
          _SleepTimer value, $Res Function(_SleepTimer) _then) =
      __$SleepTimerCopyWithImpl;
  @override
  @useResult
  $Res call({Duration duration, bool stopVideo});
}

/// @nodoc
class __$SleepTimerCopyWithImpl<$Res> implements _$SleepTimerCopyWith<$Res> {
  __$SleepTimerCopyWithImpl(this._self, this._then);

  final _SleepTimer _self;
  final $Res Function(_SleepTimer) _then;

  /// Create a copy of SleepTimer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? duration = null,
    Object? stopVideo = null,
  }) {
    return _then(_SleepTimer(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      stopVideo: null == stopVideo
          ? _self.stopVideo
          : stopVideo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
