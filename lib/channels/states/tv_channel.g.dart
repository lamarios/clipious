// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_channel.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvChannelControllerCWProxy {
  TvChannelController scrollController(ScrollController scrollController);

  TvChannelController showBackground(bool showBackground);

  TvChannelController hasShorts(bool hasShorts);

  TvChannelController hasStreams(bool hasStreams);

  TvChannelController hasVideos(bool hasVideos);

  TvChannelController hasPlaylist(bool hasPlaylist);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvChannelController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvChannelController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvChannelController call({
    ScrollController? scrollController,
    bool? showBackground,
    bool? hasShorts,
    bool? hasStreams,
    bool? hasVideos,
    bool? hasPlaylist,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvChannelController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvChannelController.copyWith.fieldName(...)`
class _$TvChannelControllerCWProxyImpl implements _$TvChannelControllerCWProxy {
  const _$TvChannelControllerCWProxyImpl(this._value);

  final TvChannelController _value;

  @override
  TvChannelController scrollController(ScrollController scrollController) =>
      this(scrollController: scrollController);

  @override
  TvChannelController showBackground(bool showBackground) =>
      this(showBackground: showBackground);

  @override
  TvChannelController hasShorts(bool hasShorts) => this(hasShorts: hasShorts);

  @override
  TvChannelController hasStreams(bool hasStreams) =>
      this(hasStreams: hasStreams);

  @override
  TvChannelController hasVideos(bool hasVideos) => this(hasVideos: hasVideos);

  @override
  TvChannelController hasPlaylist(bool hasPlaylist) =>
      this(hasPlaylist: hasPlaylist);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvChannelController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvChannelController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvChannelController call({
    Object? scrollController = const $CopyWithPlaceholder(),
    Object? showBackground = const $CopyWithPlaceholder(),
    Object? hasShorts = const $CopyWithPlaceholder(),
    Object? hasStreams = const $CopyWithPlaceholder(),
    Object? hasVideos = const $CopyWithPlaceholder(),
    Object? hasPlaylist = const $CopyWithPlaceholder(),
  }) {
    return TvChannelController._(
      scrollController == const $CopyWithPlaceholder() ||
              scrollController == null
          ? _value.scrollController
          // ignore: cast_nullable_to_non_nullable
          : scrollController as ScrollController,
      showBackground == const $CopyWithPlaceholder() || showBackground == null
          ? _value.showBackground
          // ignore: cast_nullable_to_non_nullable
          : showBackground as bool,
      hasShorts == const $CopyWithPlaceholder() || hasShorts == null
          ? _value.hasShorts
          // ignore: cast_nullable_to_non_nullable
          : hasShorts as bool,
      hasStreams == const $CopyWithPlaceholder() || hasStreams == null
          ? _value.hasStreams
          // ignore: cast_nullable_to_non_nullable
          : hasStreams as bool,
      hasVideos == const $CopyWithPlaceholder() || hasVideos == null
          ? _value.hasVideos
          // ignore: cast_nullable_to_non_nullable
          : hasVideos as bool,
      hasPlaylist == const $CopyWithPlaceholder() || hasPlaylist == null
          ? _value.hasPlaylist
          // ignore: cast_nullable_to_non_nullable
          : hasPlaylist as bool,
    );
  }
}

extension $TvChannelControllerCopyWith on TvChannelController {
  /// Returns a callable class that can be used as follows: `instanceOfTvChannelController.copyWith(...)` or like so:`instanceOfTvChannelController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvChannelControllerCWProxy get copyWith =>
      _$TvChannelControllerCWProxyImpl(this);
}
