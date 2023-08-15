// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_filter_channel.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterChannelModelCWProxy {
  VideoFilterChannelModel filters(List<VideoFilter> filters);

  VideoFilterChannelModel channel(Channel? channel);

  VideoFilterChannelModel loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterChannelModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterChannelModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterChannelModel call({
    List<VideoFilter>? filters,
    Channel? channel,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterChannelModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterChannelModel.copyWith.fieldName(...)`
class _$VideoFilterChannelModelCWProxyImpl
    implements _$VideoFilterChannelModelCWProxy {
  const _$VideoFilterChannelModelCWProxyImpl(this._value);

  final VideoFilterChannelModel _value;

  @override
  VideoFilterChannelModel filters(List<VideoFilter> filters) =>
      this(filters: filters);

  @override
  VideoFilterChannelModel channel(Channel? channel) => this(channel: channel);

  @override
  VideoFilterChannelModel loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterChannelModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterChannelModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterChannelModel call({
    Object? filters = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterChannelModel(
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

extension $VideoFilterChannelModelCopyWith on VideoFilterChannelModel {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterChannelModel.copyWith(...)` or like so:`instanceOfVideoFilterChannelModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterChannelModelCWProxy get copyWith =>
      _$VideoFilterChannelModelCWProxyImpl(this);
}
