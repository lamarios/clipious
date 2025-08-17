// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppLogsState {
  List<AppLog> get logs;
  List<String> get selected;

  /// Create a copy of AppLogsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppLogsStateCopyWith<AppLogsState> get copyWith =>
      _$AppLogsStateCopyWithImpl<AppLogsState>(
          this as AppLogsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppLogsState &&
            const DeepCollectionEquality().equals(other.logs, logs) &&
            const DeepCollectionEquality().equals(other.selected, selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logs),
      const DeepCollectionEquality().hash(selected));

  @override
  String toString() {
    return 'AppLogsState(logs: $logs, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $AppLogsStateCopyWith<$Res> {
  factory $AppLogsStateCopyWith(
          AppLogsState value, $Res Function(AppLogsState) _then) =
      _$AppLogsStateCopyWithImpl;
  @useResult
  $Res call({List<AppLog> logs, List<String> selected});
}

/// @nodoc
class _$AppLogsStateCopyWithImpl<$Res> implements $AppLogsStateCopyWith<$Res> {
  _$AppLogsStateCopyWithImpl(this._self, this._then);

  final AppLogsState _self;
  final $Res Function(AppLogsState) _then;

  /// Create a copy of AppLogsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
    Object? selected = null,
  }) {
    return _then(_self.copyWith(
      logs: null == logs
          ? _self.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<AppLog>,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppLogsState].
extension AppLogsStatePatterns on AppLogsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppLogsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppLogsState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppLogsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppLogsState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppLogsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppLogsState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<AppLog> logs, List<String> selected)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppLogsState() when $default != null:
        return $default(_that.logs, _that.selected);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<AppLog> logs, List<String> selected) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppLogsState():
        return $default(_that.logs, _that.selected);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<AppLog> logs, List<String> selected)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppLogsState() when $default != null:
        return $default(_that.logs, _that.selected);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppLogsState implements AppLogsState {
  const _AppLogsState(
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

  /// Create a copy of AppLogsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppLogsStateCopyWith<_AppLogsState> get copyWith =>
      __$AppLogsStateCopyWithImpl<_AppLogsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppLogsState &&
            const DeepCollectionEquality().equals(other._logs, _logs) &&
            const DeepCollectionEquality().equals(other._selected, _selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_logs),
      const DeepCollectionEquality().hash(_selected));

  @override
  String toString() {
    return 'AppLogsState(logs: $logs, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class _$AppLogsStateCopyWith<$Res>
    implements $AppLogsStateCopyWith<$Res> {
  factory _$AppLogsStateCopyWith(
          _AppLogsState value, $Res Function(_AppLogsState) _then) =
      __$AppLogsStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<AppLog> logs, List<String> selected});
}

/// @nodoc
class __$AppLogsStateCopyWithImpl<$Res>
    implements _$AppLogsStateCopyWith<$Res> {
  __$AppLogsStateCopyWithImpl(this._self, this._then);

  final _AppLogsState _self;
  final $Res Function(_AppLogsState) _then;

  /// Create a copy of AppLogsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? logs = null,
    Object? selected = null,
  }) {
    return _then(_AppLogsState(
      logs: null == logs
          ? _self._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<AppLog>,
      selected: null == selected
          ? _self._selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
