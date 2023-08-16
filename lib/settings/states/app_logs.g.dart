// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_logs.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppLogsModelCWProxy {
  AppLogsState logs(List<AppLog>? logs);

  AppLogsState selected(List<int>? selected);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppLogsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppLogsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AppLogsState call({
    List<AppLog>? logs,
    List<int>? selected,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppLogsModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppLogsModel.copyWith.fieldName(...)`
class _$AppLogsModelCWProxyImpl implements _$AppLogsModelCWProxy {
  const _$AppLogsModelCWProxyImpl(this._value);

  final AppLogsState _value;

  @override
  AppLogsState logs(List<AppLog>? logs) => this(logs: logs);

  @override
  AppLogsState selected(List<int>? selected) => this(selected: selected);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppLogsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppLogsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AppLogsState call({
    Object? logs = const $CopyWithPlaceholder(),
    Object? selected = const $CopyWithPlaceholder(),
  }) {
    return AppLogsState(
      logs: logs == const $CopyWithPlaceholder()
          ? _value.logs
          // ignore: cast_nullable_to_non_nullable
          : logs as List<AppLog>?,
      selected: selected == const $CopyWithPlaceholder()
          ? _value.selected
          // ignore: cast_nullable_to_non_nullable
          : selected as List<int>?,
    );
  }
}

extension $AppLogsModelCopyWith on AppLogsState {
  /// Returns a callable class that can be used as follows: `instanceOfAppLogsModel.copyWith(...)` or like so:`instanceOfAppLogsModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppLogsModelCWProxy get copyWith => _$AppLogsModelCWProxyImpl(this);
}
