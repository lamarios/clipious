// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audioPlayerController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AudioPlayerControllerCWProxy {
  AudioPlayerController player(AudioPlayer? player);

  AudioPlayerController audioLength(Duration audioLength);

  AudioPlayerController audioPosition(Duration audioPosition);

  AudioPlayerController previousSponsorCheck(int previousSponsorCheck);

  AudioPlayerController loading(bool loading);

  AudioPlayerController error(String? error);

  AudioPlayerController video(Video? video);

  AudioPlayerController offlineVideo(DownloadedVideo? offlineVideo);

  AudioPlayerController disableControls(bool? disableControls);

  AudioPlayerController playNow(bool? playNow);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AudioPlayerController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AudioPlayerController(...).copyWith(id: 12, name: "My name")
  /// ````
  AudioPlayerController call({
    AudioPlayer? player,
    Duration? audioLength,
    Duration? audioPosition,
    int? previousSponsorCheck,
    bool? loading,
    String? error,
    Video? video,
    DownloadedVideo? offlineVideo,
    bool? disableControls,
    bool? playNow,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAudioPlayerController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAudioPlayerController.copyWith.fieldName(...)`
class _$AudioPlayerControllerCWProxyImpl
    implements _$AudioPlayerControllerCWProxy {
  const _$AudioPlayerControllerCWProxyImpl(this._value);

  final AudioPlayerController _value;

  @override
  AudioPlayerController player(AudioPlayer? player) => this(player: player);

  @override
  AudioPlayerController audioLength(Duration audioLength) =>
      this(audioLength: audioLength);

  @override
  AudioPlayerController audioPosition(Duration audioPosition) =>
      this(audioPosition: audioPosition);

  @override
  AudioPlayerController previousSponsorCheck(int previousSponsorCheck) =>
      this(previousSponsorCheck: previousSponsorCheck);

  @override
  AudioPlayerController loading(bool loading) => this(loading: loading);

  @override
  AudioPlayerController error(String? error) => this(error: error);

  @override
  AudioPlayerController video(Video? video) => this(video: video);

  @override
  AudioPlayerController offlineVideo(DownloadedVideo? offlineVideo) =>
      this(offlineVideo: offlineVideo);

  @override
  AudioPlayerController disableControls(bool? disableControls) =>
      this(disableControls: disableControls);

  @override
  AudioPlayerController playNow(bool? playNow) => this(playNow: playNow);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AudioPlayerController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AudioPlayerController(...).copyWith(id: 12, name: "My name")
  /// ````
  AudioPlayerController call({
    Object? player = const $CopyWithPlaceholder(),
    Object? audioLength = const $CopyWithPlaceholder(),
    Object? audioPosition = const $CopyWithPlaceholder(),
    Object? previousSponsorCheck = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? video = const $CopyWithPlaceholder(),
    Object? offlineVideo = const $CopyWithPlaceholder(),
    Object? disableControls = const $CopyWithPlaceholder(),
    Object? playNow = const $CopyWithPlaceholder(),
  }) {
    return AudioPlayerController._(
      player == const $CopyWithPlaceholder()
          ? _value.player
          // ignore: cast_nullable_to_non_nullable
          : player as AudioPlayer?,
      audioLength == const $CopyWithPlaceholder() || audioLength == null
          ? _value.audioLength
          // ignore: cast_nullable_to_non_nullable
          : audioLength as Duration,
      audioPosition == const $CopyWithPlaceholder() || audioPosition == null
          ? _value.audioPosition
          // ignore: cast_nullable_to_non_nullable
          : audioPosition as Duration,
      previousSponsorCheck == const $CopyWithPlaceholder() ||
              previousSponsorCheck == null
          ? _value.previousSponsorCheck
          // ignore: cast_nullable_to_non_nullable
          : previousSponsorCheck as int,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String?,
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

extension $AudioPlayerControllerCopyWith on AudioPlayerController {
  /// Returns a callable class that can be used as follows: `instanceOfAudioPlayerController.copyWith(...)` or like so:`instanceOfAudioPlayerController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AudioPlayerControllerCWProxy get copyWith =>
      _$AudioPlayerControllerCWProxyImpl(this);
}
