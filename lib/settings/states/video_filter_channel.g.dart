// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_filter_channel.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterChannelStateCWProxy {
  VideoFilterChannelState filters(List<VideoFilter> filters);

  VideoFilterChannelState channel(Channel? channel);

  VideoFilterChannelState loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterChannelState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterChannelState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterChannelState call({
    List<VideoFilter>? filters,
    Channel? channel,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterChannelState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterChannelState.copyWith.fieldName(...)`
class _$VideoFilterChannelStateCWProxyImpl implements _$VideoFilterChannelStateCWProxy {
  const _$VideoFilterChannelStateCWProxyImpl(this._value);

  final VideoFilterChannelState _value;

  @override
  VideoFilterChannelState filters(List<VideoFilter> filters) => this(filters: filters);

  @override
  VideoFilterChannelState channel(Channel? channel) => this(channel: channel);

  @override
  VideoFilterChannelState loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterChannelState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterChannelState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterChannelState call({
    Object? filters = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterChannelState(
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

extension $VideoFilterChannelStateCopyWith on VideoFilterChannelState {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterChannelState.copyWith(...)` or like so:`instanceOfVideoFilterChannelState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterChannelStateCWProxy get copyWith => _$VideoFilterChannelStateCWProxyImpl(this);
}
