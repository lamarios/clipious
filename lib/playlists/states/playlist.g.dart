// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlaylistStateCWProxy {
  PlaylistState showImage(bool showImage);

  PlaylistState loadingProgress(double loadingProgress);

  PlaylistState playlist(Playlist playlist);

  PlaylistState loading(bool loading);

  PlaylistState scrollController(ScrollController scrollController);

  PlaylistState playlistItemHeight(double playlistItemHeight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlaylistState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlaylistState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlaylistState call({
    bool? showImage,
    double? loadingProgress,
    Playlist? playlist,
    bool? loading,
    ScrollController? scrollController,
    double? playlistItemHeight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlaylistState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlaylistState.copyWith.fieldName(...)`
class _$PlaylistStateCWProxyImpl implements _$PlaylistStateCWProxy {
  const _$PlaylistStateCWProxyImpl(this._value);

  final PlaylistState _value;

  @override
  PlaylistState showImage(bool showImage) => this(showImage: showImage);

  @override
  PlaylistState loadingProgress(double loadingProgress) =>
      this(loadingProgress: loadingProgress);

  @override
  PlaylistState playlist(Playlist playlist) => this(playlist: playlist);

  @override
  PlaylistState loading(bool loading) => this(loading: loading);

  @override
  PlaylistState scrollController(ScrollController scrollController) =>
      this(scrollController: scrollController);

  @override
  PlaylistState playlistItemHeight(double playlistItemHeight) =>
      this(playlistItemHeight: playlistItemHeight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlaylistState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlaylistState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlaylistState call({
    Object? showImage = const $CopyWithPlaceholder(),
    Object? loadingProgress = const $CopyWithPlaceholder(),
    Object? playlist = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? scrollController = const $CopyWithPlaceholder(),
    Object? playlistItemHeight = const $CopyWithPlaceholder(),
  }) {
    return PlaylistState._(
      showImage == const $CopyWithPlaceholder() || showImage == null
          ? _value.showImage
          // ignore: cast_nullable_to_non_nullable
          : showImage as bool,
      loadingProgress == const $CopyWithPlaceholder() || loadingProgress == null
          ? _value.loadingProgress
          // ignore: cast_nullable_to_non_nullable
          : loadingProgress as double,
      playlist == const $CopyWithPlaceholder() || playlist == null
          ? _value.playlist
          // ignore: cast_nullable_to_non_nullable
          : playlist as Playlist,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      scrollController == const $CopyWithPlaceholder() ||
              scrollController == null
          ? _value.scrollController
          // ignore: cast_nullable_to_non_nullable
          : scrollController as ScrollController,
      playlistItemHeight == const $CopyWithPlaceholder() ||
              playlistItemHeight == null
          ? _value.playlistItemHeight
          // ignore: cast_nullable_to_non_nullable
          : playlistItemHeight as double,
    );
  }
}

extension $PlaylistStateCopyWith on PlaylistState {
  /// Returns a callable class that can be used as follows: `instanceOfPlaylistState.copyWith(...)` or like so:`instanceOfPlaylistState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlaylistStateCWProxy get copyWith => _$PlaylistStateCWProxyImpl(this);
}
