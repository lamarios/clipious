// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServerCWProxy {
  Server url(String url);

  Server authToken(String? authToken);

  Server sidCookie(String? sidCookie);

  Server ping(Duration? ping);

  Server flag(String? flag);

  Server region(String? region);

  Server inUse(bool inUse);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Server(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Server(...).copyWith(id: 12, name: "My name")
  /// ````
  Server call({
    String? url,
    String? authToken,
    String? sidCookie,
    Duration? ping,
    String? flag,
    String? region,
    bool? inUse,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfServer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfServer.copyWith.fieldName(...)`
class _$ServerCWProxyImpl implements _$ServerCWProxy {
  const _$ServerCWProxyImpl(this._value);

  final Server _value;

  @override
  Server url(String url) => this(url: url);

  @override
  Server authToken(String? authToken) => this(authToken: authToken);

  @override
  Server sidCookie(String? sidCookie) => this(sidCookie: sidCookie);

  @override
  Server ping(Duration? ping) => this(ping: ping);

  @override
  Server flag(String? flag) => this(flag: flag);

  @override
  Server region(String? region) => this(region: region);

  @override
  Server inUse(bool inUse) => this(inUse: inUse);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Server(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Server(...).copyWith(id: 12, name: "My name")
  /// ````
  Server call({
    Object? url = const $CopyWithPlaceholder(),
    Object? authToken = const $CopyWithPlaceholder(),
    Object? sidCookie = const $CopyWithPlaceholder(),
    Object? ping = const $CopyWithPlaceholder(),
    Object? flag = const $CopyWithPlaceholder(),
    Object? region = const $CopyWithPlaceholder(),
    Object? inUse = const $CopyWithPlaceholder(),
  }) {
    return Server(
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      authToken: authToken == const $CopyWithPlaceholder()
          ? _value.authToken
          // ignore: cast_nullable_to_non_nullable
          : authToken as String?,
      sidCookie: sidCookie == const $CopyWithPlaceholder()
          ? _value.sidCookie
          // ignore: cast_nullable_to_non_nullable
          : sidCookie as String?,
      ping: ping == const $CopyWithPlaceholder()
          ? _value.ping
          // ignore: cast_nullable_to_non_nullable
          : ping as Duration?,
      flag: flag == const $CopyWithPlaceholder()
          ? _value.flag
          // ignore: cast_nullable_to_non_nullable
          : flag as String?,
      region: region == const $CopyWithPlaceholder()
          ? _value.region
          // ignore: cast_nullable_to_non_nullable
          : region as String?,
      inUse: inUse == const $CopyWithPlaceholder() || inUse == null
          ? _value.inUse
          // ignore: cast_nullable_to_non_nullable
          : inUse as bool,
    );
  }
}

extension $ServerCopyWith on Server {
  /// Returns a callable class that can be used as follows: `instanceOfServer.copyWith(...)` or like so:`instanceOfServer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServerCWProxy get copyWith => _$ServerCWProxyImpl(this);
}
