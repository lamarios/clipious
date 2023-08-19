// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controls.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayerControlsStateCWProxy {
  PlayerControlsState event(MediaEvent<dynamic> event);

  PlayerControlsState audioPosition(Duration audioPosition);

  PlayerControlsState displayControls(bool displayControls);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerControlsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerControlsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerControlsState call({
    MediaEvent<dynamic>? event,
    Duration? audioPosition,
    bool? displayControls,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayerControlsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlayerControlsState.copyWith.fieldName(...)`
class _$PlayerControlsStateCWProxyImpl implements _$PlayerControlsStateCWProxy {
  const _$PlayerControlsStateCWProxyImpl(this._value);

  final PlayerControlsState _value;

  @override
  PlayerControlsState event(MediaEvent<dynamic> event) => this(event: event);

  @override
  PlayerControlsState audioPosition(Duration audioPosition) => this(audioPosition: audioPosition);

  @override
  PlayerControlsState displayControls(bool displayControls) => this(displayControls: displayControls);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerControlsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerControlsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerControlsState call({
    Object? event = const $CopyWithPlaceholder(),
    Object? audioPosition = const $CopyWithPlaceholder(),
    Object? displayControls = const $CopyWithPlaceholder(),
  }) {
    return PlayerControlsState._(
      event == const $CopyWithPlaceholder() || event == null
          ? _value.event
          // ignore: cast_nullable_to_non_nullable
          : event as MediaEvent<dynamic>,
      audioPosition == const $CopyWithPlaceholder() || audioPosition == null
          ? _value.audioPosition
          // ignore: cast_nullable_to_non_nullable
          : audioPosition as Duration,
      displayControls == const $CopyWithPlaceholder() || displayControls == null
          ? _value.displayControls
          // ignore: cast_nullable_to_non_nullable
          : displayControls as bool,
    );
  }
}

extension $PlayerControlsStateCopyWith on PlayerControlsState {
  /// Returns a callable class that can be used as follows: `instanceOfPlayerControlsState.copyWith(...)` or like so:`instanceOfPlayerControlsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayerControlsStateCWProxy get copyWith => _$PlayerControlsStateCWProxyImpl(this);
}
