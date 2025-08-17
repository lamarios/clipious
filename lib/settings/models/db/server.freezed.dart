// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Server {
  String get url;
  String? get authToken;
  String? get sidCookie;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get ping;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get flag;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get region;
  Map<String, String> get customHeaders;
  bool get inUse;

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerCopyWith<Server> get copyWith =>
      _$ServerCopyWithImpl<Server>(this as Server, _$identity);

  /// Serializes this Server to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Server &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.sidCookie, sidCookie) ||
                other.sidCookie == sidCookie) &&
            (identical(other.ping, ping) || other.ping == ping) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.region, region) || other.region == region) &&
            const DeepCollectionEquality()
                .equals(other.customHeaders, customHeaders) &&
            (identical(other.inUse, inUse) || other.inUse == inUse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, authToken, sidCookie, ping,
      flag, region, const DeepCollectionEquality().hash(customHeaders), inUse);

  @override
  String toString() {
    return 'Server(url: $url, authToken: $authToken, sidCookie: $sidCookie, ping: $ping, flag: $flag, region: $region, customHeaders: $customHeaders, inUse: $inUse)';
  }
}

/// @nodoc
abstract mixin class $ServerCopyWith<$Res> {
  factory $ServerCopyWith(Server value, $Res Function(Server) _then) =
      _$ServerCopyWithImpl;
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
class _$ServerCopyWithImpl<$Res> implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._self, this._then);

  final Server _self;
  final $Res Function(Server) _then;

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
    return _then(_self.copyWith(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: freezed == authToken
          ? _self.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      sidCookie: freezed == sidCookie
          ? _self.sidCookie
          : sidCookie // ignore: cast_nullable_to_non_nullable
              as String?,
      ping: freezed == ping
          ? _self.ping
          : ping // ignore: cast_nullable_to_non_nullable
              as Duration?,
      flag: freezed == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      customHeaders: null == customHeaders
          ? _self.customHeaders
          : customHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      inUse: null == inUse
          ? _self.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Server].
extension ServerPatterns on Server {
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
    TResult Function(_Server value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Server() when $default != null:
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
    TResult Function(_Server value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Server():
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
    TResult? Function(_Server value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Server() when $default != null:
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
            String url,
            String? authToken,
            String? sidCookie,
            @JsonKey(includeFromJson: false, includeToJson: false)
            Duration? ping,
            @JsonKey(includeFromJson: false, includeToJson: false) String? flag,
            @JsonKey(includeFromJson: false, includeToJson: false)
            String? region,
            Map<String, String> customHeaders,
            bool inUse)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Server() when $default != null:
        return $default(_that.url, _that.authToken, _that.sidCookie, _that.ping,
            _that.flag, _that.region, _that.customHeaders, _that.inUse);
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
            String url,
            String? authToken,
            String? sidCookie,
            @JsonKey(includeFromJson: false, includeToJson: false)
            Duration? ping,
            @JsonKey(includeFromJson: false, includeToJson: false) String? flag,
            @JsonKey(includeFromJson: false, includeToJson: false)
            String? region,
            Map<String, String> customHeaders,
            bool inUse)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Server():
        return $default(_that.url, _that.authToken, _that.sidCookie, _that.ping,
            _that.flag, _that.region, _that.customHeaders, _that.inUse);
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
            String url,
            String? authToken,
            String? sidCookie,
            @JsonKey(includeFromJson: false, includeToJson: false)
            Duration? ping,
            @JsonKey(includeFromJson: false, includeToJson: false) String? flag,
            @JsonKey(includeFromJson: false, includeToJson: false)
            String? region,
            Map<String, String> customHeaders,
            bool inUse)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Server() when $default != null:
        return $default(_that.url, _that.authToken, _that.sidCookie, _that.ping,
            _that.flag, _that.region, _that.customHeaders, _that.inUse);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Server extends Server {
  const _Server(
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
  factory _Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

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

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerCopyWith<_Server> get copyWith =>
      __$ServerCopyWithImpl<_Server>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Server &&
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

  @override
  String toString() {
    return 'Server(url: $url, authToken: $authToken, sidCookie: $sidCookie, ping: $ping, flag: $flag, region: $region, customHeaders: $customHeaders, inUse: $inUse)';
  }
}

/// @nodoc
abstract mixin class _$ServerCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) _then) =
      __$ServerCopyWithImpl;
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
class __$ServerCopyWithImpl<$Res> implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(this._self, this._then);

  final _Server _self;
  final $Res Function(_Server) _then;

  /// Create a copy of Server
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Server(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: freezed == authToken
          ? _self.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      sidCookie: freezed == sidCookie
          ? _self.sidCookie
          : sidCookie // ignore: cast_nullable_to_non_nullable
              as String?,
      ping: freezed == ping
          ? _self.ping
          : ping // ignore: cast_nullable_to_non_nullable
              as Duration?,
      flag: freezed == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      customHeaders: null == customHeaders
          ? _self._customHeaders
          : customHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      inUse: null == inUse
          ? _self.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
