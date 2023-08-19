// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_video.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DownloadedVideoStateCWProxy {
  DownloadedVideoState video(DownloadedVideo? video);

  DownloadedVideoState thumbnailPath(String? thumbnailPath);

  DownloadedVideoState progress(double progress);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DownloadedVideoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DownloadedVideoState(...).copyWith(id: 12, name: "My name")
  /// ````
  DownloadedVideoState call({
    DownloadedVideo? video,
    String? thumbnailPath,
    double? progress,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDownloadedVideoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDownloadedVideoState.copyWith.fieldName(...)`
class _$DownloadedVideoStateCWProxyImpl implements _$DownloadedVideoStateCWProxy {
  const _$DownloadedVideoStateCWProxyImpl(this._value);

  final DownloadedVideoState _value;

  @override
  DownloadedVideoState video(DownloadedVideo? video) => this(video: video);

  @override
  DownloadedVideoState thumbnailPath(String? thumbnailPath) => this(thumbnailPath: thumbnailPath);

  @override
  DownloadedVideoState progress(double progress) => this(progress: progress);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DownloadedVideoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DownloadedVideoState(...).copyWith(id: 12, name: "My name")
  /// ````
  DownloadedVideoState call({
    Object? video = const $CopyWithPlaceholder(),
    Object? thumbnailPath = const $CopyWithPlaceholder(),
    Object? progress = const $CopyWithPlaceholder(),
  }) {
    return DownloadedVideoState._(
      video == const $CopyWithPlaceholder()
          ? _value.video
          // ignore: cast_nullable_to_non_nullable
          : video as DownloadedVideo?,
      thumbnailPath == const $CopyWithPlaceholder()
          ? _value.thumbnailPath
          // ignore: cast_nullable_to_non_nullable
          : thumbnailPath as String?,
      progress == const $CopyWithPlaceholder() || progress == null
          ? _value.progress
          // ignore: cast_nullable_to_non_nullable
          : progress as double,
    );
  }
}

extension $DownloadedVideoStateCopyWith on DownloadedVideoState {
  /// Returns a callable class that can be used as follows: `instanceOfDownloadedVideoState.copyWith(...)` or like so:`instanceOfDownloadedVideoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DownloadedVideoStateCWProxy get copyWith => _$DownloadedVideoStateCWProxyImpl(this);
}
