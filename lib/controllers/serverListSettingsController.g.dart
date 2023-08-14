// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serverListSettingsController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerListSettingsControllerCWProxy {
  ServerListSettingsController dbServers(List<Server> dbServers);

  ServerListSettingsController publicServers(List<Server> publicServers);

  ServerListSettingsController publicServerProgress(
      double publicServerProgress);

  ServerListSettingsController pinging(bool pinging);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServerListSettingsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServerListSettingsController(...).copyWith(id: 12, name: "My name")
  /// ````
  ServerListSettingsController call({
    List<Server>? dbServers,
    List<Server>? publicServers,
    double? publicServerProgress,
    bool? pinging,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfServerListSettingsController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfServerListSettingsController.copyWith.fieldName(...)`
class _$ServerListSettingsControllerCWProxyImpl
    implements _$ServerListSettingsControllerCWProxy {
  const _$ServerListSettingsControllerCWProxyImpl(this._value);

  final ServerListSettingsController _value;

  @override
  ServerListSettingsController dbServers(List<Server> dbServers) =>
      this(dbServers: dbServers);

  @override
  ServerListSettingsController publicServers(List<Server> publicServers) =>
      this(publicServers: publicServers);

  @override
  ServerListSettingsController publicServerProgress(
          double publicServerProgress) =>
      this(publicServerProgress: publicServerProgress);

  @override
  ServerListSettingsController pinging(bool pinging) => this(pinging: pinging);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServerListSettingsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServerListSettingsController(...).copyWith(id: 12, name: "My name")
  /// ````
  ServerListSettingsController call({
    Object? dbServers = const $CopyWithPlaceholder(),
    Object? publicServers = const $CopyWithPlaceholder(),
    Object? publicServerProgress = const $CopyWithPlaceholder(),
    Object? pinging = const $CopyWithPlaceholder(),
  }) {
    return ServerListSettingsController(
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

extension $ServerListSettingsControllerCopyWith
    on ServerListSettingsController {
  /// Returns a callable class that can be used as follows: `instanceOfServerListSettingsController.copyWith(...)` or like so:`instanceOfServerListSettingsController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerListSettingsControllerCWProxy get copyWith =>
      _$ServerListSettingsControllerCWProxyImpl(this);
}
