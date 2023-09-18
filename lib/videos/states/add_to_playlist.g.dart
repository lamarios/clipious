// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_playlist.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddToPlaylistControllerCWProxy {
  AddToPlaylistController playlists(List<Playlist> playlists);

  AddToPlaylistController playListCount(int playListCount);

  AddToPlaylistController videoId(String videoId);

  AddToPlaylistController loading(bool loading);

  AddToPlaylistController isLoggedIn(bool isLoggedIn);

  AddToPlaylistController isVideoLiked(bool isVideoLiked);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddToPlaylistController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddToPlaylistController(...).copyWith(id: 12, name: "My name")
  /// ````
  AddToPlaylistController call({
    List<Playlist>? playlists,
    int? playListCount,
    String? videoId,
    bool? loading,
    bool? isLoggedIn,
    bool? isVideoLiked,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddToPlaylistController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddToPlaylistController.copyWith.fieldName(...)`
class _$AddToPlaylistControllerCWProxyImpl
    implements _$AddToPlaylistControllerCWProxy {
  const _$AddToPlaylistControllerCWProxyImpl(this._value);

  final AddToPlaylistController _value;

  @override
  AddToPlaylistController playlists(List<Playlist> playlists) =>
      this(playlists: playlists);

  @override
  AddToPlaylistController playListCount(int playListCount) =>
      this(playListCount: playListCount);

  @override
  AddToPlaylistController videoId(String videoId) => this(videoId: videoId);

  @override
  AddToPlaylistController loading(bool loading) => this(loading: loading);

  @override
  AddToPlaylistController isLoggedIn(bool isLoggedIn) =>
      this(isLoggedIn: isLoggedIn);

  @override
  AddToPlaylistController isVideoLiked(bool isVideoLiked) =>
      this(isVideoLiked: isVideoLiked);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddToPlaylistController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddToPlaylistController(...).copyWith(id: 12, name: "My name")
  /// ````
  AddToPlaylistController call({
    Object? playlists = const $CopyWithPlaceholder(),
    Object? playListCount = const $CopyWithPlaceholder(),
    Object? videoId = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? isLoggedIn = const $CopyWithPlaceholder(),
    Object? isVideoLiked = const $CopyWithPlaceholder(),
  }) {
    return AddToPlaylistController._(
      playlists == const $CopyWithPlaceholder() || playlists == null
          ? _value.playlists
          // ignore: cast_nullable_to_non_nullable
          : playlists as List<Playlist>,
      playListCount == const $CopyWithPlaceholder() || playListCount == null
          ? _value.playListCount
          // ignore: cast_nullable_to_non_nullable
          : playListCount as int,
      videoId == const $CopyWithPlaceholder() || videoId == null
          ? _value.videoId
          // ignore: cast_nullable_to_non_nullable
          : videoId as String,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      isLoggedIn == const $CopyWithPlaceholder() || isLoggedIn == null
          ? _value.isLoggedIn
          // ignore: cast_nullable_to_non_nullable
          : isLoggedIn as bool,
      isVideoLiked == const $CopyWithPlaceholder() || isVideoLiked == null
          ? _value.isVideoLiked
          // ignore: cast_nullable_to_non_nullable
          : isVideoLiked as bool,
    );
  }
}

extension $AddToPlaylistControllerCopyWith on AddToPlaylistController {
  /// Returns a callable class that can be used as follows: `instanceOfAddToPlaylistController.copyWith(...)` or like so:`instanceOfAddToPlaylistController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddToPlaylistControllerCWProxy get copyWith =>
      _$AddToPlaylistControllerCWProxyImpl(this);
}
