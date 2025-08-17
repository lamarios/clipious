// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoPlayerState {
  ColorScheme get colors;
  Color get overFlowTextColor;
  GlobalKey get key;
  Duration? get startAt;
  String get selectedNonDashTrack;
  Duration? get bufferPosition;
  Video? get video;
  DownloadedVideo? get offlineVideo;
  bool? get playNow;
  bool? get disableControls;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoPlayerStateCopyWith<VideoPlayerState> get copyWith =>
      _$VideoPlayerStateCopyWithImpl<VideoPlayerState>(
          this as VideoPlayerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoPlayerState &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.overFlowTextColor, overFlowTextColor) ||
                other.overFlowTextColor == overFlowTextColor) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.selectedNonDashTrack, selectedNonDashTrack) ||
                other.selectedNonDashTrack == selectedNonDashTrack) &&
            (identical(other.bufferPosition, bufferPosition) ||
                other.bufferPosition == bufferPosition) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo) &&
            (identical(other.playNow, playNow) || other.playNow == playNow) &&
            (identical(other.disableControls, disableControls) ||
                other.disableControls == disableControls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      colors,
      overFlowTextColor,
      key,
      startAt,
      selectedNonDashTrack,
      bufferPosition,
      video,
      offlineVideo,
      playNow,
      disableControls);

  @override
  String toString() {
    return 'VideoPlayerState(colors: $colors, overFlowTextColor: $overFlowTextColor, key: $key, startAt: $startAt, selectedNonDashTrack: $selectedNonDashTrack, bufferPosition: $bufferPosition, video: $video, offlineVideo: $offlineVideo, playNow: $playNow, disableControls: $disableControls)';
  }
}

/// @nodoc
abstract mixin class $VideoPlayerStateCopyWith<$Res> {
  factory $VideoPlayerStateCopyWith(
          VideoPlayerState value, $Res Function(VideoPlayerState) _then) =
      _$VideoPlayerStateCopyWithImpl;
  @useResult
  $Res call(
      {ColorScheme colors,
      Color overFlowTextColor,
      GlobalKey key,
      Duration? startAt,
      String selectedNonDashTrack,
      Duration? bufferPosition,
      Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls});

  $VideoCopyWith<$Res>? get video;
  $DownloadedVideoCopyWith<$Res>? get offlineVideo;
}

/// @nodoc
class _$VideoPlayerStateCopyWithImpl<$Res>
    implements $VideoPlayerStateCopyWith<$Res> {
  _$VideoPlayerStateCopyWithImpl(this._self, this._then);

  final VideoPlayerState _self;
  final $Res Function(VideoPlayerState) _then;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
    Object? overFlowTextColor = null,
    Object? key = null,
    Object? startAt = freezed,
    Object? selectedNonDashTrack = null,
    Object? bufferPosition = freezed,
    Object? video = freezed,
    Object? offlineVideo = freezed,
    Object? playNow = freezed,
    Object? disableControls = freezed,
  }) {
    return _then(_self.copyWith(
      colors: null == colors
          ? _self.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      overFlowTextColor: null == overFlowTextColor
          ? _self.overFlowTextColor
          : overFlowTextColor // ignore: cast_nullable_to_non_nullable
              as Color,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey,
      startAt: freezed == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      selectedNonDashTrack: null == selectedNonDashTrack
          ? _self.selectedNonDashTrack
          : selectedNonDashTrack // ignore: cast_nullable_to_non_nullable
              as String,
      bufferPosition: freezed == bufferPosition
          ? _self.bufferPosition
          : bufferPosition // ignore: cast_nullable_to_non_nullable
              as Duration?,
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
    ));
  }

  /// Create a copy of VideoPlayerState
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

  /// Create a copy of VideoPlayerState
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

