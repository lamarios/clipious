// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppLogsState {
  List<AppLog> get logs => throw _privateConstructorUsedError;
  List<String> get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLogsStateCopyWith<AppLogsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLogsStateCopyWith<$Res> {
  factory $AppLogsStateCopyWith(
          AppLogsState value, $Res Function(AppLogsState) then) =
      _$AppLogsStateCopyWithImpl<$Res, AppLogsState>;
  @useResult
  $Res call({List<AppLog> logs, List<String> selected});
}

/// @nodoc
class _$AppLogsStateCopyWithImpl<$Res, $Val extends AppLogsState>
    implements $AppLogsStateCopyWith<$Res> {
  _$AppLogsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<AppLog>,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLogsStateImplCopyWith<$Res>
    implements $AppLogsStateCopyWith<$Res> {
  factory _$$AppLogsStateImplCopyWith(
          _$AppLogsStateImpl value, $Res Function(_$AppLogsStateImpl) then) =
      __$$AppLogsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppLog> logs, List<String> selected});
}

/// @nodoc
class __$$AppLogsStateImplCopyWithImpl<$Res>
    extends _$AppLogsStateCopyWithImpl<$Res, _$AppLogsStateImpl>
    implements _$$AppLogsStateImplCopyWith<$Res> {
  __$$AppLogsStateImplCopyWithImpl(
      _$AppLogsStateImpl _value, $Res Function(_$AppLogsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
    Object? selected = null,
  }) {
    return _then(_$AppLogsStateImpl(
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<AppLog>,
      selected: null == selected
          ? _value._selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AppLogsStateImpl implements _AppLogsState {
  const _$AppLogsStateImpl(
      {final List<AppLog> logs = const [],
      final List<String> selected = const []})
      : _logs = logs,
        _selected = selected;

  final List<AppLog> _logs;
  @override
  @JsonKey()
  List<AppLog> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  final List<String> _selected;
  @override
  @JsonKey()
  List<String> get selected {
    if (_selected is EqualUnmodifiableListView) return _selected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selected);
  }

  @override
  String toString() {
    return 'AppLogsState(logs: $logs, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLogsStateImpl &&
            const DeepCollectionEquality().equals(other._logs, _logs) &&
            const DeepCollectionEquality().equals(other._selected, _selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_logs),
      const DeepCollectionEquality().hash(_selected));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLogsStateImplCopyWith<_$AppLogsStateImpl> get copyWith =>
      __$$AppLogsStateImplCopyWithImpl<_$AppLogsStateImpl>(this, _$identity);
}

abstract class _AppLogsState implements AppLogsState {
  const factory _AppLogsState(
      {final List<AppLog> logs,
      final List<String> selected}) = _$AppLogsStateImpl;

  @override
  List<AppLog> get logs;
  @override
  List<String> get selected;
  @override
  @JsonKey(ignore: true)
  _$$AppLogsStateImplCopyWith<_$AppLogsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
