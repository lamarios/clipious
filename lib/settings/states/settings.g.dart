// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsModelCWProxy {
  SettingsState settings(Map<String, SettingsValue>? settings);

  SettingsState dbServers(List<Server>? dbServers);

  SettingsState currentServer(Server? currentServer);

  SettingsState packageInfo(PackageInfo? packageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    Map<String, SettingsValue>? settings,
    List<Server>? dbServers,
    Server? currentServer,
    PackageInfo? packageInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsModel.copyWith.fieldName(...)`
class _$SettingsModelCWProxyImpl implements _$SettingsModelCWProxy {
  const _$SettingsModelCWProxyImpl(this._value);

  final SettingsState _value;

  @override
  SettingsState settings(Map<String, SettingsValue>? settings) => this(settings: settings);

  @override
  SettingsState dbServers(List<Server>? dbServers) => this(dbServers: dbServers);

  @override
  SettingsState currentServer(Server? currentServer) => this(currentServer: currentServer);

  @override
  SettingsState packageInfo(PackageInfo? packageInfo) => this(packageInfo: packageInfo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    Object? settings = const $CopyWithPlaceholder(),
    Object? dbServers = const $CopyWithPlaceholder(),
    Object? currentServer = const $CopyWithPlaceholder(),
    Object? packageInfo = const $CopyWithPlaceholder(),
  }) {
    return SettingsState(
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

extension $SettingsModelCopyWith on SettingsState {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsModel.copyWith(...)` or like so:`instanceOfSettingsModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsModelCWProxy get copyWith => _$SettingsModelCWProxyImpl(this);
}
