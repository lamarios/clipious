// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_controls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerControlsState {
  bool get errored;
  Duration get position;
  Duration get duration;
  Duration get buffer;
  FullScreenState get fullScreenState;
  bool get displayControls;
  bool get muted;
  bool get buffering;
  bool get draggingPositionSlider;
  double get doubleTapFastForwardedOpacity;
  double get doubleTapRewindedOpacity;
  bool get justDoubleTappedSkip;
  bool get showSponsorBlocked;
  double get screenControlStart;
  double get screenControlStartValue; // system setting adjustments
  bool get showBrightnessSlider;
  double get systemBrightness;
  bool get showVolumeSlider;
  double get systemVolume;

  /// Create a copy of PlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerControlsStateCopyWith<PlayerControlsState> get copyWith =>
      _$PlayerControlsStateCopyWithImpl<PlayerControlsState>(
          this as PlayerControlsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerControlsState &&
            (identical(other.errored, errored) || other.errored == errored) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.buffer, buffer) || other.buffer == buffer) &&
            (identical(other.fullScreenState, fullScreenState) ||
                other.fullScreenState == fullScreenState) &&
            (identical(other.displayControls, displayControls) ||
                other.displayControls == displayControls) &&
            (identical(other.muted, muted) || other.muted == muted) &&
            (identical(other.buffering, buffering) ||
                other.buffering == buffering) &&
            (identical(other.draggingPositionSlider, draggingPositionSlider) ||
                other.draggingPositionSlider == draggingPositionSlider) &&
            (identical(other.doubleTapFastForwardedOpacity,
                    doubleTapFastForwardedOpacity) ||
                other.doubleTapFastForwardedOpacity ==
                    doubleTapFastForwardedOpacity) &&
            (identical(
                    other.doubleTapRewindedOpacity, doubleTapRewindedOpacity) ||
                other.doubleTapRewindedOpacity == doubleTapRewindedOpacity) &&
            (identical(other.justDoubleTappedSkip, justDoubleTappedSkip) ||
                other.justDoubleTappedSkip == justDoubleTappedSkip) &&
            (identical(other.showSponsorBlocked, showSponsorBlocked) ||
                other.showSponsorBlocked == showSponsorBlocked) &&
            (identical(other.screenControlStart, screenControlStart) ||
                other.screenControlStart == screenControlStart) &&
            (identical(
                    other.screenControlStartValue, screenControlStartValue) ||
                other.screenControlStartValue == screenControlStartValue) &&
            (identical(other.showBrightnessSlider, showBrightnessSlider) ||
                other.showBrightnessSlider == showBrightnessSlider) &&
            (identical(other.systemBrightness, systemBrightness) ||
                other.systemBrightness == systemBrightness) &&
            (identical(other.showVolumeSlider, showVolumeSlider) ||
                other.showVolumeSlider == showVolumeSlider) &&
            (identical(other.systemVolume, systemVolume) ||
                other.systemVolume == systemVolume));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        errored,
        position,
        duration,
        buffer,
        fullScreenState,
        displayControls,
        muted,
        buffering,
        draggingPositionSlider,
        doubleTapFastForwardedOpacity,
        doubleTapRewindedOpacity,
        justDoubleTappedSkip,
        showSponsorBlocked,
        screenControlStart,
        screenControlStartValue,
        showBrightnessSlider,
        systemBrightness,
        showVolumeSlider,
        systemVolume
      ]);

  @override
  String toString() {
    return 'PlayerControlsState(errored: $errored, position: $position, duration: $duration, buffer: $buffer, fullScreenState: $fullScreenState, displayControls: $displayControls, muted: $muted, buffering: $buffering, draggingPositionSlider: $draggingPositionSlider, doubleTapFastForwardedOpacity: $doubleTapFastForwardedOpacity, doubleTapRewindedOpacity: $doubleTapRewindedOpacity, justDoubleTappedSkip: $justDoubleTappedSkip, showSponsorBlocked: $showSponsorBlocked, screenControlStart: $screenControlStart, screenControlStartValue: $screenControlStartValue, showBrightnessSlider: $showBrightnessSlider, systemBrightness: $systemBrightness, showVolumeSlider: $showVolumeSlider, systemVolume: $systemVolume)';
  }
}

