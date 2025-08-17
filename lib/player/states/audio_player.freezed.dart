// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioPlayerState {
  Duration get audioLength;
  Duration get audioPosition;
  int get previousSponsorCheck;
  Video? get video;
  DownloadedVideo? get offlineVideo;
  bool? get playNow;
  bool? get disableControls;
  bool get loading;
  String? get error;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AudioPlayerStateCopyWith<AudioPlayerState> get copyWith =>
      _$AudioPlayerStateCopyWithImpl<AudioPlayerState>(
          this as AudioPlayerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AudioPlayerState &&
            (identical(other.audioLength, audioLength) ||
                other.audioLength == audioLength) &&
            (identical(other.audioPosition, audioPosition) ||
                other.audioPosition == audioPosition) &&
            (identical(other.previousSponsorCheck, previousSponsorCheck) ||
                other.previousSponsorCheck == previousSponsorCheck) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo) &&
            (identical(other.playNow, playNow) || other.playNow == playNow) &&
            (identical(other.disableControls, disableControls) ||
                other.disableControls == disableControls) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      audioLength,
      audioPosition,
      previousSponsorCheck,
      video,
      offlineVideo,
      playNow,
      disableControls,
      loading,
      error);

  @override
  String toString() {
    return 'AudioPlayerState(audioLength: $audioLength, audioPosition: $audioPosition, previousSponsorCheck: $previousSponsorCheck, video: $video, offlineVideo: $offlineVideo, playNow: $playNow, disableControls: $disableControls, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class $AudioPlayerStateCopyWith<$Res> {
  factory $AudioPlayerStateCopyWith(
          AudioPlayerState value, $Res Function(AudioPlayerState) _then) =
      _$AudioPlayerStateCopyWithImpl;
  @useResult
  $Res call(
      {Duration audioLength,
      Duration audioPosition,
      int previousSponsorCheck,
      Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls,
      bool loading,
      String? error});

  $VideoCopyWith<$Res>? get video;
  $DownloadedVideoCopyWith<$Res>? get offlineVideo;
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final AudioPlayerState _self;
  final $Res Function(AudioPlayerState) _then;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioLength = null,
    Object? audioPosition = null,
    Object? previousSponsorCheck = null,
    Object? video = freezed,
    Object? offlineVideo = freezed,
    Object? playNow = freezed,
    Object? disableControls = freezed,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      audioLength: null == audioLength
          ? _self.audioLength
          : audioLength // ignore: cast_nullable_to_non_nullable
              as Duration,
      audioPosition: null == audioPosition
          ? _self.audioPosition
          : audioPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      previousSponsorCheck: null == previousSponsorCheck
          ? _self.previousSponsorCheck
          : previousSponsorCheck // ignore: cast_nullable_to_non_nullable
              as int,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineVideo: freezed == offlineVideo
          ? _self.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      playNow: freezed == playNow
          ? _self.playNow
          : playNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableControls: freezed == disableControls
          ? _self.disableControls
          : disableControls // ignore: cast_nullable_to_non_nullable
              as bool?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $VideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get offlineVideo {
    if (_self.offlineVideo == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.offlineVideo!, (value) {
      return _then(_self.copyWith(offlineVideo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AudioPlayerState].
extension AudioPlayerStatePatterns on AudioPlayerState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AudioPlayerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AudioPlayerState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AudioPlayerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioPlayerState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AudioPlayerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioPlayerState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Duration audioLength,
            Duration audioPosition,
            int previousSponsorCheck,
            Video? video,
            DownloadedVideo? offlineVideo,
            bool? playNow,
            bool? disableControls,
            bool loading,
            String? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AudioPlayerState() when $default != null:
        return $default(
            _that.audioLength,
            _that.audioPosition,
            _that.previousSponsorCheck,
            _that.video,
            _that.offlineVideo,
            _that.playNow,
            _that.disableControls,
            _that.loading,
            _that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Duration audioLength,
            Duration audioPosition,
            int previousSponsorCheck,
            Video? video,
            DownloadedVideo? offlineVideo,
            bool? playNow,
            bool? disableControls,
            bool loading,
            String? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioPlayerState():
        return $default(
            _that.audioLength,
            _that.audioPosition,
            _that.previousSponsorCheck,
            _that.video,
            _that.offlineVideo,
            _that.playNow,
            _that.disableControls,
            _that.loading,
            _that.error);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            Duration audioLength,
            Duration audioPosition,
            int previousSponsorCheck,
            Video? video,
            DownloadedVideo? offlineVideo,
            bool? playNow,
            bool? disableControls,
            bool loading,
            String? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioPlayerState() when $default != null:
        return $default(
            _that.audioLength,
            _that.audioPosition,
            _that.previousSponsorCheck,
            _that.video,
            _that.offlineVideo,
            _that.playNow,
            _that.disableControls,
            _that.loading,
            _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AudioPlayerState extends AudioPlayerState {
  const _AudioPlayerState(
      {this.audioLength = const Duration(milliseconds: 1),
      this.audioPosition = Duration.zero,
      this.previousSponsorCheck = 0,
      this.video,
      this.offlineVideo,
      this.playNow,
      this.disableControls,
      this.loading = false,
      this.error})
      : super._();

  @override
  @JsonKey()
  final Duration audioLength;
  @override
  @JsonKey()
  final Duration audioPosition;
  @override
  @JsonKey()
  final int previousSponsorCheck;
  @override
  final Video? video;
  @override
  final DownloadedVideo? offlineVideo;
  @override
  final bool? playNow;
  @override
  final bool? disableControls;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AudioPlayerStateCopyWith<_AudioPlayerState> get copyWith =>
      __$AudioPlayerStateCopyWithImpl<_AudioPlayerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AudioPlayerState &&
            (identical(other.audioLength, audioLength) ||
                other.audioLength == audioLength) &&
            (identical(other.audioPosition, audioPosition) ||
                other.audioPosition == audioPosition) &&
            (identical(other.previousSponsorCheck, previousSponsorCheck) ||
                other.previousSponsorCheck == previousSponsorCheck) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo) &&
            (identical(other.playNow, playNow) || other.playNow == playNow) &&
            (identical(other.disableControls, disableControls) ||
                other.disableControls == disableControls) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      audioLength,
      audioPosition,
      previousSponsorCheck,
      video,
      offlineVideo,
      playNow,
      disableControls,
      loading,
      error);

  @override
  String toString() {
    return 'AudioPlayerState(audioLength: $audioLength, audioPosition: $audioPosition, previousSponsorCheck: $previousSponsorCheck, video: $video, offlineVideo: $offlineVideo, playNow: $playNow, disableControls: $disableControls, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$AudioPlayerStateCopyWith<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  factory _$AudioPlayerStateCopyWith(
          _AudioPlayerState value, $Res Function(_AudioPlayerState) _then) =
      __$AudioPlayerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Duration audioLength,
      Duration audioPosition,
      int previousSponsorCheck,
      Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls,
      bool loading,
      String? error});

  @override
  $VideoCopyWith<$Res>? get video;
  @override
  $DownloadedVideoCopyWith<$Res>? get offlineVideo;
}

/// @nodoc
class __$AudioPlayerStateCopyWithImpl<$Res>
    implements _$AudioPlayerStateCopyWith<$Res> {
  __$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final _AudioPlayerState _self;
  final $Res Function(_AudioPlayerState) _then;

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? audioLength = null,
    Object? audioPosition = null,
    Object? previousSponsorCheck = null,
    Object? video = freezed,
    Object? offlineVideo = freezed,
    Object? playNow = freezed,
    Object? disableControls = freezed,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_AudioPlayerState(
      audioLength: null == audioLength
          ? _self.audioLength
          : audioLength // ignore: cast_nullable_to_non_nullable
              as Duration,
      audioPosition: null == audioPosition
          ? _self.audioPosition
          : audioPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      previousSponsorCheck: null == previousSponsorCheck
          ? _self.previousSponsorCheck
          : previousSponsorCheck // ignore: cast_nullable_to_non_nullable
              as int,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineVideo: freezed == offlineVideo
          ? _self.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      playNow: freezed == playNow
          ? _self.playNow
          : playNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableControls: freezed == disableControls
          ? _self.disableControls
          : disableControls // ignore: cast_nullable_to_non_nullable
              as bool?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $VideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }

  /// Create a copy of AudioPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get offlineVideo {
    if (_self.offlineVideo == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.offlineVideo!, (value) {
      return _then(_self.copyWith(offlineVideo: value));
    });
  }
}

// dart format on
