// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_player_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvPlayerSettingsStateCWProxy {
  TvPlayerSettingsState selected(Tabs selected);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvPlayerSettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvPlayerSettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvPlayerSettingsState call({
    Tabs? selected,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvPlayerSettingsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvPlayerSettingsState.copyWith.fieldName(...)`
class _$TvPlayerSettingsStateCWProxyImpl
    implements _$TvPlayerSettingsStateCWProxy {
  const _$TvPlayerSettingsStateCWProxyImpl(this._value);

  final TvPlayerSettingsState _value;

  @override
  TvPlayerSettingsState selected(Tabs selected) => this(selected: selected);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvPlayerSettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvPlayerSettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvPlayerSettingsState call({
    Object? selected = const $CopyWithPlaceholder(),
  }) {
    return TvPlayerSettingsState._(
      selected == const $CopyWithPlaceholder() || selected == null
          ? _value.selected
          // ignore: cast_nullable_to_non_nullable
          : selected as Tabs,
    );
  }
}

extension $TvPlayerSettingsStateCopyWith on TvPlayerSettingsState {
  /// Returns a callable class that can be used as follows: `instanceOfTvPlayerSettingsState.copyWith(...)` or like so:`instanceOfTvPlayerSettingsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvPlayerSettingsStateCWProxy get copyWith =>
      _$TvPlayerSettingsStateCWProxyImpl(this);
}
