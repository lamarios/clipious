// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compact_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompactVideoState {
  DownloadedVideo? get offlineVideo => throw _privateConstructorUsedError;
  String? get offlineVideoThumbnailPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompactVideoStateCopyWith<CompactVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompactVideoStateCopyWith<$Res> {
  factory $CompactVideoStateCopyWith(
          CompactVideoState value, $Res Function(CompactVideoState) then) =
      _$CompactVideoStateCopyWithImpl<$Res, CompactVideoState>;
  @useResult
  $Res call({DownloadedVideo? offlineVideo, String? offlineVideoThumbnailPath});
}

/// @nodoc
class _$CompactVideoStateCopyWithImpl<$Res, $Val extends CompactVideoState>
    implements $CompactVideoStateCopyWith<$Res> {
  _$CompactVideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offlineVideo = freezed,
    Object? offlineVideoThumbnailPath = freezed,
  }) {
    return _then(_value.copyWith(
      offlineVideo: freezed == offlineVideo
          ? _value.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      offlineVideoThumbnailPath: freezed == offlineVideoThumbnailPath
          ? _value.offlineVideoThumbnailPath
          : offlineVideoThumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompactVideoStateImplCopyWith<$Res>
    implements $CompactVideoStateCopyWith<$Res> {
  factory _$$CompactVideoStateImplCopyWith(_$CompactVideoStateImpl value,
          $Res Function(_$CompactVideoStateImpl) then) =
      __$$CompactVideoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DownloadedVideo? offlineVideo, String? offlineVideoThumbnailPath});
}

/// @nodoc
class __$$CompactVideoStateImplCopyWithImpl<$Res>
    extends _$CompactVideoStateCopyWithImpl<$Res, _$CompactVideoStateImpl>
    implements _$$CompactVideoStateImplCopyWith<$Res> {
  __$$CompactVideoStateImplCopyWithImpl(_$CompactVideoStateImpl _value,
      $Res Function(_$CompactVideoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offlineVideo = freezed,
    Object? offlineVideoThumbnailPath = freezed,
  }) {
    return _then(_$CompactVideoStateImpl(
      offlineVideo: freezed == offlineVideo
          ? _value.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      offlineVideoThumbnailPath: freezed == offlineVideoThumbnailPath
          ? _value.offlineVideoThumbnailPath
          : offlineVideoThumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CompactVideoStateImpl implements _CompactVideoState {
  const _$CompactVideoStateImpl(
      {this.offlineVideo, this.offlineVideoThumbnailPath});

  @override
  final DownloadedVideo? offlineVideo;
  @override
  final String? offlineVideoThumbnailPath;

  @override
  String toString() {
    return 'CompactVideoState(offlineVideo: $offlineVideo, offlineVideoThumbnailPath: $offlineVideoThumbnailPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompactVideoStateImpl &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo) &&
            (identical(other.offlineVideoThumbnailPath,
                    offlineVideoThumbnailPath) ||
                other.offlineVideoThumbnailPath == offlineVideoThumbnailPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, offlineVideo, offlineVideoThumbnailPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompactVideoStateImplCopyWith<_$CompactVideoStateImpl> get copyWith =>
      __$$CompactVideoStateImplCopyWithImpl<_$CompactVideoStateImpl>(
          this, _$identity);
}

abstract class _CompactVideoState implements CompactVideoState {
  const factory _CompactVideoState(
      {final DownloadedVideo? offlineVideo,
      final String? offlineVideoThumbnailPath}) = _$CompactVideoStateImpl;

  @override
  DownloadedVideo? get offlineVideo;
  @override
  String? get offlineVideoThumbnailPath;
  @override
  @JsonKey(ignore: true)
  _$$CompactVideoStateImplCopyWith<_$CompactVideoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
