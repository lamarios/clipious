// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoState {
  Video? get video;
  int? get dislikes;
  dynamic get loadingVideo;
  String get videoId;
  bool get isLoggedIn;
  bool get downloading;
  double get downloadProgress;
  DownloadedVideo? get downloadedVideo;
  double get opacity;
  String get error;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoStateCopyWith<VideoState> get copyWith =>
      _$VideoStateCopyWithImpl<VideoState>(this as VideoState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoState &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            const DeepCollectionEquality()
                .equals(other.loadingVideo, loadingVideo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.downloading, downloading) ||
                other.downloading == downloading) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.downloadedVideo, downloadedVideo) ||
                other.downloadedVideo == downloadedVideo) &&
            (identical(other.opacity, opacity) || other.opacity == opacity) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      video,
      dislikes,
      const DeepCollectionEquality().hash(loadingVideo),
      videoId,
      isLoggedIn,
      downloading,
      downloadProgress,
      downloadedVideo,
      opacity,
      error);

  @override
  String toString() {
    return 'VideoState(video: $video, dislikes: $dislikes, loadingVideo: $loadingVideo, videoId: $videoId, isLoggedIn: $isLoggedIn, downloading: $downloading, downloadProgress: $downloadProgress, downloadedVideo: $downloadedVideo, opacity: $opacity, error: $error)';
  }
}

