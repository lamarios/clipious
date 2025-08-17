// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloaded_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadedVideo {
  String get videoId;
  String get title;
  String? get author;
  String? get authorUrl;
  bool get downloadComplete;
  bool get downloadFailed;
  bool get audioOnly;
  int get lengthSeconds;
  String get quality;

  /// Create a copy of DownloadedVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<DownloadedVideo> get copyWith =>
      _$DownloadedVideoCopyWithImpl<DownloadedVideo>(
          this as DownloadedVideo, _$identity);

  /// Serializes this DownloadedVideo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadedVideo &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            (identical(other.downloadComplete, downloadComplete) ||
                other.downloadComplete == downloadComplete) &&
            (identical(other.downloadFailed, downloadFailed) ||
                other.downloadFailed == downloadFailed) &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly) &&
            (identical(other.lengthSeconds, lengthSeconds) ||
                other.lengthSeconds == lengthSeconds) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoId,
      title,
      author,
      authorUrl,
      downloadComplete,
      downloadFailed,
      audioOnly,
      lengthSeconds,
      quality);

  @override
  String toString() {
    return 'DownloadedVideo(videoId: $videoId, title: $title, author: $author, authorUrl: $authorUrl, downloadComplete: $downloadComplete, downloadFailed: $downloadFailed, audioOnly: $audioOnly, lengthSeconds: $lengthSeconds, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $DownloadedVideoCopyWith<$Res> {
  factory $DownloadedVideoCopyWith(
          DownloadedVideo value, $Res Function(DownloadedVideo) _then) =
      _$DownloadedVideoCopyWithImpl;
  @useResult
  $Res call(
      {String videoId,
      String title,
      String? author,
      String? authorUrl,
      bool downloadComplete,
      bool downloadFailed,
      bool audioOnly,
      int lengthSeconds,
      String quality});
}

