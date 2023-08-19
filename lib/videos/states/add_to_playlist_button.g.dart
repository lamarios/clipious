// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_playlist_button.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddToPlaylistButtonStateCWProxy {
  AddToPlaylistButtonState videoId(String? videoId);

  AddToPlaylistButtonState isLoggedIn(bool isLoggedIn);

  AddToPlaylistButtonState playListCount(int playListCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddToPlaylistButtonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddToPlaylistButtonState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddToPlaylistButtonState call({
    String? videoId,
    bool? isLoggedIn,
    int? playListCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddToPlaylistButtonState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddToPlaylistButtonState.copyWith.fieldName(...)`
class _$AddToPlaylistButtonStateCWProxyImpl
    implements _$AddToPlaylistButtonStateCWProxy {
  const _$AddToPlaylistButtonStateCWProxyImpl(this._value);

  final AddToPlaylistButtonState _value;

  @override
  AddToPlaylistButtonState videoId(String? videoId) => this(videoId: videoId);

  @override
  AddToPlaylistButtonState isLoggedIn(bool isLoggedIn) =>
      this(isLoggedIn: isLoggedIn);

  @override
  AddToPlaylistButtonState playListCount(int playListCount) =>
      this(playListCount: playListCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddToPlaylistButtonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddToPlaylistButtonState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddToPlaylistButtonState call({
    Object? videoId = const $CopyWithPlaceholder(),
    Object? isLoggedIn = const $CopyWithPlaceholder(),
    Object? playListCount = const $CopyWithPlaceholder(),
  }) {
    return AddToPlaylistButtonState._(
      videoId == const $CopyWithPlaceholder()
          ? _value.videoId
          // ignore: cast_nullable_to_non_nullable
          : videoId as String?,
      isLoggedIn == const $CopyWithPlaceholder() || isLoggedIn == null
          ? _value.isLoggedIn
          // ignore: cast_nullable_to_non_nullable
          : isLoggedIn as bool,
      playListCount == const $CopyWithPlaceholder() || playListCount == null
          ? _value.playListCount
          // ignore: cast_nullable_to_non_nullable
          : playListCount as int,
    );
  }
}

extension $AddToPlaylistButtonStateCopyWith on AddToPlaylistButtonState {
  /// Returns a callable class that can be used as follows: `instanceOfAddToPlaylistButtonState.copyWith(...)` or like so:`instanceOfAddToPlaylistButtonState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddToPlaylistButtonStateCWProxy get copyWith =>
      _$AddToPlaylistButtonStateCWProxyImpl(this);
}
