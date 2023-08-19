// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerListSettingsStateCWProxy {
  ServerListSettingsState dbServers(List<Server> dbServers);

  ServerListSettingsState publicServers(List<Server> publicServers);

  ServerListSettingsState publicServerProgress(double publicServerProgress);

  ServerListSettingsState pinging(bool pinging);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServerListSettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServerListSettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ServerListSettingsState call({
    List<Server>? dbServers,
    List<Server>? publicServers,
    double? publicServerProgress,
    bool? pinging,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfServerListSettingsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfServerListSettingsState.copyWith.fieldName(...)`
class _$ServerListSettingsStateCWProxyImpl implements _$ServerListSettingsStateCWProxy {
  const _$ServerListSettingsStateCWProxyImpl(this._value);

  final ServerListSettingsState _value;

  @override
  ServerListSettingsState dbServers(List<Server> dbServers) => this(dbServers: dbServers);

  @override
  ServerListSettingsState publicServers(List<Server> publicServers) => this(publicServers: publicServers);

  @override
  ServerListSettingsState publicServerProgress(double publicServerProgress) => this(publicServerProgress: publicServerProgress);

  @override
  ServerListSettingsState pinging(bool pinging) => this(pinging: pinging);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServerListSettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServerListSettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ServerListSettingsState call({
    Object? dbServers = const $CopyWithPlaceholder(),
    Object? publicServers = const $CopyWithPlaceholder(),
    Object? publicServerProgress = const $CopyWithPlaceholder(),
    Object? pinging = const $CopyWithPlaceholder(),
  }) {
    return ServerListSettingsState(
      dbServers: dbServers == const $CopyWithPlaceholder() || dbServers == null
          ? _value.dbServers
          // ignore: cast_nullable_to_non_nullable
          : dbServers as List<Server>,
      publicServers: publicServers == const $CopyWithPlaceholder() || publicServers == null
          ? _value.publicServers
          // ignore: cast_nullable_to_non_nullable
          : publicServers as List<Server>,
      publicServerProgress: publicServerProgress == const $CopyWithPlaceholder() || publicServerProgress == null
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

extension $ServerListSettingsStateCopyWith on ServerListSettingsState {
  /// Returns a callable class that can be used as follows: `instanceOfServerListSettingsState.copyWith(...)` or like so:`instanceOfServerListSettingsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerListSettingsStateCWProxy get copyWith => _$ServerListSettingsStateCWProxyImpl(this);
}
