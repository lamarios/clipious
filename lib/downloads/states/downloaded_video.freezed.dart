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

/// @nodoc
mixin _$DownloadedVideoState {
  DownloadedVideo? get video => throw _privateConstructorUsedError;
  String? get thumbnailPath => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadedVideoStateCopyWith<DownloadedVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadedVideoStateCopyWith<$Res> {
  factory $DownloadedVideoStateCopyWith(DownloadedVideoState value,
          $Res Function(DownloadedVideoState) then) =
      _$DownloadedVideoStateCopyWithImpl<$Res, DownloadedVideoState>;
  @useResult
  $Res call({DownloadedVideo? video, String? thumbnailPath, double progress});
}

/// @nodoc
class _$DownloadedVideoStateCopyWithImpl<$Res,
        $Val extends DownloadedVideoState>
    implements $DownloadedVideoStateCopyWith<$Res> {
  _$DownloadedVideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? thumbnailPath = freezed,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      thumbnailPath: freezed == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadedVideoStateImplCopyWith<$Res>
    implements $DownloadedVideoStateCopyWith<$Res> {
  factory _$$DownloadedVideoStateImplCopyWith(_$DownloadedVideoStateImpl value,
          $Res Function(_$DownloadedVideoStateImpl) then) =
      __$$DownloadedVideoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DownloadedVideo? video, String? thumbnailPath, double progress});
}

/// @nodoc
class __$$DownloadedVideoStateImplCopyWithImpl<$Res>
    extends _$DownloadedVideoStateCopyWithImpl<$Res, _$DownloadedVideoStateImpl>
    implements _$$DownloadedVideoStateImplCopyWith<$Res> {
  __$$DownloadedVideoStateImplCopyWithImpl(_$DownloadedVideoStateImpl _value,
      $Res Function(_$DownloadedVideoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? thumbnailPath = freezed,
    Object? progress = null,
  }) {
    return _then(_$DownloadedVideoStateImpl(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      thumbnailPath: freezed == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DownloadedVideoStateImpl implements _DownloadedVideoState {
  const _$DownloadedVideoStateImpl(
      {this.video, this.thumbnailPath, this.progress = 0});

  @override
  final DownloadedVideo? video;
  @override
  final String? thumbnailPath;
  @override
  @JsonKey()
  final double progress;

  @override
  String toString() {
    return 'DownloadedVideoState(video: $video, thumbnailPath: $thumbnailPath, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadedVideoStateImpl &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, thumbnailPath, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadedVideoStateImplCopyWith<_$DownloadedVideoStateImpl>
      get copyWith =>
          __$$DownloadedVideoStateImplCopyWithImpl<_$DownloadedVideoStateImpl>(
              this, _$identity);
}

abstract class _DownloadedVideoState implements DownloadedVideoState {
  const factory _DownloadedVideoState(
      {final DownloadedVideo? video,
      final String? thumbnailPath,
      final double progress}) = _$DownloadedVideoStateImpl;

  @override
  DownloadedVideo? get video;
  @override
  String? get thumbnailPath;
  @override
  double get progress;
  @override
  @JsonKey(ignore: true)
  _$$DownloadedVideoStateImplCopyWith<_$DownloadedVideoStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
