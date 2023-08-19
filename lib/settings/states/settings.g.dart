// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsStateCWProxy {
  SettingsState settings(Map<String, SettingsValue> settings);

  SettingsState packageInfo(PackageInfo packageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    Map<String, SettingsValue>? settings,
    PackageInfo? packageInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsState.copyWith.fieldName(...)`
class _$SettingsStateCWProxyImpl implements _$SettingsStateCWProxy {
  const _$SettingsStateCWProxyImpl(this._value);

  final SettingsState _value;

  @override
  SettingsState settings(Map<String, SettingsValue> settings) =>
      this(settings: settings);

  @override
  SettingsState packageInfo(PackageInfo packageInfo) =>
      this(packageInfo: packageInfo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    Object? settings = const $CopyWithPlaceholder(),
    Object? packageInfo = const $CopyWithPlaceholder(),
  }) {
    return SettingsState._(
      settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as Map<String, SettingsValue>,
      packageInfo == const $CopyWithPlaceholder() || packageInfo == null
          ? _value.packageInfo
          // ignore: cast_nullable_to_non_nullable
          : packageInfo as PackageInfo,
    );
  }
}

extension $SettingsStateCopyWith on SettingsState {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsState.copyWith(...)` or like so:`instanceOfSettingsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsStateCWProxy get copyWith => _$SettingsStateCWProxyImpl(this);
}
