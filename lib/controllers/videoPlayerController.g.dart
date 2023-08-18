// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoPlayerController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoPlayerControllerCWProxy {
  VideoPlayerController videoController(
      BetterPlayerController? videoController);

  VideoPlayerController useDash(bool useDash);

  VideoPlayerController colors(ColorScheme colors);

  VideoPlayerController overFlowTextColor(Color overFlowTextColor);

  VideoPlayerController key(GlobalKey<State<StatefulWidget>> key);

  VideoPlayerController startAt(Duration? startAt);

  VideoPlayerController selectedNonDashTrack(String selectedNonDashTrack);

  VideoPlayerController bufferPosition(Duration? bufferPosition);

  VideoPlayerController video(Video? video);

  VideoPlayerController offlineVideo(DownloadedVideo? offlineVideo);

  VideoPlayerController disableControls(bool? disableControls);

  VideoPlayerController playNow(bool? playNow);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoPlayerController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoPlayerController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoPlayerController call({
    BetterPlayerController? videoController,
    bool? useDash,
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoPlayerController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoPlayerController.copyWith.fieldName(...)`
class _$VideoPlayerControllerCWProxyImpl
    implements _$VideoPlayerControllerCWProxy {
  const _$VideoPlayerControllerCWProxyImpl(this._value);

  final VideoPlayerController _value;

  @override
  VideoPlayerController videoController(
          BetterPlayerController? videoController) =>
      this(videoController: videoController);

  @override
  VideoPlayerController useDash(bool useDash) => this(useDash: useDash);

  @override
  VideoPlayerController colors(ColorScheme colors) => this(colors: colors);

  @override
  VideoPlayerController overFlowTextColor(Color overFlowTextColor) =>
      this(overFlowTextColor: overFlowTextColor);

  @override
  VideoPlayerController key(GlobalKey<State<StatefulWidget>> key) =>
      this(key: key);

  @override
  VideoPlayerController startAt(Duration? startAt) => this(startAt: startAt);

  @override
  VideoPlayerController selectedNonDashTrack(String selectedNonDashTrack) =>
      this(selectedNonDashTrack: selectedNonDashTrack);

  @override
  VideoPlayerController bufferPosition(Duration? bufferPosition) =>
      this(bufferPosition: bufferPosition);

  @override
  VideoPlayerController video(Video? video) => this(video: video);

  @override
  VideoPlayerController offlineVideo(DownloadedVideo? offlineVideo) =>
      this(offlineVideo: offlineVideo);

  @override
  VideoPlayerController disableControls(bool? disableControls) =>
      this(disableControls: disableControls);

  @override
  VideoPlayerController playNow(bool? playNow) => this(playNow: playNow);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoPlayerController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoPlayerController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoPlayerController call({
    Object? videoController = const $CopyWithPlaceholder(),
    Object? useDash = const $CopyWithPlaceholder(),
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
    return VideoPlayerController._(
      videoController == const $CopyWithPlaceholder()
          ? _value.videoController
          // ignore: cast_nullable_to_non_nullable
          : videoController as BetterPlayerController?,
      useDash == const $CopyWithPlaceholder() || useDash == null
          ? _value.useDash
          // ignore: cast_nullable_to_non_nullable
          : useDash as bool,
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

extension $VideoPlayerControllerCopyWith on VideoPlayerController {
  /// Returns a callable class that can be used as follows: `instanceOfVideoPlayerController.copyWith(...)` or like so:`instanceOfVideoPlayerController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoPlayerControllerCWProxy get copyWith =>
      _$VideoPlayerControllerCWProxyImpl(this);
}
