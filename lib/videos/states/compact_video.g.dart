// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compact_video.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompactVideoStateCWProxy {
  CompactVideoState offlineVideo(DownloadedVideo? offlineVideo);

  CompactVideoState offlineVideoThumbnailPath(
      String? offlineVideoThumbnailPath);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompactVideoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompactVideoState(...).copyWith(id: 12, name: "My name")
  /// ````
  CompactVideoState call({
    DownloadedVideo? offlineVideo,
    String? offlineVideoThumbnailPath,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompactVideoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompactVideoState.copyWith.fieldName(...)`
class _$CompactVideoStateCWProxyImpl implements _$CompactVideoStateCWProxy {
  const _$CompactVideoStateCWProxyImpl(this._value);

  final CompactVideoState _value;

  @override
  CompactVideoState offlineVideo(DownloadedVideo? offlineVideo) =>
      this(offlineVideo: offlineVideo);

  @override
  CompactVideoState offlineVideoThumbnailPath(
          String? offlineVideoThumbnailPath) =>
      this(offlineVideoThumbnailPath: offlineVideoThumbnailPath);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompactVideoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompactVideoState(...).copyWith(id: 12, name: "My name")
  /// ````
  CompactVideoState call({
    Object? offlineVideo = const $CopyWithPlaceholder(),
    Object? offlineVideoThumbnailPath = const $CopyWithPlaceholder(),
  }) {
    return CompactVideoState._(
      offlineVideo == const $CopyWithPlaceholder()
          ? _value.offlineVideo
          // ignore: cast_nullable_to_non_nullable
          : offlineVideo as DownloadedVideo?,
      offlineVideoThumbnailPath == const $CopyWithPlaceholder()
          ? _value.offlineVideoThumbnailPath
          // ignore: cast_nullable_to_non_nullable
          : offlineVideoThumbnailPath as String?,
    );
  }
}

extension $CompactVideoStateCopyWith on CompactVideoState {
  /// Returns a callable class that can be used as follows: `instanceOfCompactVideoState.copyWith(...)` or like so:`instanceOfCompactVideoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompactVideoStateCWProxy get copyWith =>
      _$CompactVideoStateCWProxyImpl(this);
}