/// Adds pattern-matching-related methods to [VideoPlayerState].
extension VideoPlayerStatePatterns on VideoPlayerState {
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
    TResult Function(_VideoPlayerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoPlayerState() when $default != null:
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
    TResult Function(_VideoPlayerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoPlayerState():
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
    TResult? Function(_VideoPlayerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoPlayerState() when $default != null:
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
            ColorScheme colors,
            Color overFlowTextColor,
            GlobalKey key,
            Duration? startAt,
            String selectedNonDashTrack,
            Duration? bufferPosition,
            Video? video,
            DownloadedVideo? offlineVideo,
            bool? playNow,
            bool? disableControls)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoPlayerState() when $default != null:
        return $default(
            _that.colors,
            _that.overFlowTextColor,
            _that.key,
            _that.startAt,
            _that.selectedNonDashTrack,
            _that.bufferPosition,
            _that.video,
            _that.offlineVideo,
            _that.playNow,
            _that.disableControls);
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
            ColorScheme colors,
            Color overFlowTextColor,
            GlobalKey key,
            Duration? startAt,
            String selectedNonDashTrack,
            Duration? bufferPosition,
            Video? video,
            DownloadedVideo? offlineVideo,
            bool? playNow,
            bool? disableControls)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoPlayerState():
        return $default(
            _that.colors,
            _that.overFlowTextColor,
            _that.key,
            _that.startAt,
            _that.selectedNonDashTrack,
            _that.bufferPosition,
            _that.video,
            _that.offlineVideo,
            _that.playNow,
            _that.disableControls);
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
            ColorScheme colors,
            Color overFlowTextColor,
            GlobalKey key,
            Duration? startAt,
            String selectedNonDashTrack,
            Duration? bufferPosition,
            Video? video,
            DownloadedVideo? offlineVideo,
            bool? playNow,
            bool? disableControls)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoPlayerState() when $default != null:
        return $default(
            _that.colors,
            _that.overFlowTextColor,
            _that.key,
            _that.startAt,
            _that.selectedNonDashTrack,
            _that.bufferPosition,
            _that.video,
            _that.offlineVideo,
            _that.playNow,
            _that.disableControls);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoPlayerState extends VideoPlayerState {
  const _VideoPlayerState(
      {required this.colors,
      required this.overFlowTextColor,
      required this.key,
      this.startAt,
      this.selectedNonDashTrack = "",
      this.bufferPosition = Duration.zero,
      this.video,
      this.offlineVideo,
      this.playNow,
      this.disableControls})
      : super._();

  @override
  final ColorScheme colors;
  @override
  final Color overFlowTextColor;
  @override
  final GlobalKey key;
  @override
  final Duration? startAt;
  @override
  @JsonKey()
  final String selectedNonDashTrack;
  @override
  @JsonKey()
  final Duration? bufferPosition;
  @override
  final Video? video;
  @override
  final DownloadedVideo? offlineVideo;
  @override
  final bool? playNow;
  @override
  final bool? disableControls;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoPlayerStateCopyWith<_VideoPlayerState> get copyWith =>
      __$VideoPlayerStateCopyWithImpl<_VideoPlayerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoPlayerState &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.overFlowTextColor, overFlowTextColor) ||
                other.overFlowTextColor == overFlowTextColor) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.selectedNonDashTrack, selectedNonDashTrack) ||
                other.selectedNonDashTrack == selectedNonDashTrack) &&
            (identical(other.bufferPosition, bufferPosition) ||
                other.bufferPosition == bufferPosition) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo) &&
            (identical(other.playNow, playNow) || other.playNow == playNow) &&
            (identical(other.disableControls, disableControls) ||
                other.disableControls == disableControls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      colors,
      overFlowTextColor,
      key,
      startAt,
      selectedNonDashTrack,
      bufferPosition,
      video,
      offlineVideo,
      playNow,
      disableControls);

  @override
  String toString() {
    return 'VideoPlayerState(colors: $colors, overFlowTextColor: $overFlowTextColor, key: $key, startAt: $startAt, selectedNonDashTrack: $selectedNonDashTrack, bufferPosition: $bufferPosition, video: $video, offlineVideo: $offlineVideo, playNow: $playNow, disableControls: $disableControls)';
  }
}

/// @nodoc
abstract mixin class _$VideoPlayerStateCopyWith<$Res>
    implements $VideoPlayerStateCopyWith<$Res> {
  factory _$VideoPlayerStateCopyWith(
          _VideoPlayerState value, $Res Function(_VideoPlayerState) _then) =
      __$VideoPlayerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ColorScheme colors,
      Color overFlowTextColor,
      GlobalKey key,
      Duration? startAt,
      String selectedNonDashTrack,
      Duration? bufferPosition,
      Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls});

  @override
  $VideoCopyWith<$Res>? get video;
  @override
  $DownloadedVideoCopyWith<$Res>? get offlineVideo;
}

/// @nodoc
class __$VideoPlayerStateCopyWithImpl<$Res>
    implements _$VideoPlayerStateCopyWith<$Res> {
  __$VideoPlayerStateCopyWithImpl(this._self, this._then);

  final _VideoPlayerState _self;
  final $Res Function(_VideoPlayerState) _then;

  /// Create a copy of VideoPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? colors = null,
    Object? overFlowTextColor = null,
    Object? key = null,
    Object? startAt = freezed,
    Object? selectedNonDashTrack = null,
    Object? bufferPosition = freezed,
    Object? video = freezed,
    Object? offlineVideo = freezed,
    Object? playNow = freezed,
    Object? disableControls = freezed,
  }) {
    return _then(_VideoPlayerState(
      colors: null == colors
          ? _self.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      overFlowTextColor: null == overFlowTextColor
          ? _self.overFlowTextColor
          : overFlowTextColor // ignore: cast_nullable_to_non_nullable
              as Color,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey,
      startAt: freezed == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      selectedNonDashTrack: null == selectedNonDashTrack
          ? _self.selectedNonDashTrack
          : selectedNonDashTrack // ignore: cast_nullable_to_non_nullable
              as String,
      bufferPosition: freezed == bufferPosition
          ? _self.bufferPosition
          : bufferPosition // ignore: cast_nullable_to_non_nullable
              as Duration?,
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
    ));
  }

  /// Create a copy of VideoPlayerState
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

  /// Create a copy of VideoPlayerState
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
