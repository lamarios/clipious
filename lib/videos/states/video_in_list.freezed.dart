// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_in_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoInListState {
  double get progress => throw _privateConstructorUsedError;
  BaseVideo? get video => throw _privateConstructorUsedError;
  DownloadedVideo? get offlineVideo => throw _privateConstructorUsedError;

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoInListStateCopyWith<VideoInListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoInListStateCopyWith<$Res> {
  factory $VideoInListStateCopyWith(
          VideoInListState value, $Res Function(VideoInListState) then) =
      _$VideoInListStateCopyWithImpl<$Res, VideoInListState>;
  @useResult
  $Res call({double progress, BaseVideo? video, DownloadedVideo? offlineVideo});
}

/// @nodoc
class _$VideoInListStateCopyWithImpl<$Res, $Val extends VideoInListState>
    implements $VideoInListStateCopyWith<$Res> {
  _$VideoInListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? video = freezed,
    Object? offlineVideo = freezed,
  }) {
    return _then(_value.copyWith(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as BaseVideo?,
      offlineVideo: freezed == offlineVideo
          ? _value.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoInListStateImplCopyWith<$Res>
    implements $VideoInListStateCopyWith<$Res> {
  factory _$$VideoInListStateImplCopyWith(_$VideoInListStateImpl value,
          $Res Function(_$VideoInListStateImpl) then) =
      __$$VideoInListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double progress, BaseVideo? video, DownloadedVideo? offlineVideo});
}

/// @nodoc
class __$$VideoInListStateImplCopyWithImpl<$Res>
    extends _$VideoInListStateCopyWithImpl<$Res, _$VideoInListStateImpl>
    implements _$$VideoInListStateImplCopyWith<$Res> {
  __$$VideoInListStateImplCopyWithImpl(_$VideoInListStateImpl _value,
      $Res Function(_$VideoInListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? video = freezed,
    Object? offlineVideo = freezed,
  }) {
    return _then(_$VideoInListStateImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as BaseVideo?,
      offlineVideo: freezed == offlineVideo
          ? _value.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
    ));
  }
}

/// @nodoc

class _$VideoInListStateImpl implements _VideoInListState {
  const _$VideoInListStateImpl(
      {this.progress = 0, this.video, this.offlineVideo})
      : assert(video == null || offlineVideo == null,
            'cannot provide both video and offline video');

  @override
  @JsonKey()
  final double progress;
  @override
  final BaseVideo? video;
  @override
  final DownloadedVideo? offlineVideo;

  @override
  String toString() {
    return 'VideoInListState(progress: $progress, video: $video, offlineVideo: $offlineVideo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoInListStateImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, video, offlineVideo);

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoInListStateImplCopyWith<_$VideoInListStateImpl> get copyWith =>
      __$$VideoInListStateImplCopyWithImpl<_$VideoInListStateImpl>(
          this, _$identity);
}

abstract class _VideoInListState implements VideoInListState {
  const factory _VideoInListState(
      {final double progress,
      final BaseVideo? video,
      final DownloadedVideo? offlineVideo}) = _$VideoInListStateImpl;

  @override
  double get progress;
  @override
  BaseVideo? get video;
  @override
  DownloadedVideo? get offlineVideo;

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoInListStateImplCopyWith<_$VideoInListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
