// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvPlayerControlsController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvPlayerControlsControllerCWProxy {
  TvPlayerControlsController controlsOpacity(double controlsOpacity);

  TvPlayerControlsController showSettings(bool showSettings);

  TvPlayerControlsController showQueue(bool showQueue);

  TvPlayerControlsController loading(bool loading);

  TvPlayerControlsController displayControls(bool displayControls);

  TvPlayerControlsController forwardStep(int forwardStep);

  TvPlayerControlsController rewindStep(int rewindStep);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvPlayerControlsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvPlayerControlsController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvPlayerControlsController call({
    double? controlsOpacity,
    bool? showSettings,
    bool? showQueue,
    bool? loading,
    bool? displayControls,
    int? forwardStep,
    int? rewindStep,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvPlayerControlsController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvPlayerControlsController.copyWith.fieldName(...)`
class _$TvPlayerControlsControllerCWProxyImpl
    implements _$TvPlayerControlsControllerCWProxy {
  const _$TvPlayerControlsControllerCWProxyImpl(this._value);

  final TvPlayerControlsController _value;

  @override
  TvPlayerControlsController controlsOpacity(double controlsOpacity) =>
      this(controlsOpacity: controlsOpacity);

  @override
  TvPlayerControlsController showSettings(bool showSettings) =>
      this(showSettings: showSettings);

  @override
  TvPlayerControlsController showQueue(bool showQueue) =>
      this(showQueue: showQueue);

  @override
  TvPlayerControlsController loading(bool loading) => this(loading: loading);

  @override
  TvPlayerControlsController displayControls(bool displayControls) =>
      this(displayControls: displayControls);

  @override
  TvPlayerControlsController forwardStep(int forwardStep) =>
      this(forwardStep: forwardStep);

  @override
  TvPlayerControlsController rewindStep(int rewindStep) =>
      this(rewindStep: rewindStep);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvPlayerControlsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvPlayerControlsController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvPlayerControlsController call({
    Object? controlsOpacity = const $CopyWithPlaceholder(),
    Object? showSettings = const $CopyWithPlaceholder(),
    Object? showQueue = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? displayControls = const $CopyWithPlaceholder(),
    Object? forwardStep = const $CopyWithPlaceholder(),
    Object? rewindStep = const $CopyWithPlaceholder(),
  }) {
    return TvPlayerControlsController._(
      controlsOpacity == const $CopyWithPlaceholder() || controlsOpacity == null
          ? _value.controlsOpacity
          // ignore: cast_nullable_to_non_nullable
          : controlsOpacity as double,
      showSettings == const $CopyWithPlaceholder() || showSettings == null
          ? _value.showSettings
          // ignore: cast_nullable_to_non_nullable
          : showSettings as bool,
      showQueue == const $CopyWithPlaceholder() || showQueue == null
          ? _value.showQueue
          // ignore: cast_nullable_to_non_nullable
          : showQueue as bool,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      displayControls == const $CopyWithPlaceholder() || displayControls == null
          ? _value.displayControls
          // ignore: cast_nullable_to_non_nullable
          : displayControls as bool,
      forwardStep == const $CopyWithPlaceholder() || forwardStep == null
          ? _value.forwardStep
          // ignore: cast_nullable_to_non_nullable
          : forwardStep as int,
      rewindStep == const $CopyWithPlaceholder() || rewindStep == null
          ? _value.rewindStep
          // ignore: cast_nullable_to_non_nullable
          : rewindStep as int,
    );
  }
}

extension $TvPlayerControlsControllerCopyWith on TvPlayerControlsController {
  /// Returns a callable class that can be used as follows: `instanceOfTvPlayerControlsController.copyWith(...)` or like so:`instanceOfTvPlayerControlsController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvPlayerControlsControllerCWProxy get copyWith =>
      _$TvPlayerControlsControllerCWProxyImpl(this);
}
