// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServerSettingsState {
  Server get server => throw _privateConstructorUsedError;
  bool get canDelete => throw _privateConstructorUsedError;

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerSettingsStateCopyWith<ServerSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerSettingsStateCopyWith<$Res> {
  factory $ServerSettingsStateCopyWith(
          ServerSettingsState value, $Res Function(ServerSettingsState) then) =
      _$ServerSettingsStateCopyWithImpl<$Res, ServerSettingsState>;
  @useResult
  $Res call({Server server, bool canDelete});

  $ServerCopyWith<$Res> get server;
}

/// @nodoc
class _$ServerSettingsStateCopyWithImpl<$Res, $Val extends ServerSettingsState>
    implements $ServerSettingsStateCopyWith<$Res> {
  _$ServerSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? server = null,
    Object? canDelete = null,
  }) {
    return _then(_value.copyWith(
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerCopyWith<$Res> get server {
    return $ServerCopyWith<$Res>(_value.server, (value) {
      return _then(_value.copyWith(server: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServerSettingsStateImplCopyWith<$Res>
    implements $ServerSettingsStateCopyWith<$Res> {
  factory _$$ServerSettingsStateImplCopyWith(_$ServerSettingsStateImpl value,
          $Res Function(_$ServerSettingsStateImpl) then) =
      __$$ServerSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Server server, bool canDelete});

  @override
  $ServerCopyWith<$Res> get server;
}

/// @nodoc
class __$$ServerSettingsStateImplCopyWithImpl<$Res>
    extends _$ServerSettingsStateCopyWithImpl<$Res, _$ServerSettingsStateImpl>
    implements _$$ServerSettingsStateImplCopyWith<$Res> {
  __$$ServerSettingsStateImplCopyWithImpl(_$ServerSettingsStateImpl _value,
      $Res Function(_$ServerSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? server = null,
    Object? canDelete = null,
  }) {
    return _then(_$ServerSettingsStateImpl(
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServerSettingsStateImpl extends _ServerSettingsState {
  const _$ServerSettingsStateImpl(
      {required this.server, this.canDelete = false})
      : super._();

  @override
  final Server server;
  @override
  @JsonKey()
  final bool canDelete;

  @override
  String toString() {
    return 'ServerSettingsState(server: $server, canDelete: $canDelete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerSettingsStateImpl &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, server, canDelete);

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerSettingsStateImplCopyWith<_$ServerSettingsStateImpl> get copyWith =>
      __$$ServerSettingsStateImplCopyWithImpl<_$ServerSettingsStateImpl>(
          this, _$identity);
}

abstract class _ServerSettingsState extends ServerSettingsState {
  const factory _ServerSettingsState(
      {required final Server server,
      final bool canDelete}) = _$ServerSettingsStateImpl;
  const _ServerSettingsState._() : super._();

  @override
  Server get server;
  @override
  bool get canDelete;

  /// Create a copy of ServerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerSettingsStateImplCopyWith<_$ServerSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
