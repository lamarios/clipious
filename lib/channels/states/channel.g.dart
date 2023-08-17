// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChannelControllerCWProxy {
  ChannelController channelId(String channelId);

  ChannelController isSubscribed(bool isSubscribed);

  ChannelController selectedIndex(int selectedIndex);

  ChannelController channel(Channel? channel);

  ChannelController loading(bool loading);

  ChannelController smallHeader(bool smallHeader);

  ChannelController barHeight(double barHeight);

  ChannelController barOpacity(double barOpacity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChannelController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChannelController(...).copyWith(id: 12, name: "My name")
  /// ````
  ChannelController call({
    String? channelId,
    bool? isSubscribed,
    int? selectedIndex,
    Channel? channel,
    bool? loading,
    bool? smallHeader,
    double? barHeight,
    double? barOpacity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChannelController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChannelController.copyWith.fieldName(...)`
class _$ChannelControllerCWProxyImpl implements _$ChannelControllerCWProxy {
  const _$ChannelControllerCWProxyImpl(this._value);

  final ChannelController _value;

  @override
  ChannelController channelId(String channelId) => this(channelId: channelId);

  @override
  ChannelController isSubscribed(bool isSubscribed) =>
      this(isSubscribed: isSubscribed);

  @override
  ChannelController selectedIndex(int selectedIndex) =>
      this(selectedIndex: selectedIndex);

  @override
  ChannelController channel(Channel? channel) => this(channel: channel);

  @override
  ChannelController loading(bool loading) => this(loading: loading);

  @override
  ChannelController smallHeader(bool smallHeader) =>
      this(smallHeader: smallHeader);

  @override
  ChannelController barHeight(double barHeight) => this(barHeight: barHeight);

  @override
  ChannelController barOpacity(double barOpacity) =>
      this(barOpacity: barOpacity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChannelController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChannelController(...).copyWith(id: 12, name: "My name")
  /// ````
  ChannelController call({
    Object? channelId = const $CopyWithPlaceholder(),
    Object? isSubscribed = const $CopyWithPlaceholder(),
    Object? selectedIndex = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? smallHeader = const $CopyWithPlaceholder(),
    Object? barHeight = const $CopyWithPlaceholder(),
    Object? barOpacity = const $CopyWithPlaceholder(),
  }) {
    return ChannelController._(
      channelId == const $CopyWithPlaceholder() || channelId == null
          ? _value.channelId
          // ignore: cast_nullable_to_non_nullable
          : channelId as String,
      isSubscribed == const $CopyWithPlaceholder() || isSubscribed == null
          ? _value.isSubscribed
          // ignore: cast_nullable_to_non_nullable
          : isSubscribed as bool,
      selectedIndex == const $CopyWithPlaceholder() || selectedIndex == null
          ? _value.selectedIndex
          // ignore: cast_nullable_to_non_nullable
          : selectedIndex as int,
      channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as Channel?,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      smallHeader == const $CopyWithPlaceholder() || smallHeader == null
          ? _value.smallHeader
          // ignore: cast_nullable_to_non_nullable
          : smallHeader as bool,
      barHeight == const $CopyWithPlaceholder() || barHeight == null
          ? _value.barHeight
          // ignore: cast_nullable_to_non_nullable
          : barHeight as double,
      barOpacity == const $CopyWithPlaceholder() || barOpacity == null
          ? _value.barOpacity
          // ignore: cast_nullable_to_non_nullable
          : barOpacity as double,
    );
  }
}

extension $ChannelControllerCopyWith on ChannelController {
  /// Returns a callable class that can be used as follows: `instanceOfChannelController.copyWith(...)` or like so:`instanceOfChannelController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChannelControllerCWProxy get copyWith =>
      _$ChannelControllerCWProxyImpl(this);
}
