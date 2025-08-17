// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_player_controls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvPlayerControlsState {
  double get controlsOpacity;
  bool get showSettings;
  bool get showQueue;
  bool get loading;
  bool get displayControls;

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvPlayerControlsStateCopyWith<TvPlayerControlsState> get copyWith =>
      _$TvPlayerControlsStateCopyWithImpl<TvPlayerControlsState>(
          this as TvPlayerControlsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvPlayerControlsState &&
            (identical(other.controlsOpacity, controlsOpacity) ||
                other.controlsOpacity == controlsOpacity) &&
            (identical(other.showSettings, showSettings) ||
                other.showSettings == showSettings) &&
            (identical(other.showQueue, showQueue) ||
                other.showQueue == showQueue) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.displayControls, displayControls) ||
                other.displayControls == displayControls));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controlsOpacity, showSettings,
      showQueue, loading, displayControls);

  @override
  String toString() {
    return 'TvPlayerControlsState(controlsOpacity: $controlsOpacity, showSettings: $showSettings, showQueue: $showQueue, loading: $loading, displayControls: $displayControls)';
  }
}

/// @nodoc
abstract mixin class $TvPlayerControlsStateCopyWith<$Res> {
  factory $TvPlayerControlsStateCopyWith(TvPlayerControlsState value,
          $Res Function(TvPlayerControlsState) _then) =
      _$TvPlayerControlsStateCopyWithImpl;
  @useResult
  $Res call(
      {double controlsOpacity,
      bool showSettings,
      bool showQueue,
      bool loading,
      bool displayControls});
}

/// @nodoc
class _$TvPlayerControlsStateCopyWithImpl<$Res>
    implements $TvPlayerControlsStateCopyWith<$Res> {
  _$TvPlayerControlsStateCopyWithImpl(this._self, this._then);

  final TvPlayerControlsState _self;
  final $Res Function(TvPlayerControlsState) _then;

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controlsOpacity = null,
    Object? showSettings = null,
    Object? showQueue = null,
    Object? loading = null,
    Object? displayControls = null,
  }) {
    return _then(_self.copyWith(
      controlsOpacity: null == controlsOpacity
          ? _self.controlsOpacity
          : controlsOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      showSettings: null == showSettings
          ? _self.showSettings
          : showSettings // ignore: cast_nullable_to_non_nullable
              as bool,
      showQueue: null == showQueue
          ? _self.showQueue
          : showQueue // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      displayControls: null == displayControls
          ? _self.displayControls
          : displayControls // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TvPlayerControlsState].
extension TvPlayerControlsStatePatterns on TvPlayerControlsState {
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
    TResult Function(_TvPlayerControlsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvPlayerControlsState() when $default != null:
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
    TResult Function(_TvPlayerControlsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerControlsState():
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
    TResult? Function(_TvPlayerControlsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerControlsState() when $default != null:
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
    TResult Function(double controlsOpacity, bool showSettings, bool showQueue,
            bool loading, bool displayControls)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvPlayerControlsState() when $default != null:
        return $default(_that.controlsOpacity, _that.showSettings,
            _that.showQueue, _that.loading, _that.displayControls);
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
    TResult Function(double controlsOpacity, bool showSettings, bool showQueue,
            bool loading, bool displayControls)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerControlsState():
        return $default(_that.controlsOpacity, _that.showSettings,
            _that.showQueue, _that.loading, _that.displayControls);
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
    TResult? Function(double controlsOpacity, bool showSettings, bool showQueue,
            bool loading, bool displayControls)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvPlayerControlsState() when $default != null:
        return $default(_that.controlsOpacity, _that.showSettings,
            _that.showQueue, _that.loading, _that.displayControls);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TvPlayerControlsState extends TvPlayerControlsState {
  const _TvPlayerControlsState(
      {this.controlsOpacity = 0,
      this.showSettings = false,
      this.showQueue = false,
      this.loading = false,
      this.displayControls = false})
      : super._();

  @override
  @JsonKey()
  final double controlsOpacity;
  @override
  @JsonKey()
  final bool showSettings;
  @override
  @JsonKey()
  final bool showQueue;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool displayControls;

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvPlayerControlsStateCopyWith<_TvPlayerControlsState> get copyWith =>
      __$TvPlayerControlsStateCopyWithImpl<_TvPlayerControlsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvPlayerControlsState &&
            (identical(other.controlsOpacity, controlsOpacity) ||
                other.controlsOpacity == controlsOpacity) &&
            (identical(other.showSettings, showSettings) ||
                other.showSettings == showSettings) &&
            (identical(other.showQueue, showQueue) ||
                other.showQueue == showQueue) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.displayControls, displayControls) ||
                other.displayControls == displayControls));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controlsOpacity, showSettings,
      showQueue, loading, displayControls);

  @override
  String toString() {
    return 'TvPlayerControlsState(controlsOpacity: $controlsOpacity, showSettings: $showSettings, showQueue: $showQueue, loading: $loading, displayControls: $displayControls)';
  }
}

/// @nodoc
abstract mixin class _$TvPlayerControlsStateCopyWith<$Res>
    implements $TvPlayerControlsStateCopyWith<$Res> {
  factory _$TvPlayerControlsStateCopyWith(_TvPlayerControlsState value,
          $Res Function(_TvPlayerControlsState) _then) =
      __$TvPlayerControlsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double controlsOpacity,
      bool showSettings,
      bool showQueue,
      bool loading,
      bool displayControls});
}

/// @nodoc
class __$TvPlayerControlsStateCopyWithImpl<$Res>
    implements _$TvPlayerControlsStateCopyWith<$Res> {
  __$TvPlayerControlsStateCopyWithImpl(this._self, this._then);

  final _TvPlayerControlsState _self;
  final $Res Function(_TvPlayerControlsState) _then;

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? controlsOpacity = null,
    Object? showSettings = null,
    Object? showQueue = null,
    Object? loading = null,
    Object? displayControls = null,
  }) {
    return _then(_TvPlayerControlsState(
      controlsOpacity: null == controlsOpacity
          ? _self.controlsOpacity
          : controlsOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      showSettings: null == showSettings
          ? _self.showSettings
          : showSettings // ignore: cast_nullable_to_non_nullable
              as bool,
      showQueue: null == showQueue
          ? _self.showQueue
          : showQueue // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      displayControls: null == displayControls
          ? _self.displayControls
          : displayControls // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
