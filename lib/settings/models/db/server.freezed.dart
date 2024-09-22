// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Server _$ServerFromJson(Map<String, dynamic> json) {
  return _Server.fromJson(json);
}

/// @nodoc
mixin _$Server {
  String get url => throw _privateConstructorUsedError;
  String? get authToken => throw _privateConstructorUsedError;
  String? get sidCookie => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get ping => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get flag => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get region => throw _privateConstructorUsedError;
  Map<String, String> get customHeaders => throw _privateConstructorUsedError;
  bool get inUse => throw _privateConstructorUsedError;

  /// Serializes this Server to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerCopyWith<Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerCopyWith<$Res> {
  factory $ServerCopyWith(Server value, $Res Function(Server) then) =
      _$ServerCopyWithImpl<$Res, Server>;
  @useResult
  $Res call(
      {String url,
      String? authToken,
      String? sidCookie,
      @JsonKey(includeFromJson: false, includeToJson: false) Duration? ping,
      @JsonKey(includeFromJson: false, includeToJson: false) String? flag,
      @JsonKey(includeFromJson: false, includeToJson: false) String? region,
      Map<String, String> customHeaders,
      bool inUse});
}

/// @nodoc
class _$ServerCopyWithImpl<$Res, $Val extends Server>
    implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? authToken = freezed,
    Object? sidCookie = freezed,
    Object? ping = freezed,
    Object? flag = freezed,
    Object? region = freezed,
    Object? customHeaders = null,
    Object? inUse = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      sidCookie: freezed == sidCookie
          ? _value.sidCookie
          : sidCookie // ignore: cast_nullable_to_non_nullable
              as String?,
      ping: freezed == ping
          ? _value.ping
          : ping // ignore: cast_nullable_to_non_nullable
              as Duration?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      customHeaders: null == customHeaders
          ? _value.customHeaders
          : customHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      inUse: null == inUse
          ? _value.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerImplCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$$ServerImplCopyWith(
          _$ServerImpl value, $Res Function(_$ServerImpl) then) =
      __$$ServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String? authToken,
      String? sidCookie,
      @JsonKey(includeFromJson: false, includeToJson: false) Duration? ping,
      @JsonKey(includeFromJson: false, includeToJson: false) String? flag,
      @JsonKey(includeFromJson: false, includeToJson: false) String? region,
      Map<String, String> customHeaders,
      bool inUse});
}

/// @nodoc
class __$$ServerImplCopyWithImpl<$Res>
    extends _$ServerCopyWithImpl<$Res, _$ServerImpl>
    implements _$$ServerImplCopyWith<$Res> {
  __$$ServerImplCopyWithImpl(
      _$ServerImpl _value, $Res Function(_$ServerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? authToken = freezed,
    Object? sidCookie = freezed,
    Object? ping = freezed,
    Object? flag = freezed,
    Object? region = freezed,
    Object? customHeaders = null,
    Object? inUse = null,
  }) {
    return _then(_$ServerImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      sidCookie: freezed == sidCookie
          ? _value.sidCookie
          : sidCookie // ignore: cast_nullable_to_non_nullable
              as String?,
      ping: freezed == ping
          ? _value.ping
          : ping // ignore: cast_nullable_to_non_nullable
              as Duration?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      customHeaders: null == customHeaders
          ? _value._customHeaders
          : customHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      inUse: null == inUse
          ? _value.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerImpl extends _Server {
  const _$ServerImpl(
      {required this.url,
      this.authToken,
      this.sidCookie,
      @JsonKey(includeFromJson: false, includeToJson: false) this.ping,
      @JsonKey(includeFromJson: false, includeToJson: false) this.flag,
      @JsonKey(includeFromJson: false, includeToJson: false) this.region,
      final Map<String, String> customHeaders = const {},
      this.inUse = false})
      : _customHeaders = customHeaders,
        super._();

  factory _$ServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerImplFromJson(json);

  @override
  final String url;
  @override
  final String? authToken;
  @override
  final String? sidCookie;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Duration? ping;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? flag;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? region;
  final Map<String, String> _customHeaders;
  @override
  @JsonKey()
  Map<String, String> get customHeaders {
    if (_customHeaders is EqualUnmodifiableMapView) return _customHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customHeaders);
  }

  @override
  @JsonKey()
  final bool inUse;

  @override
  String toString() {
    return 'Server(url: $url, authToken: $authToken, sidCookie: $sidCookie, ping: $ping, flag: $flag, region: $region, customHeaders: $customHeaders, inUse: $inUse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.sidCookie, sidCookie) ||
                other.sidCookie == sidCookie) &&
            (identical(other.ping, ping) || other.ping == ping) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.region, region) || other.region == region) &&
            const DeepCollectionEquality()
                .equals(other._customHeaders, _customHeaders) &&
            (identical(other.inUse, inUse) || other.inUse == inUse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, authToken, sidCookie, ping,
      flag, region, const DeepCollectionEquality().hash(_customHeaders), inUse);

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      __$$ServerImplCopyWithImpl<_$ServerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerImplToJson(
      this,
    );
  }
}

abstract class _Server extends Server {
  const factory _Server(
      {required final String url,
      final String? authToken,
      final String? sidCookie,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Duration? ping,
      @JsonKey(includeFromJson: false, includeToJson: false) final String? flag,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? region,
      final Map<String, String> customHeaders,
      final bool inUse}) = _$ServerImpl;
  const _Server._() : super._();

  factory _Server.fromJson(Map<String, dynamic> json) = _$ServerImpl.fromJson;

  @override
  String get url;
  @override
  String? get authToken;
  @override
  String? get sidCookie;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get ping;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get flag;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get region;
  @override
  Map<String, String> get customHeaders;
  @override
  bool get inUse;

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
