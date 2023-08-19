// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_like.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoLikeButtonControllerCWProxy {
  VideoLikeButtonController isLoggedIn(bool isLoggedIn);

  VideoLikeButtonController videoId(String? videoId);

  VideoLikeButtonController isVideoLiked(bool isVideoLiked);

  VideoLikeButtonController loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoLikeButtonController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoLikeButtonController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoLikeButtonController call({
    bool? isLoggedIn,
    String? videoId,
    bool? isVideoLiked,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoLikeButtonController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoLikeButtonController.copyWith.fieldName(...)`
class _$VideoLikeButtonControllerCWProxyImpl implements _$VideoLikeButtonControllerCWProxy {
  const _$VideoLikeButtonControllerCWProxyImpl(this._value);

  final VideoLikeButtonController _value;

  @override
  VideoLikeButtonController isLoggedIn(bool isLoggedIn) => this(isLoggedIn: isLoggedIn);

  @override
  VideoLikeButtonController videoId(String? videoId) => this(videoId: videoId);

  @override
  VideoLikeButtonController isVideoLiked(bool isVideoLiked) => this(isVideoLiked: isVideoLiked);

  @override
  VideoLikeButtonController loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoLikeButtonController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoLikeButtonController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoLikeButtonController call({
    Object? isLoggedIn = const $CopyWithPlaceholder(),
    Object? videoId = const $CopyWithPlaceholder(),
    Object? isVideoLiked = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return VideoLikeButtonController._(
      isLoggedIn == const $CopyWithPlaceholder() || isLoggedIn == null
          ? _value.isLoggedIn
          // ignore: cast_nullable_to_non_nullable
          : isLoggedIn as bool,
      videoId == const $CopyWithPlaceholder()
          ? _value.videoId
          // ignore: cast_nullable_to_non_nullable
          : videoId as String?,
      isVideoLiked == const $CopyWithPlaceholder() || isVideoLiked == null
          ? _value.isVideoLiked
          // ignore: cast_nullable_to_non_nullable
          : isVideoLiked as bool,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $VideoLikeButtonControllerCopyWith on VideoLikeButtonController {
  /// Returns a callable class that can be used as follows: `instanceOfVideoLikeButtonController.copyWith(...)` or like so:`instanceOfVideoLikeButtonController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoLikeButtonControllerCWProxy get copyWith => _$VideoLikeButtonControllerCWProxyImpl(this);
}
