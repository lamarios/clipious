// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_player_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvPlayerSettingsState {
  Tabs get selected;
  SleepTimer get sleepTimer;

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvPlayerSettingsStateCopyWith<TvPlayerSettingsState> get copyWith =>
      _$TvPlayerSettingsStateCopyWithImpl<TvPlayerSettingsState>(
          this as TvPlayerSettingsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvPlayerSettingsState &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.sleepTimer, sleepTimer) ||
                other.sleepTimer == sleepTimer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selected, sleepTimer);

  @override
  String toString() {
    return 'TvPlayerSettingsState(selected: $selected, sleepTimer: $sleepTimer)';
  }
}

/// @nodoc
abstract mixin class $TvPlayerSettingsStateCopyWith<$Res> {
  factory $TvPlayerSettingsStateCopyWith(TvPlayerSettingsState value,
          $Res Function(TvPlayerSettingsState) _then) =
      _$TvPlayerSettingsStateCopyWithImpl;
  @useResult
  $Res call({Tabs selected, SleepTimer sleepTimer});

  $SleepTimerCopyWith<$Res> get sleepTimer;
}

/// @nodoc
class _$TvPlayerSettingsStateCopyWithImpl<$Res>
    implements $TvPlayerSettingsStateCopyWith<$Res> {
  _$TvPlayerSettingsStateCopyWithImpl(this._self, this._then);

  final TvPlayerSettingsState _self;
  final $Res Function(TvPlayerSettingsState) _then;

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? sleepTimer = null,
  }) {
    return _then(_self.copyWith(
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Tabs,
      sleepTimer: null == sleepTimer
          ? _self.sleepTimer
          : sleepTimer // ignore: cast_nullable_to_non_nullable
              as SleepTimer,
    ));
  }

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepTimerCopyWith<$Res> get sleepTimer {
    return $SleepTimerCopyWith<$Res>(_self.sleepTimer, (value) {
      return _then(_self.copyWith(sleepTimer: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TvPlayerSettingsState].
extension TvPlayerSettingsStatePatterns on TvPlayerSettingsState {
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
    TResult Function(_TvPlayerSettingsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvPlayerSettingsState() when $default != null:
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
    TResult Function(_TvPlayerSettingsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerSettingsState():
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
    TResult? Function(_TvPlayerSettingsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerSettingsState() when $default != null:
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
    TResult Function(Tabs selected, SleepTimer sleepTimer)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvPlayerSettingsState() when $default != null:
        return $default(_that.selected, _that.sleepTimer);
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
    TResult Function(Tabs selected, SleepTimer sleepTimer) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerSettingsState():
        return $default(_that.selected, _that.sleepTimer);
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
    TResult? Function(Tabs selected, SleepTimer sleepTimer)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerSettingsState() when $default != null:
        return $default(_that.selected, _that.sleepTimer);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TvPlayerSettingsState implements TvPlayerSettingsState {
  const _TvPlayerSettingsState(
      {this.selected = Tabs.video, this.sleepTimer = const SleepTimer()});

  @override
  @JsonKey()
  final Tabs selected;
  @override
  @JsonKey()
  final SleepTimer sleepTimer;

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvPlayerSettingsStateCopyWith<_TvPlayerSettingsState> get copyWith =>
      __$TvPlayerSettingsStateCopyWithImpl<_TvPlayerSettingsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvPlayerSettingsState &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.sleepTimer, sleepTimer) ||
                other.sleepTimer == sleepTimer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selected, sleepTimer);

  @override
  String toString() {
    return 'TvPlayerSettingsState(selected: $selected, sleepTimer: $sleepTimer)';
  }
}

/// @nodoc
abstract mixin class _$TvPlayerSettingsStateCopyWith<$Res>
    implements $TvPlayerSettingsStateCopyWith<$Res> {
  factory _$TvPlayerSettingsStateCopyWith(_TvPlayerSettingsState value,
          $Res Function(_TvPlayerSettingsState) _then) =
      __$TvPlayerSettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call({Tabs selected, SleepTimer sleepTimer});

  @override
  $SleepTimerCopyWith<$Res> get sleepTimer;
}

/// @nodoc
class __$TvPlayerSettingsStateCopyWithImpl<$Res>
    implements _$TvPlayerSettingsStateCopyWith<$Res> {
  __$TvPlayerSettingsStateCopyWithImpl(this._self, this._then);

  final _TvPlayerSettingsState _self;
  final $Res Function(_TvPlayerSettingsState) _then;

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selected = null,
    Object? sleepTimer = null,
  }) {
    return _then(_TvPlayerSettingsState(
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Tabs,
      sleepTimer: null == sleepTimer
          ? _self.sleepTimer
          : sleepTimer // ignore: cast_nullable_to_non_nullable
              as SleepTimer,
    ));
  }

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepTimerCopyWith<$Res> get sleepTimer {
    return $SleepTimerCopyWith<$Res>(_self.sleepTimer, (value) {
      return _then(_self.copyWith(sleepTimer: value));
    });
  }
}

// dart format on