/// @nodoc
class _$DownloadedVideoCopyWithImpl<$Res>
    implements $DownloadedVideoCopyWith<$Res> {
  _$DownloadedVideoCopyWithImpl(this._self, this._then);

  final DownloadedVideo _self;
  final $Res Function(DownloadedVideo) _then;

  /// Create a copy of DownloadedVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? title = null,
    Object? author = freezed,
    Object? authorUrl = freezed,
    Object? downloadComplete = null,
    Object? downloadFailed = null,
    Object? audioOnly = null,
    Object? lengthSeconds = null,
    Object? quality = null,
  }) {
    return _then(_self.copyWith(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _self.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadComplete: null == downloadComplete
          ? _self.downloadComplete
          : downloadComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadFailed: null == downloadFailed
          ? _self.downloadFailed
          : downloadFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      audioOnly: null == audioOnly
          ? _self.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      lengthSeconds: null == lengthSeconds
          ? _self.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DownloadedVideo].
extension DownloadedVideoPatterns on DownloadedVideo {
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
    TResult Function(_DownloadedVideo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideo() when $default != null:
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
    TResult Function(_DownloadedVideo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideo():
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
    TResult? Function(_DownloadedVideo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideo() when $default != null:
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
            String videoId,
            String title,
            String? author,
            String? authorUrl,
            bool downloadComplete,
            bool downloadFailed,
            bool audioOnly,
            int lengthSeconds,
            String quality)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideo() when $default != null:
        return $default(
            _that.videoId,
            _that.title,
            _that.author,
            _that.authorUrl,
            _that.downloadComplete,
            _that.downloadFailed,
            _that.audioOnly,
            _that.lengthSeconds,
            _that.quality);
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
            String videoId,
            String title,
            String? author,
            String? authorUrl,
            bool downloadComplete,
            bool downloadFailed,
            bool audioOnly,
            int lengthSeconds,
            String quality)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideo():
        return $default(
            _that.videoId,
            _that.title,
            _that.author,
            _that.authorUrl,
            _that.downloadComplete,
            _that.downloadFailed,
            _that.audioOnly,
            _that.lengthSeconds,
            _that.quality);
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
            String videoId,
            String title,
            String? author,
            String? authorUrl,
            bool downloadComplete,
            bool downloadFailed,
            bool audioOnly,
            int lengthSeconds,
            String quality)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideo() when $default != null:
        return $default(
            _that.videoId,
            _that.title,
            _that.author,
            _that.authorUrl,
            _that.downloadComplete,
            _that.downloadFailed,
            _that.audioOnly,
            _that.lengthSeconds,
            _that.quality);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DownloadedVideo extends DownloadedVideo implements IdedVideo {
  const _DownloadedVideo(
      {required this.videoId,
      required this.title,
      this.author,
      this.authorUrl,
      this.downloadComplete = false,
      this.downloadFailed = false,
      this.audioOnly = false,
      required this.lengthSeconds,
      required this.quality})
      : super._();
  factory _DownloadedVideo.fromJson(Map<String, dynamic> json) =>
      _$DownloadedVideoFromJson(json);

  @override
  final String videoId;
  @override
  final String title;
  @override
  final String? author;
  @override
  final String? authorUrl;
  @override
  @JsonKey()
  final bool downloadComplete;
  @override
  @JsonKey()
  final bool downloadFailed;
  @override
  @JsonKey()
  final bool audioOnly;
  @override
  final int lengthSeconds;
  @override
  final String quality;

  /// Create a copy of DownloadedVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DownloadedVideoCopyWith<_DownloadedVideo> get copyWith =>
      __$DownloadedVideoCopyWithImpl<_DownloadedVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DownloadedVideoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DownloadedVideo &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            (identical(other.downloadComplete, downloadComplete) ||
                other.downloadComplete == downloadComplete) &&
            (identical(other.downloadFailed, downloadFailed) ||
                other.downloadFailed == downloadFailed) &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly) &&
            (identical(other.lengthSeconds, lengthSeconds) ||
                other.lengthSeconds == lengthSeconds) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoId,
      title,
      author,
      authorUrl,
      downloadComplete,
      downloadFailed,
      audioOnly,
      lengthSeconds,
      quality);

  @override
  String toString() {
    return 'DownloadedVideo(videoId: $videoId, title: $title, author: $author, authorUrl: $authorUrl, downloadComplete: $downloadComplete, downloadFailed: $downloadFailed, audioOnly: $audioOnly, lengthSeconds: $lengthSeconds, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class _$DownloadedVideoCopyWith<$Res>
    implements $DownloadedVideoCopyWith<$Res> {
  factory _$DownloadedVideoCopyWith(
          _DownloadedVideo value, $Res Function(_DownloadedVideo) _then) =
      __$DownloadedVideoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String videoId,
      String title,
      String? author,
      String? authorUrl,
      bool downloadComplete,
      bool downloadFailed,
      bool audioOnly,
      int lengthSeconds,
      String quality});
}

/// @nodoc
class __$DownloadedVideoCopyWithImpl<$Res>
    implements _$DownloadedVideoCopyWith<$Res> {
  __$DownloadedVideoCopyWithImpl(this._self, this._then);

  final _DownloadedVideo _self;
  final $Res Function(_DownloadedVideo) _then;

  /// Create a copy of DownloadedVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? title = null,
    Object? author = freezed,
    Object? authorUrl = freezed,
    Object? downloadComplete = null,
    Object? downloadFailed = null,
    Object? audioOnly = null,
    Object? lengthSeconds = null,
    Object? quality = null,
  }) {
    return _then(_DownloadedVideo(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _self.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadComplete: null == downloadComplete
          ? _self.downloadComplete
          : downloadComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadFailed: null == downloadFailed
          ? _self.downloadFailed
          : downloadFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      audioOnly: null == audioOnly
          ? _self.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      lengthSeconds: null == lengthSeconds
          ? _self.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
