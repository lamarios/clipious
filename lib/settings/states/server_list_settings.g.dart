// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerListSettingsModelCWProxy {
  ServerListSettingsModel dbServers(List<Server> dbServers);

  ServerListSettingsModel publicServers(List<Server> publicServers);

  ServerListSettingsModel publicServerProgress(double publicServerProgress);

  ServerListSettingsModel pinging(bool pinging);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServerListSettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServerListSettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ServerListSettingsModel call({
    List<Server>? dbServers,
    List<Server>? publicServers,
    double? publicServerProgress,
    bool? pinging,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfServerListSettingsModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfServerListSettingsModel.copyWith.fieldName(...)`
class _$ServerListSettingsModelCWProxyImpl
    implements _$ServerListSettingsModelCWProxy {
  const _$ServerListSettingsModelCWProxyImpl(this._value);

  final ServerListSettingsModel _value;

  @override
  ServerListSettingsModel dbServers(List<Server> dbServers) =>
      this(dbServers: dbServers);

  @override
  ServerListSettingsModel publicServers(List<Server> publicServers) =>
      this(publicServers: publicServers);

  @override
  ServerListSettingsModel publicServerProgress(double publicServerProgress) =>
      this(publicServerProgress: publicServerProgress);

  @override
  ServerListSettingsModel pinging(bool pinging) => this(pinging: pinging);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServerListSettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServerListSettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ServerListSettingsModel call({
    Object? dbServers = const $CopyWithPlaceholder(),
    Object? publicServers = const $CopyWithPlaceholder(),
    Object? publicServerProgress = const $CopyWithPlaceholder(),
    Object? pinging = const $CopyWithPlaceholder(),
  }) {
    return ServerListSettingsModel(
      dbServers: dbServers == const $CopyWithPlaceholder() || dbServers == null
          ? _value.dbServers
          // ignore: cast_nullable_to_non_nullable
          : dbServers as List<Server>,
      publicServers:
          publicServers == const $CopyWithPlaceholder() || publicServers == null
              ? _value.publicServers
              // ignore: cast_nullable_to_non_nullable
              : publicServers as List<Server>,
      publicServerProgress:
          publicServerProgress == const $CopyWithPlaceholder() ||
                  publicServerProgress == null
              ? _value.publicServerProgress
              // ignore: cast_nullable_to_non_nullable
              : publicServerProgress as double,
      pinging: pinging == const $CopyWithPlaceholder() || pinging == null
          ? _value.pinging
          // ignore: cast_nullable_to_non_nullable
          : pinging as bool,
    );
  }
}

extension $ServerListSettingsModelCopyWith on ServerListSettingsModel {
  /// Returns a callable class that can be used as follows: `instanceOfServerListSettingsModel.copyWith(...)` or like so:`instanceOfServerListSettingsModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerListSettingsModelCWProxy get copyWith =>
      _$ServerListSettingsModelCWProxyImpl(this);
}
