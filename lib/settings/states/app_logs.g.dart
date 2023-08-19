// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_logs.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppLogsStateCWProxy {
  AppLogsState logs(List<AppLog>? logs);

  AppLogsState selected(List<int>? selected);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppLogsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppLogsState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppLogsState call({
    List<AppLog>? logs,
    List<int>? selected,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppLogsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppLogsState.copyWith.fieldName(...)`
class _$AppLogsStateCWProxyImpl implements _$AppLogsStateCWProxy {
  const _$AppLogsStateCWProxyImpl(this._value);

  final AppLogsState _value;

  @override
  AppLogsState logs(List<AppLog>? logs) => this(logs: logs);

  @override
  AppLogsState selected(List<int>? selected) => this(selected: selected);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppLogsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppLogsState(...).copyWith(id: 12, name: "My name")
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

extension $AppLogsStateCopyWith on AppLogsState {
  /// Returns a callable class that can be used as follows: `instanceOfAppLogsState.copyWith(...)` or like so:`instanceOfAppLogsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppLogsStateCWProxy get copyWith => _$AppLogsStateCWProxyImpl(this);
}
