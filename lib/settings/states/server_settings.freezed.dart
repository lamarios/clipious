// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerSettingsState {
  Server get server;
  bool get canDelete;

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerSettingsStateCopyWith<ServerSettingsState> get copyWith =>
      _$ServerSettingsStateCopyWithImpl<ServerSettingsState>(
          this as ServerSettingsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerSettingsState &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, server, canDelete);

  @override
  String toString() {
    return 'ServerSettingsState(server: $server, canDelete: $canDelete)';
  }
}

/// @nodoc
abstract mixin class $ServerSettingsStateCopyWith<$Res> {
  factory $ServerSettingsStateCopyWith(
          ServerSettingsState value, $Res Function(ServerSettingsState) _then) =
      _$ServerSettingsStateCopyWithImpl;
  @useResult
  $Res call({Server server, bool canDelete});

  $ServerCopyWith<$Res> get server;
}

/// @nodoc
class _$ServerSettingsStateCopyWithImpl<$Res>
    implements $ServerSettingsStateCopyWith<$Res> {
  _$ServerSettingsStateCopyWithImpl(this._self, this._then);

  final ServerSettingsState _self;
  final $Res Function(ServerSettingsState) _then;

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? server = null,
    Object? canDelete = null,
  }) {
    return _then(_self.copyWith(
      server: null == server
          ? _self.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server,
      canDelete: null == canDelete
          ? _self.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerCopyWith<$Res> get server {
    return $ServerCopyWith<$Res>(_self.server, (value) {
      return _then(_self.copyWith(server: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ServerSettingsState].
extension ServerSettingsStatePatterns on ServerSettingsState {
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
    TResult Function(_ServerSettingsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServerSettingsState() when $default != null:
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
    TResult Function(_ServerSettingsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerSettingsState():
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
    TResult? Function(_ServerSettingsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerSettingsState() when $default != null:
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
    TResult Function(Server server, bool canDelete)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServerSettingsState() when $default != null:
        return $default(_that.server, _that.canDelete);
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
    TResult Function(Server server, bool canDelete) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerSettingsState():
        return $default(_that.server, _that.canDelete);
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
    TResult? Function(Server server, bool canDelete)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerSettingsState() when $default != null:
        return $default(_that.server, _that.canDelete);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ServerSettingsState extends ServerSettingsState {
  const _ServerSettingsState({required this.server, this.canDelete = false})
      : super._();

  @override
  final Server server;
  @override
  @JsonKey()
  final bool canDelete;

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerSettingsStateCopyWith<_ServerSettingsState> get copyWith =>
      __$ServerSettingsStateCopyWithImpl<_ServerSettingsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerSettingsState &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, server, canDelete);

  @override
  String toString() {
    return 'ServerSettingsState(server: $server, canDelete: $canDelete)';
  }
}

/// @nodoc
abstract mixin class _$ServerSettingsStateCopyWith<$Res>
    implements $ServerSettingsStateCopyWith<$Res> {
  factory _$ServerSettingsStateCopyWith(_ServerSettingsState value,
          $Res Function(_ServerSettingsState) _then) =
      __$ServerSettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call({Server server, bool canDelete});

  @override
  $ServerCopyWith<$Res> get server;
}

/// @nodoc
class __$ServerSettingsStateCopyWithImpl<$Res>
    implements _$ServerSettingsStateCopyWith<$Res> {
  __$ServerSettingsStateCopyWithImpl(this._self, this._then);

  final _ServerSettingsState _self;
  final $Res Function(_ServerSettingsState) _then;

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? server = null,
    Object? canDelete = null,
  }) {
    return _then(_ServerSettingsState(
      server: null == server
          ? _self.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server,
      canDelete: null == canDelete
          ? _self.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerCopyWith<$Res> get server {
    return $ServerCopyWith<$Res>(_self.server, (value) {
      return _then(_self.copyWith(server: value));
    });
  }
}

// dart format on
