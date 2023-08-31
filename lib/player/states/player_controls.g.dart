// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controls.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayerControlsStateCWProxy {
  PlayerControlsState event(MediaEvent<dynamic> event);

  PlayerControlsState position(Duration position);

  PlayerControlsState displayControls(bool displayControls);

  PlayerControlsState errored(bool errored);

  PlayerControlsState supportsPip(bool supportsPip);

  PlayerControlsState duration(Duration duration);

  PlayerControlsState fullScreenState(FullScreenState fullScreenState);

  PlayerControlsState muted(bool muted);

  PlayerControlsState buffer(Duration buffer);

  PlayerControlsState draggingPositionSlider(bool draggingPositionSlider);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerControlsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerControlsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerControlsState call({
    MediaEvent<dynamic>? event,
    Duration? position,
    bool? displayControls,
    bool? errored,
    bool? supportsPip,
    Duration? duration,
    FullScreenState? fullScreenState,
    bool? muted,
    Duration? buffer,
    bool? draggingPositionSlider,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayerControlsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlayerControlsState.copyWith.fieldName(...)`
class _$PlayerControlsStateCWProxyImpl implements _$PlayerControlsStateCWProxy {
  const _$PlayerControlsStateCWProxyImpl(this._value);

  final PlayerControlsState _value;

  @override
  PlayerControlsState event(MediaEvent<dynamic> event) => this(event: event);

  @override
  PlayerControlsState position(Duration position) => this(position: position);

  @override
  PlayerControlsState displayControls(bool displayControls) =>
      this(displayControls: displayControls);

  @override
  PlayerControlsState errored(bool errored) => this(errored: errored);

  @override
  PlayerControlsState supportsPip(bool supportsPip) =>
      this(supportsPip: supportsPip);

  @override
  PlayerControlsState duration(Duration duration) => this(duration: duration);

  @override
  PlayerControlsState fullScreenState(FullScreenState fullScreenState) =>
      this(fullScreenState: fullScreenState);

  @override
  PlayerControlsState muted(bool muted) => this(muted: muted);

  @override
  PlayerControlsState buffer(Duration buffer) => this(buffer: buffer);

  @override
  PlayerControlsState draggingPositionSlider(bool draggingPositionSlider) =>
      this(draggingPositionSlider: draggingPositionSlider);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerControlsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerControlsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerControlsState call({
    Object? event = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? displayControls = const $CopyWithPlaceholder(),
    Object? errored = const $CopyWithPlaceholder(),
    Object? supportsPip = const $CopyWithPlaceholder(),
    Object? duration = const $CopyWithPlaceholder(),
    Object? fullScreenState = const $CopyWithPlaceholder(),
    Object? muted = const $CopyWithPlaceholder(),
    Object? buffer = const $CopyWithPlaceholder(),
    Object? draggingPositionSlider = const $CopyWithPlaceholder(),
  }) {
    return PlayerControlsState._(
      event == const $CopyWithPlaceholder() || event == null
          ? _value.event
          // ignore: cast_nullable_to_non_nullable
          : event as MediaEvent<dynamic>,
      position == const $CopyWithPlaceholder() || position == null
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as Duration,
      displayControls == const $CopyWithPlaceholder() || displayControls == null
          ? _value.displayControls
          // ignore: cast_nullable_to_non_nullable
          : displayControls as bool,
      errored == const $CopyWithPlaceholder() || errored == null
          ? _value.errored
          // ignore: cast_nullable_to_non_nullable
          : errored as bool,
      supportsPip == const $CopyWithPlaceholder() || supportsPip == null
          ? _value.supportsPip
          // ignore: cast_nullable_to_non_nullable
          : supportsPip as bool,
      duration == const $CopyWithPlaceholder() || duration == null
          ? _value.duration
          // ignore: cast_nullable_to_non_nullable
          : duration as Duration,
      fullScreenState == const $CopyWithPlaceholder() || fullScreenState == null
          ? _value.fullScreenState
          // ignore: cast_nullable_to_non_nullable
          : fullScreenState as FullScreenState,
      muted == const $CopyWithPlaceholder() || muted == null
          ? _value.muted
          // ignore: cast_nullable_to_non_nullable
          : muted as bool,
      buffer == const $CopyWithPlaceholder() || buffer == null
          ? _value.buffer
          // ignore: cast_nullable_to_non_nullable
          : buffer as Duration,
      draggingPositionSlider == const $CopyWithPlaceholder() ||
              draggingPositionSlider == null
          ? _value.draggingPositionSlider
          // ignore: cast_nullable_to_non_nullable
          : draggingPositionSlider as bool,
    );
  }
}

extension $PlayerControlsStateCopyWith on PlayerControlsState {
  /// Returns a callable class that can be used as follows: `instanceOfPlayerControlsState.copyWith(...)` or like so:`instanceOfPlayerControlsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayerControlsStateCWProxy get copyWith =>
      _$PlayerControlsStateCWProxyImpl(this);
}