/// @nodoc
abstract mixin class $PlayerControlsStateCopyWith<$Res> {
  factory $PlayerControlsStateCopyWith(
          PlayerControlsState value, $Res Function(PlayerControlsState) _then) =
      _$PlayerControlsStateCopyWithImpl;
  @useResult
  $Res call(
      {bool errored,
      Duration position,
      Duration duration,
      Duration buffer,
      FullScreenState fullScreenState,
      bool displayControls,
      bool muted,
      bool buffering,
      bool draggingPositionSlider,
      double doubleTapFastForwardedOpacity,
      double doubleTapRewindedOpacity,
      bool justDoubleTappedSkip,
      bool showSponsorBlocked,
      double screenControlStart,
      double screenControlStartValue,
      bool showBrightnessSlider,
      double systemBrightness,
      bool showVolumeSlider,
      double systemVolume});
}

/// @nodoc
class _$PlayerControlsStateCopyWithImpl<$Res>
    implements $PlayerControlsStateCopyWith<$Res> {
  _$PlayerControlsStateCopyWithImpl(this._self, this._then);

  final PlayerControlsState _self;
  final $Res Function(PlayerControlsState) _then;

  /// Create a copy of PlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errored = null,
    Object? position = null,
    Object? duration = null,
    Object? buffer = null,
    Object? fullScreenState = null,
    Object? displayControls = null,
    Object? muted = null,
    Object? buffering = null,
    Object? draggingPositionSlider = null,
    Object? doubleTapFastForwardedOpacity = null,
    Object? doubleTapRewindedOpacity = null,
    Object? justDoubleTappedSkip = null,
    Object? showSponsorBlocked = null,
    Object? screenControlStart = null,
    Object? screenControlStartValue = null,
    Object? showBrightnessSlider = null,
    Object? systemBrightness = null,
    Object? showVolumeSlider = null,
    Object? systemVolume = null,
  }) {
    return _then(_self.copyWith(
      errored: null == errored
          ? _self.errored
          : errored // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffer: null == buffer
          ? _self.buffer
          : buffer // ignore: cast_nullable_to_non_nullable
              as Duration,
      fullScreenState: null == fullScreenState
          ? _self.fullScreenState
          : fullScreenState // ignore: cast_nullable_to_non_nullable
              as FullScreenState,
      displayControls: null == displayControls
          ? _self.displayControls
          : displayControls // ignore: cast_nullable_to_non_nullable
              as bool,
      muted: null == muted
          ? _self.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      buffering: null == buffering
          ? _self.buffering
          : buffering // ignore: cast_nullable_to_non_nullable
              as bool,
      draggingPositionSlider: null == draggingPositionSlider
          ? _self.draggingPositionSlider
          : draggingPositionSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      doubleTapFastForwardedOpacity: null == doubleTapFastForwardedOpacity
          ? _self.doubleTapFastForwardedOpacity
          : doubleTapFastForwardedOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      doubleTapRewindedOpacity: null == doubleTapRewindedOpacity
          ? _self.doubleTapRewindedOpacity
          : doubleTapRewindedOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      justDoubleTappedSkip: null == justDoubleTappedSkip
          ? _self.justDoubleTappedSkip
          : justDoubleTappedSkip // ignore: cast_nullable_to_non_nullable
              as bool,
      showSponsorBlocked: null == showSponsorBlocked
          ? _self.showSponsorBlocked
          : showSponsorBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      screenControlStart: null == screenControlStart
          ? _self.screenControlStart
          : screenControlStart // ignore: cast_nullable_to_non_nullable
              as double,
      screenControlStartValue: null == screenControlStartValue
          ? _self.screenControlStartValue
          : screenControlStartValue // ignore: cast_nullable_to_non_nullable
              as double,
      showBrightnessSlider: null == showBrightnessSlider
          ? _self.showBrightnessSlider
          : showBrightnessSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      systemBrightness: null == systemBrightness
          ? _self.systemBrightness
          : systemBrightness // ignore: cast_nullable_to_non_nullable
              as double,
      showVolumeSlider: null == showVolumeSlider
          ? _self.showVolumeSlider
          : showVolumeSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      systemVolume: null == systemVolume
          ? _self.systemVolume
          : systemVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlayerControlsState].
extension PlayerControlsStatePatterns on PlayerControlsState {
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
    TResult Function(_PlayercontrolsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayercontrolsState() when $default != null:
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
    TResult Function(_PlayercontrolsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayercontrolsState():
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
    TResult? Function(_PlayercontrolsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayercontrolsState() when $default != null:
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
    TResult Function(
            bool errored,
            Duration position,
            Duration duration,
            Duration buffer,
            FullScreenState fullScreenState,
            bool displayControls,
            bool muted,
            bool buffering,
            bool draggingPositionSlider,
            double doubleTapFastForwardedOpacity,
            double doubleTapRewindedOpacity,
            bool justDoubleTappedSkip,
            bool showSponsorBlocked,
            double screenControlStart,
            double screenControlStartValue,
            bool showBrightnessSlider,
            double systemBrightness,
            bool showVolumeSlider,
            double systemVolume)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayercontrolsState() when $default != null:
        return $default(
            _that.errored,
            _that.position,
            _that.duration,
            _that.buffer,
            _that.fullScreenState,
            _that.displayControls,
            _that.muted,
            _that.buffering,
            _that.draggingPositionSlider,
            _that.doubleTapFastForwardedOpacity,
            _that.doubleTapRewindedOpacity,
            _that.justDoubleTappedSkip,
            _that.showSponsorBlocked,
            _that.screenControlStart,
            _that.screenControlStartValue,
            _that.showBrightnessSlider,
            _that.systemBrightness,
            _that.showVolumeSlider,
            _that.systemVolume);
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
    TResult Function(
            bool errored,
            Duration position,
            Duration duration,
            Duration buffer,
            FullScreenState fullScreenState,
            bool displayControls,
            bool muted,
            bool buffering,
            bool draggingPositionSlider,
            double doubleTapFastForwardedOpacity,
            double doubleTapRewindedOpacity,
            bool justDoubleTappedSkip,
            bool showSponsorBlocked,
            double screenControlStart,
            double screenControlStartValue,
            bool showBrightnessSlider,
            double systemBrightness,
            bool showVolumeSlider,
            double systemVolume)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayercontrolsState():
        return $default(
            _that.errored,
            _that.position,
            _that.duration,
            _that.buffer,
            _that.fullScreenState,
            _that.displayControls,
            _that.muted,
            _that.buffering,
            _that.draggingPositionSlider,
            _that.doubleTapFastForwardedOpacity,
            _that.doubleTapRewindedOpacity,
            _that.justDoubleTappedSkip,
            _that.showSponsorBlocked,
            _that.screenControlStart,
            _that.screenControlStartValue,
            _that.showBrightnessSlider,
            _that.systemBrightness,
            _that.showVolumeSlider,
            _that.systemVolume);
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
    TResult? Function(
            bool errored,
            Duration position,
            Duration duration,
            Duration buffer,
            FullScreenState fullScreenState,
            bool displayControls,
            bool muted,
            bool buffering,
            bool draggingPositionSlider,
            double doubleTapFastForwardedOpacity,
            double doubleTapRewindedOpacity,
            bool justDoubleTappedSkip,
            bool showSponsorBlocked,
            double screenControlStart,
            double screenControlStartValue,
            bool showBrightnessSlider,
            double systemBrightness,
            bool showVolumeSlider,
            double systemVolume)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayercontrolsState() when $default != null:
        return $default(
            _that.errored,
            _that.position,
            _that.duration,
            _that.buffer,
            _that.fullScreenState,
            _that.displayControls,
            _that.muted,
            _that.buffering,
            _that.draggingPositionSlider,
            _that.doubleTapFastForwardedOpacity,
            _that.doubleTapRewindedOpacity,
            _that.justDoubleTappedSkip,
            _that.showSponsorBlocked,
            _that.screenControlStart,
            _that.screenControlStartValue,
            _that.showBrightnessSlider,
            _that.systemBrightness,
            _that.showVolumeSlider,
            _that.systemVolume);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlayercontrolsState implements PlayerControlsState {
  const _PlayercontrolsState(
      {this.errored = false,
      this.position = Duration.zero,
      this.duration = const Duration(seconds: 1),
      this.buffer = Duration.zero,
      this.fullScreenState = FullScreenState.notFullScreen,
      this.displayControls = false,
      this.muted = false,
      this.buffering = false,
      this.draggingPositionSlider = false,
      this.doubleTapFastForwardedOpacity = 0,
      this.doubleTapRewindedOpacity = 0,
      this.justDoubleTappedSkip = false,
      this.showSponsorBlocked = false,
      this.screenControlStart = 0,
      this.screenControlStartValue = 0,
      this.showBrightnessSlider = false,
      this.systemBrightness = 0,
      this.showVolumeSlider = false,
      this.systemVolume = 0});

  @override
  @JsonKey()
  final bool errored;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final Duration buffer;
  @override
  @JsonKey()
  final FullScreenState fullScreenState;
  @override
  @JsonKey()
  final bool displayControls;
  @override
  @JsonKey()
  final bool muted;
  @override
  @JsonKey()
  final bool buffering;
  @override
  @JsonKey()
  final bool draggingPositionSlider;
  @override
  @JsonKey()
  final double doubleTapFastForwardedOpacity;
  @override
  @JsonKey()
  final double doubleTapRewindedOpacity;
  @override
  @JsonKey()
  final bool justDoubleTappedSkip;
  @override
  @JsonKey()
  final bool showSponsorBlocked;
  @override
  @JsonKey()
  final double screenControlStart;
  @override
  @JsonKey()
  final double screenControlStartValue;
// system setting adjustments
  @override
  @JsonKey()
  final bool showBrightnessSlider;
  @override
  @JsonKey()
  final double systemBrightness;
  @override
  @JsonKey()
  final bool showVolumeSlider;
  @override
  @JsonKey()
  final double systemVolume;

  /// Create a copy of PlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayercontrolsStateCopyWith<_PlayercontrolsState> get copyWith =>
      __$PlayercontrolsStateCopyWithImpl<_PlayercontrolsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayercontrolsState &&
            (identical(other.errored, errored) || other.errored == errored) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.buffer, buffer) || other.buffer == buffer) &&
            (identical(other.fullScreenState, fullScreenState) ||
                other.fullScreenState == fullScreenState) &&
            (identical(other.displayControls, displayControls) ||
                other.displayControls == displayControls) &&
            (identical(other.muted, muted) || other.muted == muted) &&
            (identical(other.buffering, buffering) ||
                other.buffering == buffering) &&
            (identical(other.draggingPositionSlider, draggingPositionSlider) ||
                other.draggingPositionSlider == draggingPositionSlider) &&
            (identical(other.doubleTapFastForwardedOpacity,
                    doubleTapFastForwardedOpacity) ||
                other.doubleTapFastForwardedOpacity ==
                    doubleTapFastForwardedOpacity) &&
            (identical(
                    other.doubleTapRewindedOpacity, doubleTapRewindedOpacity) ||
                other.doubleTapRewindedOpacity == doubleTapRewindedOpacity) &&
            (identical(other.justDoubleTappedSkip, justDoubleTappedSkip) ||
                other.justDoubleTappedSkip == justDoubleTappedSkip) &&
            (identical(other.showSponsorBlocked, showSponsorBlocked) ||
                other.showSponsorBlocked == showSponsorBlocked) &&
            (identical(other.screenControlStart, screenControlStart) ||
                other.screenControlStart == screenControlStart) &&
            (identical(
                    other.screenControlStartValue, screenControlStartValue) ||
                other.screenControlStartValue == screenControlStartValue) &&
            (identical(other.showBrightnessSlider, showBrightnessSlider) ||
                other.showBrightnessSlider == showBrightnessSlider) &&
            (identical(other.systemBrightness, systemBrightness) ||
                other.systemBrightness == systemBrightness) &&
            (identical(other.showVolumeSlider, showVolumeSlider) ||
                other.showVolumeSlider == showVolumeSlider) &&
            (identical(other.systemVolume, systemVolume) ||
                other.systemVolume == systemVolume));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        errored,
        position,
        duration,
        buffer,
        fullScreenState,
        displayControls,
        muted,
        buffering,
        draggingPositionSlider,
        doubleTapFastForwardedOpacity,
        doubleTapRewindedOpacity,
        justDoubleTappedSkip,
        showSponsorBlocked,
        screenControlStart,
        screenControlStartValue,
        showBrightnessSlider,
        systemBrightness,
        showVolumeSlider,
        systemVolume
      ]);

  @override
  String toString() {
    return 'PlayerControlsState(errored: $errored, position: $position, duration: $duration, buffer: $buffer, fullScreenState: $fullScreenState, displayControls: $displayControls, muted: $muted, buffering: $buffering, draggingPositionSlider: $draggingPositionSlider, doubleTapFastForwardedOpacity: $doubleTapFastForwardedOpacity, doubleTapRewindedOpacity: $doubleTapRewindedOpacity, justDoubleTappedSkip: $justDoubleTappedSkip, showSponsorBlocked: $showSponsorBlocked, screenControlStart: $screenControlStart, screenControlStartValue: $screenControlStartValue, showBrightnessSlider: $showBrightnessSlider, systemBrightness: $systemBrightness, showVolumeSlider: $showVolumeSlider, systemVolume: $systemVolume)';
  }
}

/// @nodoc
abstract mixin class _$PlayercontrolsStateCopyWith<$Res>
    implements $PlayerControlsStateCopyWith<$Res> {
  factory _$PlayercontrolsStateCopyWith(_PlayercontrolsState value,
          $Res Function(_PlayercontrolsState) _then) =
      __$PlayercontrolsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool errored,
      Duration position,
      Duration duration,
      Duration buffer,
      FullScreenState fullScreenState,
      bool displayControls,
      bool muted,
      bool buffering,
      bool draggingPositionSlider,
      double doubleTapFastForwardedOpacity,
      double doubleTapRewindedOpacity,
      bool justDoubleTappedSkip,
      bool showSponsorBlocked,
      double screenControlStart,
      double screenControlStartValue,
      bool showBrightnessSlider,
      double systemBrightness,
      bool showVolumeSlider,
      double systemVolume});
}

