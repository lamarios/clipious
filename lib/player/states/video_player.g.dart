// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoPlayerStateCWProxy {
  VideoPlayerState videoController(BetterPlayerController? videoController);

  VideoPlayerState colors(ColorScheme colors);

  VideoPlayerState overFlowTextColor(Color overFlowTextColor);

  VideoPlayerState key(GlobalKey<State<StatefulWidget>> key);

  VideoPlayerState startAt(Duration? startAt);

  VideoPlayerState selectedNonDashTrack(String selectedNonDashTrack);

  VideoPlayerState bufferPosition(Duration? bufferPosition);

  VideoPlayerState video(Video? video);

  VideoPlayerState offlineVideo(DownloadedVideo? offlineVideo);

  VideoPlayerState disableControls(bool? disableControls);

  VideoPlayerState playNow(bool? playNow);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoPlayerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoPlayerState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoPlayerState call({
    BetterPlayerController? videoController,
    ColorScheme? colors,
    Color? overFlowTextColor,
    GlobalKey<State<StatefulWidget>>? key,
    Duration? startAt,
    String? selectedNonDashTrack,
    Duration? bufferPosition,
    Video? video,
    DownloadedVideo? offlineVideo,
    bool? disableControls,
    bool? playNow,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoPlayerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoPlayerState.copyWith.fieldName(...)`
class _$VideoPlayerStateCWProxyImpl implements _$VideoPlayerStateCWProxy {
  const _$VideoPlayerStateCWProxyImpl(this._value);

  final VideoPlayerState _value;

  @override
  VideoPlayerState videoController(BetterPlayerController? videoController) =>
      this(videoController: videoController);

  @override
  VideoPlayerState colors(ColorScheme colors) => this(colors: colors);

  @override
  VideoPlayerState overFlowTextColor(Color overFlowTextColor) =>
      this(overFlowTextColor: overFlowTextColor);

  @override
  VideoPlayerState key(GlobalKey<State<StatefulWidget>> key) => this(key: key);

  @override
  VideoPlayerState startAt(Duration? startAt) => this(startAt: startAt);

  @override
  VideoPlayerState selectedNonDashTrack(String selectedNonDashTrack) =>
      this(selectedNonDashTrack: selectedNonDashTrack);

  @override
  VideoPlayerState bufferPosition(Duration? bufferPosition) =>
      this(bufferPosition: bufferPosition);

  @override
  VideoPlayerState video(Video? video) => this(video: video);

  @override
  VideoPlayerState offlineVideo(DownloadedVideo? offlineVideo) =>
      this(offlineVideo: offlineVideo);

  @override
  VideoPlayerState disableControls(bool? disableControls) =>
      this(disableControls: disableControls);

  @override
  VideoPlayerState playNow(bool? playNow) => this(playNow: playNow);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoPlayerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoPlayerState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoPlayerState call({
    Object? videoController = const $CopyWithPlaceholder(),
    Object? colors = const $CopyWithPlaceholder(),
    Object? overFlowTextColor = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
    Object? startAt = const $CopyWithPlaceholder(),
    Object? selectedNonDashTrack = const $CopyWithPlaceholder(),
    Object? bufferPosition = const $CopyWithPlaceholder(),
    Object? video = const $CopyWithPlaceholder(),
    Object? offlineVideo = const $CopyWithPlaceholder(),
    Object? disableControls = const $CopyWithPlaceholder(),
    Object? playNow = const $CopyWithPlaceholder(),
  }) {
    return VideoPlayerState._(
      videoController == const $CopyWithPlaceholder()
          ? _value.videoController
          // ignore: cast_nullable_to_non_nullable
          : videoController as BetterPlayerController?,
      colors == const $CopyWithPlaceholder() || colors == null
          ? _value.colors
          // ignore: cast_nullable_to_non_nullable
          : colors as ColorScheme,
      overFlowTextColor == const $CopyWithPlaceholder() ||
              overFlowTextColor == null
          ? _value.overFlowTextColor
          // ignore: cast_nullable_to_non_nullable
          : overFlowTextColor as Color,
      key == const $CopyWithPlaceholder() || key == null
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as GlobalKey<State<StatefulWidget>>,
      startAt == const $CopyWithPlaceholder()
          ? _value.startAt
          // ignore: cast_nullable_to_non_nullable
          : startAt as Duration?,
      selectedNonDashTrack == const $CopyWithPlaceholder() ||
              selectedNonDashTrack == null
          ? _value.selectedNonDashTrack
          // ignore: cast_nullable_to_non_nullable
          : selectedNonDashTrack as String,
      bufferPosition == const $CopyWithPlaceholder()
          ? _value.bufferPosition
          // ignore: cast_nullable_to_non_nullable
          : bufferPosition as Duration?,
      video: video == const $CopyWithPlaceholder()
          ? _value.video
          // ignore: cast_nullable_to_non_nullable
          : video as Video?,
      offlineVideo: offlineVideo == const $CopyWithPlaceholder()
          ? _value.offlineVideo
          // ignore: cast_nullable_to_non_nullable
          : offlineVideo as DownloadedVideo?,
      disableControls: disableControls == const $CopyWithPlaceholder()
          ? _value.disableControls
          // ignore: cast_nullable_to_non_nullable
          : disableControls as bool?,
      playNow: playNow == const $CopyWithPlaceholder()
          ? _value.playNow
          // ignore: cast_nullable_to_non_nullable
          : playNow as bool?,
    );
  }
}

extension $VideoPlayerStateCopyWith on VideoPlayerState {
  /// Returns a callable class that can be used as follows: `instanceOfVideoPlayerState.copyWith(...)` or like so:`instanceOfVideoPlayerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoPlayerStateCWProxy get copyWith => _$VideoPlayerStateCWProxyImpl(this);
}
