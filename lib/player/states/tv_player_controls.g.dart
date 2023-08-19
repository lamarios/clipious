// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_player_controls.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvPlayerControlsStateCWProxy {
  TvPlayerControlsState controlsOpacity(double controlsOpacity);

  TvPlayerControlsState showSettings(bool showSettings);

  TvPlayerControlsState showQueue(bool showQueue);

  TvPlayerControlsState loading(bool loading);

  TvPlayerControlsState displayControls(bool displayControls);

  TvPlayerControlsState forwardStep(int forwardStep);

  TvPlayerControlsState rewindStep(int rewindStep);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvPlayerControlsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvPlayerControlsState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvPlayerControlsState call({
    double? controlsOpacity,
    bool? showSettings,
    bool? showQueue,
    bool? loading,
    bool? displayControls,
    int? forwardStep,
    int? rewindStep,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvPlayerControlsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvPlayerControlsState.copyWith.fieldName(...)`
class _$TvPlayerControlsStateCWProxyImpl
    implements _$TvPlayerControlsStateCWProxy {
  const _$TvPlayerControlsStateCWProxyImpl(this._value);

  final TvPlayerControlsState _value;

  @override
  TvPlayerControlsState controlsOpacity(double controlsOpacity) =>
      this(controlsOpacity: controlsOpacity);

  @override
  TvPlayerControlsState showSettings(bool showSettings) =>
      this(showSettings: showSettings);

  @override
  TvPlayerControlsState showQueue(bool showQueue) => this(showQueue: showQueue);

  @override
  TvPlayerControlsState loading(bool loading) => this(loading: loading);

  @override
  TvPlayerControlsState displayControls(bool displayControls) =>
      this(displayControls: displayControls);

  @override
  TvPlayerControlsState forwardStep(int forwardStep) =>
      this(forwardStep: forwardStep);

  @override
  TvPlayerControlsState rewindStep(int rewindStep) =>
      this(rewindStep: rewindStep);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvPlayerControlsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvPlayerControlsState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvPlayerControlsState call({
    Object? controlsOpacity = const $CopyWithPlaceholder(),
    Object? showSettings = const $CopyWithPlaceholder(),
    Object? showQueue = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? displayControls = const $CopyWithPlaceholder(),
    Object? forwardStep = const $CopyWithPlaceholder(),
    Object? rewindStep = const $CopyWithPlaceholder(),
  }) {
    return TvPlayerControlsState._(
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

extension $TvPlayerControlsStateCopyWith on TvPlayerControlsState {
  /// Returns a callable class that can be used as follows: `instanceOfTvPlayerControlsState.copyWith(...)` or like so:`instanceOfTvPlayerControlsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvPlayerControlsStateCWProxy get copyWith =>
      _$TvPlayerControlsStateCWProxyImpl(this);
}
