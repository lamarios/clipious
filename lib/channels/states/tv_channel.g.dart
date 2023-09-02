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

  TvChannelController videosTitle(GlobalKey<State<StatefulWidget>> videosTitle);

  TvChannelController shortTitle(GlobalKey<State<StatefulWidget>> shortTitle);

  TvChannelController streamTitle(GlobalKey<State<StatefulWidget>> streamTitle);

  TvChannelController playlistsTitle(
      GlobalKey<State<StatefulWidget>> playlistsTitle);

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
    GlobalKey<State<StatefulWidget>>? videosTitle,
    GlobalKey<State<StatefulWidget>>? shortTitle,
    GlobalKey<State<StatefulWidget>>? streamTitle,
    GlobalKey<State<StatefulWidget>>? playlistsTitle,
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
  TvChannelController videosTitle(
          GlobalKey<State<StatefulWidget>> videosTitle) =>
      this(videosTitle: videosTitle);

  @override
  TvChannelController shortTitle(GlobalKey<State<StatefulWidget>> shortTitle) =>
      this(shortTitle: shortTitle);

  @override
  TvChannelController streamTitle(
          GlobalKey<State<StatefulWidget>> streamTitle) =>
      this(streamTitle: streamTitle);

  @override
  TvChannelController playlistsTitle(
          GlobalKey<State<StatefulWidget>> playlistsTitle) =>
      this(playlistsTitle: playlistsTitle);

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
    Object? videosTitle = const $CopyWithPlaceholder(),
    Object? shortTitle = const $CopyWithPlaceholder(),
    Object? streamTitle = const $CopyWithPlaceholder(),
    Object? playlistsTitle = const $CopyWithPlaceholder(),
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
      videosTitle == const $CopyWithPlaceholder() || videosTitle == null
          ? _value.videosTitle
          // ignore: cast_nullable_to_non_nullable
          : videosTitle as GlobalKey<State<StatefulWidget>>,
      shortTitle == const $CopyWithPlaceholder() || shortTitle == null
          ? _value.shortTitle
          // ignore: cast_nullable_to_non_nullable
          : shortTitle as GlobalKey<State<StatefulWidget>>,
      streamTitle == const $CopyWithPlaceholder() || streamTitle == null
          ? _value.streamTitle
          // ignore: cast_nullable_to_non_nullable
          : streamTitle as GlobalKey<State<StatefulWidget>>,
      playlistsTitle == const $CopyWithPlaceholder() || playlistsTitle == null
          ? _value.playlistsTitle
          // ignore: cast_nullable_to_non_nullable
          : playlistsTitle as GlobalKey<State<StatefulWidget>>,
    );
  }
}

extension $TvChannelControllerCopyWith on TvChannelController {
  /// Returns a callable class that can be used as follows: `instanceOfTvChannelController.copyWith(...)` or like so:`instanceOfTvChannelController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvChannelControllerCWProxy get copyWith =>
      _$TvChannelControllerCWProxyImpl(this);
}
