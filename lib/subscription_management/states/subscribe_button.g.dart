// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_button.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubscribeButtonStateCWProxy {
  SubscribeButtonState channelId(String channelId);

  SubscribeButtonState isSubscribed(bool isSubscribed);

  SubscribeButtonState loading(bool loading);

  SubscribeButtonState isLoggedIn(bool isLoggedIn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubscribeButtonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubscribeButtonState(...).copyWith(id: 12, name: "My name")
  /// ````
  SubscribeButtonState call({
    String? channelId,
    bool? isSubscribed,
    bool? loading,
    bool? isLoggedIn,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubscribeButtonState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubscribeButtonState.copyWith.fieldName(...)`
class _$SubscribeButtonStateCWProxyImpl implements _$SubscribeButtonStateCWProxy {
  const _$SubscribeButtonStateCWProxyImpl(this._value);

  final SubscribeButtonState _value;

  @override
  SubscribeButtonState channelId(String channelId) => this(channelId: channelId);

  @override
  SubscribeButtonState isSubscribed(bool isSubscribed) => this(isSubscribed: isSubscribed);

  @override
  SubscribeButtonState loading(bool loading) => this(loading: loading);

  @override
  SubscribeButtonState isLoggedIn(bool isLoggedIn) => this(isLoggedIn: isLoggedIn);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubscribeButtonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubscribeButtonState(...).copyWith(id: 12, name: "My name")
  /// ````
  SubscribeButtonState call({
    Object? channelId = const $CopyWithPlaceholder(),
    Object? isSubscribed = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? isLoggedIn = const $CopyWithPlaceholder(),
  }) {
    return SubscribeButtonState._(
      channelId == const $CopyWithPlaceholder() || channelId == null
          ? _value.channelId
          // ignore: cast_nullable_to_non_nullable
          : channelId as String,
      isSubscribed == const $CopyWithPlaceholder() || isSubscribed == null
          ? _value.isSubscribed
          // ignore: cast_nullable_to_non_nullable
          : isSubscribed as bool,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      isLoggedIn == const $CopyWithPlaceholder() || isLoggedIn == null
          ? _value.isLoggedIn
          // ignore: cast_nullable_to_non_nullable
          : isLoggedIn as bool,
    );
  }
}

extension $SubscribeButtonStateCopyWith on SubscribeButtonState {
  /// Returns a callable class that can be used as follows: `instanceOfSubscribeButtonState.copyWith(...)` or like so:`instanceOfSubscribeButtonState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubscribeButtonStateCWProxy get copyWith => _$SubscribeButtonStateCWProxyImpl(this);
}
