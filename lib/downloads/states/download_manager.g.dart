// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_manager.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DownloadManagerStateCWProxy {
  DownloadManagerState videos(List<DownloadedVideo> videos);

  DownloadManagerState downloadProgresses(
      Map<String, DownloadProgress> downloadProgresses);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DownloadManagerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DownloadManagerState(...).copyWith(id: 12, name: "My name")
  /// ````
  DownloadManagerState call({
    List<DownloadedVideo>? videos,
    Map<String, DownloadProgress>? downloadProgresses,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDownloadManagerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDownloadManagerState.copyWith.fieldName(...)`
class _$DownloadManagerStateCWProxyImpl
    implements _$DownloadManagerStateCWProxy {
  const _$DownloadManagerStateCWProxyImpl(this._value);

  final DownloadManagerState _value;

  @override
  DownloadManagerState videos(List<DownloadedVideo> videos) =>
      this(videos: videos);

  @override
  DownloadManagerState downloadProgresses(
          Map<String, DownloadProgress> downloadProgresses) =>
      this(downloadProgresses: downloadProgresses);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DownloadManagerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DownloadManagerState(...).copyWith(id: 12, name: "My name")
  /// ````
  DownloadManagerState call({
    Object? videos = const $CopyWithPlaceholder(),
    Object? downloadProgresses = const $CopyWithPlaceholder(),
  }) {
    return DownloadManagerState._(
      videos == const $CopyWithPlaceholder() || videos == null
          ? _value.videos
          // ignore: cast_nullable_to_non_nullable
          : videos as List<DownloadedVideo>,
      downloadProgresses == const $CopyWithPlaceholder() ||
              downloadProgresses == null
          ? _value.downloadProgresses
          // ignore: cast_nullable_to_non_nullable
          : downloadProgresses as Map<String, DownloadProgress>,
    );
  }
}

extension $DownloadManagerStateCopyWith on DownloadManagerState {
  /// Returns a callable class that can be used as follows: `instanceOfDownloadManagerState.copyWith(...)` or like so:`instanceOfDownloadManagerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DownloadManagerStateCWProxy get copyWith =>
      _$DownloadManagerStateCWProxyImpl(this);
}
