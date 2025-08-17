// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_list_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerListSettingsState {
  List<Server> get dbServers;
  List<Server> get publicServers;
  double get publicServerProgress;
  bool get pinging;
  PublicServerErrors get publicServersError;

  /// Create a copy of ServerListSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerListSettingsStateCopyWith<ServerListSettingsState> get copyWith =>
      _$ServerListSettingsStateCopyWithImpl<ServerListSettingsState>(
          this as ServerListSettingsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerListSettingsState &&
            const DeepCollectionEquality().equals(other.dbServers, dbServers) &&
            const DeepCollectionEquality()
                .equals(other.publicServers, publicServers) &&
            (identical(other.publicServerProgress, publicServerProgress) ||
                other.publicServerProgress == publicServerProgress) &&
            (identical(other.pinging, pinging) || other.pinging == pinging) &&
            (identical(other.publicServersError, publicServersError) ||
                other.publicServersError == publicServersError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dbServers),
      const DeepCollectionEquality().hash(publicServers),
      publicServerProgress,
      pinging,
      publicServersError);

  @override
  String toString() {
    return 'ServerListSettingsState(dbServers: $dbServers, publicServers: $publicServers, publicServerProgress: $publicServerProgress, pinging: $pinging, publicServersError: $publicServersError)';
  }
}

/// @nodoc
abstract mixin class $ServerListSettingsStateCopyWith<$Res> {
  factory $ServerListSettingsStateCopyWith(ServerListSettingsState value,
          $Res Function(ServerListSettingsState) _then) =
      _$ServerListSettingsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Server> dbServers,
      List<Server> publicServers,
      double publicServerProgress,
      bool pinging,
      PublicServerErrors publicServersError});
}

