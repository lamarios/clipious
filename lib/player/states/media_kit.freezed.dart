// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_kit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MediaKitState {
  Duration? get startAt => throw _privateConstructorUsedError;
  clipious_video.Video? get video => throw _privateConstructorUsedError;
  DownloadedVideo? get offlineVideo => throw _privateConstructorUsedError;
  bool? get playNow => throw _privateConstructorUsedError;
  bool? get disableControls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaKitStateCopyWith<MediaKitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaKitStateCopyWith<$Res> {
  factory $MediaKitStateCopyWith(
          MediaKitState value, $Res Function(MediaKitState) then) =
      _$MediaKitStateCopyWithImpl<$Res, MediaKitState>;
  @useResult
  $Res call(
      {Duration? startAt,
      clipious_video.Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls});
}

/// @nodoc
class _$MediaKitStateCopyWithImpl<$Res, $Val extends MediaKitState>
    implements $MediaKitStateCopyWith<$Res> {
  _$MediaKitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = freezed,
    Object? video = freezed,
    Object? offlineVideo = freezed,
    Object? playNow = freezed,
    Object? disableControls = freezed,
  }) {
    return _then(_value.copyWith(
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as clipious_video.Video?,
      offlineVideo: freezed == offlineVideo
          ? _value.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      playNow: freezed == playNow
          ? _value.playNow
          : playNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableControls: freezed == disableControls
          ? _value.disableControls
          : disableControls // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaKitStateImplCopyWith<$Res>
    implements $MediaKitStateCopyWith<$Res> {
  factory _$$MediaKitStateImplCopyWith(
          _$MediaKitStateImpl value, $Res Function(_$MediaKitStateImpl) then) =
      __$$MediaKitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration? startAt,
      clipious_video.Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls});
}

/// @nodoc
class __$$MediaKitStateImplCopyWithImpl<$Res>
    extends _$MediaKitStateCopyWithImpl<$Res, _$MediaKitStateImpl>
    implements _$$MediaKitStateImplCopyWith<$Res> {
  __$$MediaKitStateImplCopyWithImpl(
      _$MediaKitStateImpl _value, $Res Function(_$MediaKitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = freezed,
    Object? video = freezed,
    Object? offlineVideo = freezed,
    Object? playNow = freezed,
    Object? disableControls = freezed,
  }) {
    return _then(_$MediaKitStateImpl(
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as clipious_video.Video?,
      offlineVideo: freezed == offlineVideo
          ? _value.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      playNow: freezed == playNow
          ? _value.playNow
          : playNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableControls: freezed == disableControls
          ? _value.disableControls
          : disableControls // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$MediaKitStateImpl extends _MediaKitState {
  const _$MediaKitStateImpl(
      {this.startAt,
      this.video,
      this.offlineVideo,
      this.playNow,
      this.disableControls})
      : super._();

  @override
  final Duration? startAt;
  @override
  final clipious_video.Video? video;
  @override
  final DownloadedVideo? offlineVideo;
  @override
  final bool? playNow;
  @override
  final bool? disableControls;

  @override
  String toString() {
    return 'MediaKitState(startAt: $startAt, video: $video, offlineVideo: $offlineVideo, playNow: $playNow, disableControls: $disableControls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaKitStateImpl &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo) &&
            (identical(other.playNow, playNow) || other.playNow == playNow) &&
            (identical(other.disableControls, disableControls) ||
                other.disableControls == disableControls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, startAt, video, offlineVideo, playNow, disableControls);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaKitStateImplCopyWith<_$MediaKitStateImpl> get copyWith =>
      __$$MediaKitStateImplCopyWithImpl<_$MediaKitStateImpl>(this, _$identity);
}

abstract class _MediaKitState extends MediaKitState {
  const factory _MediaKitState(
      {final Duration? startAt,
      final clipious_video.Video? video,
      final DownloadedVideo? offlineVideo,
      final bool? playNow,
      final bool? disableControls}) = _$MediaKitStateImpl;
  const _MediaKitState._() : super._();

  @override
  Duration? get startAt;
  @override
  clipious_video.Video? get video;
  @override
  DownloadedVideo? get offlineVideo;
  @override
  bool? get playNow;
  @override
  bool? get disableControls;
  @override
  @JsonKey(ignore: true)
  _$$MediaKitStateImplCopyWith<_$MediaKitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
