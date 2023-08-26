// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlaylistListStateCWProxy {
  PlaylistListState paginatedList(PaginatedList<Playlist> paginatedList);

  PlaylistListState playlists(List<Playlist> playlists);

  PlaylistListState loading(bool loading);

  PlaylistListState scrollController(ScrollController scrollController);

  PlaylistListState error(String error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlaylistListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlaylistListState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlaylistListState call({
    PaginatedList<Playlist>? paginatedList,
    List<Playlist>? playlists,
    bool? loading,
    ScrollController? scrollController,
    String? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlaylistListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlaylistListState.copyWith.fieldName(...)`
class _$PlaylistListStateCWProxyImpl implements _$PlaylistListStateCWProxy {
  const _$PlaylistListStateCWProxyImpl(this._value);

  final PlaylistListState _value;

  @override
  PlaylistListState paginatedList(PaginatedList<Playlist> paginatedList) =>
      this(paginatedList: paginatedList);

  @override
  PlaylistListState playlists(List<Playlist> playlists) =>
      this(playlists: playlists);

  @override
  PlaylistListState loading(bool loading) => this(loading: loading);

  @override
  PlaylistListState scrollController(ScrollController scrollController) =>
      this(scrollController: scrollController);

  @override
  PlaylistListState error(String error) => this(error: error);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlaylistListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlaylistListState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlaylistListState call({
    Object? paginatedList = const $CopyWithPlaceholder(),
    Object? playlists = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? scrollController = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return PlaylistListState._(
      paginatedList == const $CopyWithPlaceholder() || paginatedList == null
          ? _value.paginatedList
          // ignore: cast_nullable_to_non_nullable
          : paginatedList as PaginatedList<Playlist>,
      playlists == const $CopyWithPlaceholder() || playlists == null
          ? _value.playlists
          // ignore: cast_nullable_to_non_nullable
          : playlists as List<Playlist>,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      scrollController == const $CopyWithPlaceholder() ||
              scrollController == null
          ? _value.scrollController
          // ignore: cast_nullable_to_non_nullable
          : scrollController as ScrollController,
      error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String,
    );
  }
}

extension $PlaylistListStateCopyWith on PlaylistListState {
  /// Returns a callable class that can be used as follows: `instanceOfPlaylistListState.copyWith(...)` or like so:`instanceOfPlaylistListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlaylistListStateCWProxy get copyWith =>
      _$PlaylistListStateCWProxyImpl(this);
}