/// @nodoc
class __$PlayercontrolsStateCopyWithImpl<$Res>
    implements _$PlayercontrolsStateCopyWith<$Res> {
  __$PlayercontrolsStateCopyWithImpl(this._self, this._then);

  final _PlayercontrolsState _self;
  final $Res Function(_PlayercontrolsState) _then;

  /// Create a copy of PlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errored = null,
    Object? position = null,
    Object? duration = null,
    Object? buffer = null,
    Object? fullScreenState = null,
    Object? displayControls = null,
    Object? muted = null,
    Object? buffering = null,
    Object? draggingPositionSlider = null,
    Object? doubleTapFastForwardedOpacity = null,
    Object? doubleTapRewindedOpacity = null,
    Object? justDoubleTappedSkip = null,
    Object? showSponsorBlocked = null,
    Object? screenControlStart = null,
    Object? screenControlStartValue = null,
    Object? showBrightnessSlider = null,
    Object? systemBrightness = null,
    Object? showVolumeSlider = null,
    Object? systemVolume = null,
  }) {
    return _then(_PlayercontrolsState(
      errored: null == errored
          ? _self.errored
          : errored // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffer: null == buffer
          ? _self.buffer
          : buffer // ignore: cast_nullable_to_non_nullable
              as Duration,
      fullScreenState: null == fullScreenState
          ? _self.fullScreenState
          : fullScreenState // ignore: cast_nullable_to_non_nullable
              as FullScreenState,
      displayControls: null == displayControls
          ? _self.displayControls
          : displayControls // ignore: cast_nullable_to_non_nullable
              as bool,
      muted: null == muted
          ? _self.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      buffering: null == buffering
          ? _self.buffering
          : buffering // ignore: cast_nullable_to_non_nullable
              as bool,
      draggingPositionSlider: null == draggingPositionSlider
          ? _self.draggingPositionSlider
          : draggingPositionSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      doubleTapFastForwardedOpacity: null == doubleTapFastForwardedOpacity
          ? _self.doubleTapFastForwardedOpacity
          : doubleTapFastForwardedOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      doubleTapRewindedOpacity: null == doubleTapRewindedOpacity
          ? _self.doubleTapRewindedOpacity
          : doubleTapRewindedOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      justDoubleTappedSkip: null == justDoubleTappedSkip
          ? _self.justDoubleTappedSkip
          : justDoubleTappedSkip // ignore: cast_nullable_to_non_nullable
              as bool,
      showSponsorBlocked: null == showSponsorBlocked
          ? _self.showSponsorBlocked
          : showSponsorBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      screenControlStart: null == screenControlStart
          ? _self.screenControlStart
          : screenControlStart // ignore: cast_nullable_to_non_nullable
              as double,
      screenControlStartValue: null == screenControlStartValue
          ? _self.screenControlStartValue
          : screenControlStartValue // ignore: cast_nullable_to_non_nullable
              as double,
      showBrightnessSlider: null == showBrightnessSlider
          ? _self.showBrightnessSlider
          : showBrightnessSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      systemBrightness: null == systemBrightness
          ? _self.systemBrightness
          : systemBrightness // ignore: cast_nullable_to_non_nullable
              as double,
      showVolumeSlider: null == showVolumeSlider
          ? _self.showVolumeSlider
          : showVolumeSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      systemVolume: null == systemVolume
          ? _self.systemVolume
          : systemVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
