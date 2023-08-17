// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_in_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoInListStateCWProxy {
  VideoInListState progress(double progress);

  VideoInListState video(BaseVideo video);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoInListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoInListState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoInListState call({
    double? progress,
    BaseVideo? video,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoInListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoInListState.copyWith.fieldName(...)`
class _$VideoInListStateCWProxyImpl implements _$VideoInListStateCWProxy {
  const _$VideoInListStateCWProxyImpl(this._value);

  final VideoInListState _value;

  @override
  VideoInListState progress(double progress) => this(progress: progress);

  @override
  VideoInListState video(BaseVideo video) => this(video: video);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoInListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoInListState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoInListState call({
    Object? progress = const $CopyWithPlaceholder(),
    Object? video = const $CopyWithPlaceholder(),
  }) {
    return VideoInListState._(
      progress == const $CopyWithPlaceholder() || progress == null
          ? _value.progress
          // ignore: cast_nullable_to_non_nullable
          : progress as double,
      video == const $CopyWithPlaceholder() || video == null
          ? _value.video
          // ignore: cast_nullable_to_non_nullable
          : video as BaseVideo,
    );
  }
}

extension $VideoInListStateCopyWith on VideoInListState {
  /// Returns a callable class that can be used as follows: `instanceOfVideoInListState.copyWith(...)` or like so:`instanceOfVideoInListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoInListStateCWProxy get copyWith => _$VideoInListStateCWProxyImpl(this);
}