/// @nodoc
abstract mixin class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) _then) =
      _$VideoStateCopyWithImpl;
  @useResult
  $Res call(
      {Video? video,
      int? dislikes,
      dynamic loadingVideo,
      String videoId,
      bool isLoggedIn,
      bool downloading,
      double downloadProgress,
      DownloadedVideo? downloadedVideo,
      double opacity,
      String error});

  $VideoCopyWith<$Res>? get video;
  $DownloadedVideoCopyWith<$Res>? get downloadedVideo;
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res> implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._self, this._then);

  final VideoState _self;
  final $Res Function(VideoState) _then;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? dislikes = freezed,
    Object? loadingVideo = freezed,
    Object? videoId = null,
    Object? isLoggedIn = null,
    Object? downloading = null,
    Object? downloadProgress = null,
    Object? downloadedVideo = freezed,
    Object? opacity = null,
    Object? error = null,
  }) {
    return _then(_self.copyWith(
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as Video?,
      dislikes: freezed == dislikes
          ? _self.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingVideo: freezed == loadingVideo
          ? _self.loadingVideo
          : loadingVideo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      downloading: null == downloading
          ? _self.downloading
          : downloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: null == downloadProgress
          ? _self.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadedVideo: freezed == downloadedVideo
          ? _self.downloadedVideo
          : downloadedVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      opacity: null == opacity
          ? _self.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of VideoState
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

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get downloadedVideo {
    if (_self.downloadedVideo == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.downloadedVideo!, (value) {
      return _then(_self.copyWith(downloadedVideo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VideoState].
extension VideoStatePatterns on VideoState {
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
    TResult Function(_VideoState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoState() when $default != null:
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
    TResult Function(_VideoState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoState():
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
    TResult? Function(_VideoState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoState() when $default != null:
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
            Video? video,
            int? dislikes,
            dynamic loadingVideo,
            String videoId,
            bool isLoggedIn,
            bool downloading,
            double downloadProgress,
            DownloadedVideo? downloadedVideo,
            double opacity,
            String error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoState() when $default != null:
        return $default(
            _that.video,
            _that.dislikes,
            _that.loadingVideo,
            _that.videoId,
            _that.isLoggedIn,
            _that.downloading,
            _that.downloadProgress,
            _that.downloadedVideo,
            _that.opacity,
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
            Video? video,
            int? dislikes,
            dynamic loadingVideo,
            String videoId,
            bool isLoggedIn,
            bool downloading,
            double downloadProgress,
            DownloadedVideo? downloadedVideo,
            double opacity,
            String error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoState():
        return $default(
            _that.video,
            _that.dislikes,
            _that.loadingVideo,
            _that.videoId,
            _that.isLoggedIn,
            _that.downloading,
            _that.downloadProgress,
            _that.downloadedVideo,
            _that.opacity,
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
            Video? video,
            int? dislikes,
            dynamic loadingVideo,
            String videoId,
            bool isLoggedIn,
            bool downloading,
            double downloadProgress,
            DownloadedVideo? downloadedVideo,
            double opacity,
            String error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoState() when $default != null:
        return $default(
            _that.video,
            _that.dislikes,
            _that.loadingVideo,
            _that.videoId,
            _that.isLoggedIn,
            _that.downloading,
            _that.downloadProgress,
            _that.downloadedVideo,
            _that.opacity,
            _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoState extends VideoState {
  const _VideoState(
      {this.video,
      this.dislikes,
      this.loadingVideo = true,
      required this.videoId,
      required this.isLoggedIn,
      this.downloading = false,
      this.downloadProgress = 0,
      this.downloadedVideo,
      this.opacity = 1,
      this.error = ''})
      : super._();

  @override
  final Video? video;
  @override
  final int? dislikes;
  @override
  @JsonKey()
  final dynamic loadingVideo;
  @override
  final String videoId;
  @override
  final bool isLoggedIn;
  @override
  @JsonKey()
  final bool downloading;
  @override
  @JsonKey()
  final double downloadProgress;
  @override
  final DownloadedVideo? downloadedVideo;
  @override
  @JsonKey()
  final double opacity;
  @override
  @JsonKey()
  final String error;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoStateCopyWith<_VideoState> get copyWith =>
      __$VideoStateCopyWithImpl<_VideoState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoState &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            const DeepCollectionEquality()
                .equals(other.loadingVideo, loadingVideo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.downloading, downloading) ||
                other.downloading == downloading) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.downloadedVideo, downloadedVideo) ||
                other.downloadedVideo == downloadedVideo) &&
            (identical(other.opacity, opacity) || other.opacity == opacity) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      video,
      dislikes,
      const DeepCollectionEquality().hash(loadingVideo),
      videoId,
      isLoggedIn,
      downloading,
      downloadProgress,
      downloadedVideo,
      opacity,
      error);

  @override
  String toString() {
    return 'VideoState(video: $video, dislikes: $dislikes, loadingVideo: $loadingVideo, videoId: $videoId, isLoggedIn: $isLoggedIn, downloading: $downloading, downloadProgress: $downloadProgress, downloadedVideo: $downloadedVideo, opacity: $opacity, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$VideoStateCopyWith<$Res>
    implements $VideoStateCopyWith<$Res> {
  factory _$VideoStateCopyWith(
          _VideoState value, $Res Function(_VideoState) _then) =
      __$VideoStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Video? video,
      int? dislikes,
      dynamic loadingVideo,
      String videoId,
      bool isLoggedIn,
      bool downloading,
      double downloadProgress,
      DownloadedVideo? downloadedVideo,
      double opacity,
      String error});

  @override
  $VideoCopyWith<$Res>? get video;
  @override
  $DownloadedVideoCopyWith<$Res>? get downloadedVideo;
}

/// @nodoc
class __$VideoStateCopyWithImpl<$Res> implements _$VideoStateCopyWith<$Res> {
  __$VideoStateCopyWithImpl(this._self, this._then);

  final _VideoState _self;
  final $Res Function(_VideoState) _then;

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? video = freezed,
    Object? dislikes = freezed,
    Object? loadingVideo = freezed,
    Object? videoId = null,
    Object? isLoggedIn = null,
    Object? downloading = null,
    Object? downloadProgress = null,
    Object? downloadedVideo = freezed,
    Object? opacity = null,
    Object? error = null,
  }) {
    return _then(_VideoState(
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as Video?,
      dislikes: freezed == dislikes
          ? _self.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingVideo: freezed == loadingVideo
          ? _self.loadingVideo
          : loadingVideo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      downloading: null == downloading
          ? _self.downloading
          : downloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: null == downloadProgress
          ? _self.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadedVideo: freezed == downloadedVideo
          ? _self.downloadedVideo
          : downloadedVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      opacity: null == opacity
          ? _self.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of VideoState
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

  /// Create a copy of VideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get downloadedVideo {
    if (_self.downloadedVideo == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.downloadedVideo!, (value) {
      return _then(_self.copyWith(downloadedVideo: value));
    });
  }
}

// dart format on
