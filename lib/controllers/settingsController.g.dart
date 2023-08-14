// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settingsController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsControllerCWProxy {
  SettingsController settings(Map<String, SettingsValue>? settings);

  SettingsController dbServers(List<Server>? dbServers);

  SettingsController currentServer(Server? currentServer);

  SettingsController packageInfo(PackageInfo? packageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsController(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsController call({
    Map<String, SettingsValue>? settings,
    List<Server>? dbServers,
    Server? currentServer,
    PackageInfo? packageInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsController.copyWith.fieldName(...)`
class _$SettingsControllerCWProxyImpl implements _$SettingsControllerCWProxy {
  const _$SettingsControllerCWProxyImpl(this._value);

  final SettingsController _value;

  @override
  SettingsController settings(Map<String, SettingsValue>? settings) =>
      this(settings: settings);

  @override
  SettingsController dbServers(List<Server>? dbServers) =>
      this(dbServers: dbServers);

  @override
  SettingsController currentServer(Server? currentServer) =>
      this(currentServer: currentServer);

  @override
  SettingsController packageInfo(PackageInfo? packageInfo) =>
      this(packageInfo: packageInfo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsController(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsController call({
    Object? settings = const $CopyWithPlaceholder(),
    Object? dbServers = const $CopyWithPlaceholder(),
    Object? currentServer = const $CopyWithPlaceholder(),
    Object? packageInfo = const $CopyWithPlaceholder(),
  }) {
    return SettingsController(
      settings: settings == const $CopyWithPlaceholder()
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as Map<String, SettingsValue>?,
      dbServers: dbServers == const $CopyWithPlaceholder()
          ? _value.dbServers
          // ignore: cast_nullable_to_non_nullable
          : dbServers as List<Server>?,
      currentServer: currentServer == const $CopyWithPlaceholder()
          ? _value.currentServer
          // ignore: cast_nullable_to_non_nullable
          : currentServer as Server?,
      packageInfo: packageInfo == const $CopyWithPlaceholder()
          ? _value.packageInfo
          // ignore: cast_nullable_to_non_nullable
          : packageInfo as PackageInfo?,
    );
  }
}

extension $SettingsControllerCopyWith on SettingsController {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsController.copyWith(...)` or like so:`instanceOfSettingsController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsControllerCWProxy get copyWith =>
      _$SettingsControllerCWProxyImpl(this);
}
