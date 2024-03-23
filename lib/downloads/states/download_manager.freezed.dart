// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadManagerState {
  List<DownloadedVideo> get videos => throw _privateConstructorUsedError;
  Map<String, DownloadProgress> get downloadProgresses =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadManagerStateCopyWith<DownloadManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadManagerStateCopyWith<$Res> {
  factory $DownloadManagerStateCopyWith(DownloadManagerState value,
          $Res Function(DownloadManagerState) then) =
      _$DownloadManagerStateCopyWithImpl<$Res, DownloadManagerState>;
  @useResult
  $Res call(
      {List<DownloadedVideo> videos,
      Map<String, DownloadProgress> downloadProgresses});
}

/// @nodoc
class _$DownloadManagerStateCopyWithImpl<$Res,
        $Val extends DownloadManagerState>
    implements $DownloadManagerStateCopyWith<$Res> {
  _$DownloadManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
    Object? downloadProgresses = null,
  }) {
    return _then(_value.copyWith(
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<DownloadedVideo>,
      downloadProgresses: null == downloadProgresses
          ? _value.downloadProgresses
          : downloadProgresses // ignore: cast_nullable_to_non_nullable
              as Map<String, DownloadProgress>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadManagerStateImplCopyWith<$Res>
    implements $DownloadManagerStateCopyWith<$Res> {
  factory _$$DownloadManagerStateImplCopyWith(_$DownloadManagerStateImpl value,
          $Res Function(_$DownloadManagerStateImpl) then) =
      __$$DownloadManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DownloadedVideo> videos,
      Map<String, DownloadProgress> downloadProgresses});
}

/// @nodoc
class __$$DownloadManagerStateImplCopyWithImpl<$Res>
    extends _$DownloadManagerStateCopyWithImpl<$Res, _$DownloadManagerStateImpl>
    implements _$$DownloadManagerStateImplCopyWith<$Res> {
  __$$DownloadManagerStateImplCopyWithImpl(_$DownloadManagerStateImpl _value,
      $Res Function(_$DownloadManagerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
    Object? downloadProgresses = null,
  }) {
    return _then(_$DownloadManagerStateImpl(
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<DownloadedVideo>,
      downloadProgresses: null == downloadProgresses
          ? _value._downloadProgresses
          : downloadProgresses // ignore: cast_nullable_to_non_nullable
              as Map<String, DownloadProgress>,
    ));
  }
}

/// @nodoc

class _$DownloadManagerStateImpl extends _DownloadManagerState {
  const _$DownloadManagerStateImpl(
      {final List<DownloadedVideo> videos = const [],
      final Map<String, DownloadProgress> downloadProgresses = const {}})
      : _videos = videos,
        _downloadProgresses = downloadProgresses,
        super._();

  final List<DownloadedVideo> _videos;
  @override
  @JsonKey()
  List<DownloadedVideo> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  final Map<String, DownloadProgress> _downloadProgresses;
  @override
  @JsonKey()
  Map<String, DownloadProgress> get downloadProgresses {
    if (_downloadProgresses is EqualUnmodifiableMapView)
      return _downloadProgresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_downloadProgresses);
  }

  @override
  String toString() {
    return 'DownloadManagerState(videos: $videos, downloadProgresses: $downloadProgresses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadManagerStateImpl &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality()
                .equals(other._downloadProgresses, _downloadProgresses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_downloadProgresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadManagerStateImplCopyWith<_$DownloadManagerStateImpl>
      get copyWith =>
          __$$DownloadManagerStateImplCopyWithImpl<_$DownloadManagerStateImpl>(
              this, _$identity);
}

abstract class _DownloadManagerState extends DownloadManagerState {
  const factory _DownloadManagerState(
          {final List<DownloadedVideo> videos,
          final Map<String, DownloadProgress> downloadProgresses}) =
      _$DownloadManagerStateImpl;
  const _DownloadManagerState._() : super._();

  @override
  List<DownloadedVideo> get videos;
  @override
  Map<String, DownloadProgress> get downloadProgresses;
  @override
  @JsonKey(ignore: true)
  _$$DownloadManagerStateImplCopyWith<_$DownloadManagerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