/// @nodoc
class _$ServerListSettingsStateCopyWithImpl<$Res>
    implements $ServerListSettingsStateCopyWith<$Res> {
  _$ServerListSettingsStateCopyWithImpl(this._self, this._then);

  final ServerListSettingsState _self;
  final $Res Function(ServerListSettingsState) _then;

  /// Create a copy of ServerListSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbServers = null,
    Object? publicServers = null,
    Object? publicServerProgress = null,
    Object? pinging = null,
    Object? publicServersError = null,
  }) {
    return _then(_self.copyWith(
      dbServers: null == dbServers
          ? _self.dbServers
          : dbServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServers: null == publicServers
          ? _self.publicServers
          : publicServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServerProgress: null == publicServerProgress
          ? _self.publicServerProgress
          : publicServerProgress // ignore: cast_nullable_to_non_nullable
              as double,
      pinging: null == pinging
          ? _self.pinging
          : pinging // ignore: cast_nullable_to_non_nullable
              as bool,
      publicServersError: null == publicServersError
          ? _self.publicServersError
          : publicServersError // ignore: cast_nullable_to_non_nullable
              as PublicServerErrors,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServerListSettingsState].
extension ServerListSettingsStatePatterns on ServerListSettingsState {
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
    TResult Function(_ServerListSettingsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServerListSettingsState() when $default != null:
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
    TResult Function(_ServerListSettingsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerListSettingsState():
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
    TResult? Function(_ServerListSettingsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerListSettingsState() when $default != null:
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
    TResult Function(
            List<Server> dbServers,
            List<Server> publicServers,
            double publicServerProgress,
            bool pinging,
            PublicServerErrors publicServersError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServerListSettingsState() when $default != null:
        return $default(
            _that.dbServers,
            _that.publicServers,
            _that.publicServerProgress,
            _that.pinging,
            _that.publicServersError);
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
    TResult Function(
            List<Server> dbServers,
            List<Server> publicServers,
            double publicServerProgress,
            bool pinging,
            PublicServerErrors publicServersError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerListSettingsState():
        return $default(
            _that.dbServers,
            _that.publicServers,
            _that.publicServerProgress,
            _that.pinging,
            _that.publicServersError);
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
    TResult? Function(
            List<Server> dbServers,
            List<Server> publicServers,
            double publicServerProgress,
            bool pinging,
            PublicServerErrors publicServersError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerListSettingsState() when $default != null:
        return $default(
            _that.dbServers,
            _that.publicServers,
            _that.publicServerProgress,
            _that.pinging,
            _that.publicServersError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ServerListSettingsState implements ServerListSettingsState {
  const _ServerListSettingsState(
      {required final List<Server> dbServers,
      required final List<Server> publicServers,
      this.publicServerProgress = 0,
      this.pinging = true,
      this.publicServersError = PublicServerErrors.none})
      : _dbServers = dbServers,
        _publicServers = publicServers;

  final List<Server> _dbServers;
  @override
  List<Server> get dbServers {
    if (_dbServers is EqualUnmodifiableListView) return _dbServers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dbServers);
  }

  final List<Server> _publicServers;
  @override
  List<Server> get publicServers {
    if (_publicServers is EqualUnmodifiableListView) return _publicServers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publicServers);
  }

  @override
  @JsonKey()
  final double publicServerProgress;
  @override
  @JsonKey()
  final bool pinging;
  @override
  @JsonKey()
  final PublicServerErrors publicServersError;

  /// Create a copy of ServerListSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerListSettingsStateCopyWith<_ServerListSettingsState> get copyWith =>
      __$ServerListSettingsStateCopyWithImpl<_ServerListSettingsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerListSettingsState &&
            const DeepCollectionEquality()
                .equals(other._dbServers, _dbServers) &&
            const DeepCollectionEquality()
                .equals(other._publicServers, _publicServers) &&
            (identical(other.publicServerProgress, publicServerProgress) ||
                other.publicServerProgress == publicServerProgress) &&
            (identical(other.pinging, pinging) || other.pinging == pinging) &&
            (identical(other.publicServersError, publicServersError) ||
                other.publicServersError == publicServersError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dbServers),
      const DeepCollectionEquality().hash(_publicServers),
      publicServerProgress,
      pinging,
      publicServersError);

  @override
  String toString() {
    return 'ServerListSettingsState(dbServers: $dbServers, publicServers: $publicServers, publicServerProgress: $publicServerProgress, pinging: $pinging, publicServersError: $publicServersError)';
  }
}

/// @nodoc
abstract mixin class _$ServerListSettingsStateCopyWith<$Res>
    implements $ServerListSettingsStateCopyWith<$Res> {
  factory _$ServerListSettingsStateCopyWith(_ServerListSettingsState value,
          $Res Function(_ServerListSettingsState) _then) =
      __$ServerListSettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Server> dbServers,
      List<Server> publicServers,
      double publicServerProgress,
      bool pinging,
      PublicServerErrors publicServersError});
}

/// @nodoc
class __$ServerListSettingsStateCopyWithImpl<$Res>
    implements _$ServerListSettingsStateCopyWith<$Res> {
  __$ServerListSettingsStateCopyWithImpl(this._self, this._then);

  final _ServerListSettingsState _self;
  final $Res Function(_ServerListSettingsState) _then;

  /// Create a copy of ServerListSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dbServers = null,
    Object? publicServers = null,
    Object? publicServerProgress = null,
    Object? pinging = null,
    Object? publicServersError = null,
  }) {
    return _then(_ServerListSettingsState(
      dbServers: null == dbServers
          ? _self._dbServers
          : dbServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServers: null == publicServers
          ? _self._publicServers
          : publicServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServerProgress: null == publicServerProgress
          ? _self.publicServerProgress
          : publicServerProgress // ignore: cast_nullable_to_non_nullable
              as double,
      pinging: null == pinging
          ? _self.pinging
          : pinging // ignore: cast_nullable_to_non_nullable
              as bool,
      publicServersError: null == publicServersError
          ? _self.publicServersError
          : publicServersError // ignore: cast_nullable_to_non_nullable
              as PublicServerErrors,
    ));
  }
}

// dart format on
