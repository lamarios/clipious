// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_list_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServerListSettingsState {
  List<Server> get dbServers => throw _privateConstructorUsedError;
  List<Server> get publicServers => throw _privateConstructorUsedError;
  double get publicServerProgress => throw _privateConstructorUsedError;
  bool get pinging => throw _privateConstructorUsedError;
  PublicServerErrors get publicServersError =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerListSettingsStateCopyWith<ServerListSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerListSettingsStateCopyWith<$Res> {
  factory $ServerListSettingsStateCopyWith(ServerListSettingsState value,
          $Res Function(ServerListSettingsState) then) =
      _$ServerListSettingsStateCopyWithImpl<$Res, ServerListSettingsState>;
  @useResult
  $Res call(
      {List<Server> dbServers,
      List<Server> publicServers,
      double publicServerProgress,
      bool pinging,
      PublicServerErrors publicServersError});
}

/// @nodoc
class _$ServerListSettingsStateCopyWithImpl<$Res,
        $Val extends ServerListSettingsState>
    implements $ServerListSettingsStateCopyWith<$Res> {
  _$ServerListSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbServers = null,
    Object? publicServers = null,
    Object? publicServerProgress = null,
    Object? pinging = null,
    Object? publicServersError = null,
  }) {
    return _then(_value.copyWith(
      dbServers: null == dbServers
          ? _value.dbServers
          : dbServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServers: null == publicServers
          ? _value.publicServers
          : publicServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServerProgress: null == publicServerProgress
          ? _value.publicServerProgress
          : publicServerProgress // ignore: cast_nullable_to_non_nullable
              as double,
      pinging: null == pinging
          ? _value.pinging
          : pinging // ignore: cast_nullable_to_non_nullable
              as bool,
      publicServersError: null == publicServersError
          ? _value.publicServersError
          : publicServersError // ignore: cast_nullable_to_non_nullable
              as PublicServerErrors,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerListSettingsStateImplCopyWith<$Res>
    implements $ServerListSettingsStateCopyWith<$Res> {
  factory _$$ServerListSettingsStateImplCopyWith(
          _$ServerListSettingsStateImpl value,
          $Res Function(_$ServerListSettingsStateImpl) then) =
      __$$ServerListSettingsStateImplCopyWithImpl<$Res>;
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
class __$$ServerListSettingsStateImplCopyWithImpl<$Res>
    extends _$ServerListSettingsStateCopyWithImpl<$Res,
        _$ServerListSettingsStateImpl>
    implements _$$ServerListSettingsStateImplCopyWith<$Res> {
  __$$ServerListSettingsStateImplCopyWithImpl(
      _$ServerListSettingsStateImpl _value,
      $Res Function(_$ServerListSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbServers = null,
    Object? publicServers = null,
    Object? publicServerProgress = null,
    Object? pinging = null,
    Object? publicServersError = null,
  }) {
    return _then(_$ServerListSettingsStateImpl(
      dbServers: null == dbServers
          ? _value._dbServers
          : dbServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServers: null == publicServers
          ? _value._publicServers
          : publicServers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      publicServerProgress: null == publicServerProgress
          ? _value.publicServerProgress
          : publicServerProgress // ignore: cast_nullable_to_non_nullable
              as double,
      pinging: null == pinging
          ? _value.pinging
          : pinging // ignore: cast_nullable_to_non_nullable
              as bool,
      publicServersError: null == publicServersError
          ? _value.publicServersError
          : publicServersError // ignore: cast_nullable_to_non_nullable
              as PublicServerErrors,
    ));
  }
}

/// @nodoc

class _$ServerListSettingsStateImpl implements _ServerListSettingsState {
  const _$ServerListSettingsStateImpl(
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

  @override
  String toString() {
    return 'ServerListSettingsState(dbServers: $dbServers, publicServers: $publicServers, publicServerProgress: $publicServerProgress, pinging: $pinging, publicServersError: $publicServersError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerListSettingsStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerListSettingsStateImplCopyWith<_$ServerListSettingsStateImpl>
      get copyWith => __$$ServerListSettingsStateImplCopyWithImpl<
          _$ServerListSettingsStateImpl>(this, _$identity);
}

abstract class _ServerListSettingsState implements ServerListSettingsState {
  const factory _ServerListSettingsState(
          {required final List<Server> dbServers,
          required final List<Server> publicServers,
          final double publicServerProgress,
          final bool pinging,
          final PublicServerErrors publicServersError}) =
      _$ServerListSettingsStateImpl;

  @override
  List<Server> get dbServers;
  @override
  List<Server> get publicServers;
  @override
  double get publicServerProgress;
  @override
  bool get pinging;
  @override
  PublicServerErrors get publicServersError;
  @override
  @JsonKey(ignore: true)
  _$$ServerListSettingsStateImplCopyWith<_$ServerListSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
