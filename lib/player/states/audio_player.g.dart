// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AudioPlayerStateCWProxy {
  AudioPlayerState player(AudioPlayer? player);

  AudioPlayerState audioLength(Duration audioLength);

  AudioPlayerState audioPosition(Duration audioPosition);

  AudioPlayerState previousSponsorCheck(int previousSponsorCheck);

  AudioPlayerState loading(bool loading);

  AudioPlayerState error(String? error);

  AudioPlayerState video(Video? video);

  AudioPlayerState offlineVideo(DownloadedVideo? offlineVideo);

  AudioPlayerState disableControls(bool? disableControls);

  AudioPlayerState playNow(bool? playNow);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AudioPlayerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AudioPlayerState(...).copyWith(id: 12, name: "My name")
  /// ````
  AudioPlayerState call({
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAudioPlayerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAudioPlayerState.copyWith.fieldName(...)`
class _$AudioPlayerStateCWProxyImpl implements _$AudioPlayerStateCWProxy {
  const _$AudioPlayerStateCWProxyImpl(this._value);

  final AudioPlayerState _value;

  @override
  AudioPlayerState player(AudioPlayer? player) => this(player: player);

  @override
  AudioPlayerState audioLength(Duration audioLength) => this(audioLength: audioLength);

  @override
  AudioPlayerState audioPosition(Duration audioPosition) => this(audioPosition: audioPosition);

  @override
  AudioPlayerState previousSponsorCheck(int previousSponsorCheck) => this(previousSponsorCheck: previousSponsorCheck);

  @override
  AudioPlayerState loading(bool loading) => this(loading: loading);

  @override
  AudioPlayerState error(String? error) => this(error: error);

  @override
  AudioPlayerState video(Video? video) => this(video: video);

  @override
  AudioPlayerState offlineVideo(DownloadedVideo? offlineVideo) => this(offlineVideo: offlineVideo);

  @override
  AudioPlayerState disableControls(bool? disableControls) => this(disableControls: disableControls);

  @override
  AudioPlayerState playNow(bool? playNow) => this(playNow: playNow);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AudioPlayerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AudioPlayerState(...).copyWith(id: 12, name: "My name")
  /// ````
  AudioPlayerState call({
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
    return AudioPlayerState._(
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
      previousSponsorCheck == const $CopyWithPlaceholder() || previousSponsorCheck == null
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

extension $AudioPlayerStateCopyWith on AudioPlayerState {
  /// Returns a callable class that can be used as follows: `instanceOfAudioPlayerState.copyWith(...)` or like so:`instanceOfAudioPlayerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AudioPlayerStateCWProxy get copyWith => _$AudioPlayerStateCWProxyImpl(this);
}
