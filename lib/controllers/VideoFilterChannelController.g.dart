// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoFilterChannelController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterChannelControllerCWProxy {
  VideoFilterChannelController filters(List<VideoFilter> filters);

  VideoFilterChannelController channel(Channel? channel);

  VideoFilterChannelController loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterChannelController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterChannelController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterChannelController call({
    List<VideoFilter>? filters,
    Channel? channel,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterChannelController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterChannelController.copyWith.fieldName(...)`
class _$VideoFilterChannelControllerCWProxyImpl
    implements _$VideoFilterChannelControllerCWProxy {
  const _$VideoFilterChannelControllerCWProxyImpl(this._value);

  final VideoFilterChannelController _value;

  @override
  VideoFilterChannelController filters(List<VideoFilter> filters) =>
      this(filters: filters);

  @override
  VideoFilterChannelController channel(Channel? channel) =>
      this(channel: channel);

  @override
  VideoFilterChannelController loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterChannelController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterChannelController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterChannelController call({
    Object? filters = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterChannelController(
      filters: filters == const $CopyWithPlaceholder() || filters == null
          ? _value.filters
          // ignore: cast_nullable_to_non_nullable
          : filters as List<VideoFilter>,
      channel: channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as Channel?,
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $VideoFilterChannelControllerCopyWith
    on VideoFilterChannelController {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterChannelController.copyWith(...)` or like so:`instanceOfVideoFilterChannelController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterChannelControllerCWProxy get copyWith =>
      _$VideoFilterChannelControllerCWProxyImpl(this);
}
