// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloaded_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DownloadedVideo _$DownloadedVideoFromJson(Map<String, dynamic> json) {
  return _DownloadedVideo.fromJson(json);
}

/// @nodoc
mixin _$DownloadedVideo {
  String get videoId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get authorUrl => throw _privateConstructorUsedError;
  bool get downloadComplete => throw _privateConstructorUsedError;
  bool get downloadFailed => throw _privateConstructorUsedError;
  bool get audioOnly => throw _privateConstructorUsedError;
  int get lengthSeconds => throw _privateConstructorUsedError;
  String get quality => throw _privateConstructorUsedError;

  /// Serializes this DownloadedVideo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DownloadedVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloadedVideoCopyWith<DownloadedVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadedVideoCopyWith<$Res> {
  factory $DownloadedVideoCopyWith(
          DownloadedVideo value, $Res Function(DownloadedVideo) then) =
      _$DownloadedVideoCopyWithImpl<$Res, DownloadedVideo>;
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
class _$DownloadedVideoCopyWithImpl<$Res, $Val extends DownloadedVideo>
    implements $DownloadedVideoCopyWith<$Res> {
  _$DownloadedVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadComplete: null == downloadComplete
          ? _value.downloadComplete
          : downloadComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadFailed: null == downloadFailed
          ? _value.downloadFailed
          : downloadFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      audioOnly: null == audioOnly
          ? _value.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      lengthSeconds: null == lengthSeconds
          ? _value.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadedVideoImplCopyWith<$Res>
    implements $DownloadedVideoCopyWith<$Res> {
  factory _$$DownloadedVideoImplCopyWith(_$DownloadedVideoImpl value,
          $Res Function(_$DownloadedVideoImpl) then) =
      __$$DownloadedVideoImplCopyWithImpl<$Res>;
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
class __$$DownloadedVideoImplCopyWithImpl<$Res>
    extends _$DownloadedVideoCopyWithImpl<$Res, _$DownloadedVideoImpl>
    implements _$$DownloadedVideoImplCopyWith<$Res> {
  __$$DownloadedVideoImplCopyWithImpl(
      _$DownloadedVideoImpl _value, $Res Function(_$DownloadedVideoImpl) _then)
      : super(_value, _then);

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
    return _then(_$DownloadedVideoImpl(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadComplete: null == downloadComplete
          ? _value.downloadComplete
          : downloadComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadFailed: null == downloadFailed
          ? _value.downloadFailed
          : downloadFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      audioOnly: null == audioOnly
          ? _value.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      lengthSeconds: null == lengthSeconds
          ? _value.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadedVideoImpl extends _DownloadedVideo {
  const _$DownloadedVideoImpl(
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

  factory _$DownloadedVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadedVideoImplFromJson(json);

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

  @override
  String toString() {
    return 'DownloadedVideo(videoId: $videoId, title: $title, author: $author, authorUrl: $authorUrl, downloadComplete: $downloadComplete, downloadFailed: $downloadFailed, audioOnly: $audioOnly, lengthSeconds: $lengthSeconds, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadedVideoImpl &&
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

  /// Create a copy of DownloadedVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadedVideoImplCopyWith<_$DownloadedVideoImpl> get copyWith =>
      __$$DownloadedVideoImplCopyWithImpl<_$DownloadedVideoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadedVideoImplToJson(
      this,
    );
  }
}

abstract class _DownloadedVideo extends DownloadedVideo implements IdedVideo {
  const factory _DownloadedVideo(
      {required final String videoId,
      required final String title,
      final String? author,
      final String? authorUrl,
      final bool downloadComplete,
      final bool downloadFailed,
      final bool audioOnly,
      required final int lengthSeconds,
      required final String quality}) = _$DownloadedVideoImpl;
  const _DownloadedVideo._() : super._();

  factory _DownloadedVideo.fromJson(Map<String, dynamic> json) =
      _$DownloadedVideoImpl.fromJson;

  @override
  String get videoId;
  @override
  String get title;
  @override
  String? get author;
  @override
  String? get authorUrl;
  @override
  bool get downloadComplete;
  @override
  bool get downloadFailed;
  @override
  bool get audioOnly;
  @override
  int get lengthSeconds;
  @override
  String get quality;

  /// Create a copy of DownloadedVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadedVideoImplCopyWith<_$DownloadedVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
