// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerControlController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayerControlControllerCWProxy {
  PlayerControlController event(MediaEvent<dynamic> event);

  PlayerControlController audioPosition(Duration audioPosition);

  PlayerControlController displayControls(bool displayControls);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerControlController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerControlController(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerControlController call({
    MediaEvent<dynamic>? event,
    Duration? audioPosition,
    bool? displayControls,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayerControlController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlayerControlController.copyWith.fieldName(...)`
class _$PlayerControlControllerCWProxyImpl
    implements _$PlayerControlControllerCWProxy {
  const _$PlayerControlControllerCWProxyImpl(this._value);

  final PlayerControlController _value;

  @override
  PlayerControlController event(MediaEvent<dynamic> event) =>
      this(event: event);

  @override
  PlayerControlController audioPosition(Duration audioPosition) =>
      this(audioPosition: audioPosition);

  @override
  PlayerControlController displayControls(bool displayControls) =>
      this(displayControls: displayControls);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerControlController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerControlController(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerControlController call({
    Object? event = const $CopyWithPlaceholder(),
    Object? audioPosition = const $CopyWithPlaceholder(),
    Object? displayControls = const $CopyWithPlaceholder(),
  }) {
    return PlayerControlController._(
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

extension $PlayerControlControllerCopyWith on PlayerControlController {
  /// Returns a callable class that can be used as follows: `instanceOfPlayerControlController.copyWith(...)` or like so:`instanceOfPlayerControlController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayerControlControllerCWProxy get copyWith =>
      _$PlayerControlControllerCWProxyImpl(this);
}
