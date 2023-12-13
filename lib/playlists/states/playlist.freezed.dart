// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistState {
  double get loadingProgress => throw _privateConstructorUsedError;
  Playlist get playlist => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  double get playlistItemHeight => throw _privateConstructorUsedError;
  bool get showImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistStateCopyWith<PlaylistState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(PlaylistState value, $Res Function(PlaylistState) then) =
      _$PlaylistStateCopyWithImpl<$Res, PlaylistState>;
  @useResult
  $Res call({double loadingProgress, Playlist playlist, bool loading, double playlistItemHeight, bool showImage});
}

/// @nodoc
class _$PlaylistStateCopyWithImpl<$Res, $Val extends PlaylistState> implements $PlaylistStateCopyWith<$Res> {
  _$PlaylistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingProgress = null,
    Object? playlist = null,
    Object? loading = null,
    Object? playlistItemHeight = null,
    Object? showImage = null,
  }) {
    return _then(_value.copyWith(
      loadingProgress: null == loadingProgress
          ? _value.loadingProgress
          : loadingProgress // ignore: cast_nullable_to_non_nullable
              as double,
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as Playlist,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      playlistItemHeight: null == playlistItemHeight
          ? _value.playlistItemHeight
          : playlistItemHeight // ignore: cast_nullable_to_non_nullable
              as double,
      showImage: null == showImage
          ? _value.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistStateImplCopyWith<$Res> implements $PlaylistStateCopyWith<$Res> {
  factory _$$PlaylistStateImplCopyWith(_$PlaylistStateImpl value, $Res Function(_$PlaylistStateImpl) then) =
      __$$PlaylistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double loadingProgress, Playlist playlist, bool loading, double playlistItemHeight, bool showImage});
}

/// @nodoc
class __$$PlaylistStateImplCopyWithImpl<$Res> extends _$PlaylistStateCopyWithImpl<$Res, _$PlaylistStateImpl>
    implements _$$PlaylistStateImplCopyWith<$Res> {
  __$$PlaylistStateImplCopyWithImpl(_$PlaylistStateImpl _value, $Res Function(_$PlaylistStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingProgress = null,
    Object? playlist = null,
    Object? loading = null,
    Object? playlistItemHeight = null,
    Object? showImage = null,
  }) {
    return _then(_$PlaylistStateImpl(
      loadingProgress: null == loadingProgress
          ? _value.loadingProgress
          : loadingProgress // ignore: cast_nullable_to_non_nullable
              as double,
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as Playlist,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      playlistItemHeight: null == playlistItemHeight
          ? _value.playlistItemHeight
          : playlistItemHeight // ignore: cast_nullable_to_non_nullable
              as double,
      showImage: null == showImage
          ? _value.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlaylistStateImpl implements _PlaylistState {
  const _$PlaylistStateImpl(
      {this.loadingProgress = 0,
      required this.playlist,
      this.loading = true,
      required this.playlistItemHeight,
      this.showImage = true});

  @override
  @JsonKey()
  final double loadingProgress;
  @override
  final Playlist playlist;
  @override
  @JsonKey()
  final bool loading;
  @override
  final double playlistItemHeight;
  @override
  @JsonKey()
  final bool showImage;

  @override
  String toString() {
    return 'PlaylistState(loadingProgress: $loadingProgress, playlist: $playlist, loading: $loading, playlistItemHeight: $playlistItemHeight, showImage: $showImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistStateImpl &&
            (identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress) &&
            (identical(other.playlist, playlist) || other.playlist == playlist) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.playlistItemHeight, playlistItemHeight) ||
                other.playlistItemHeight == playlistItemHeight) &&
            (identical(other.showImage, showImage) || other.showImage == showImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingProgress, playlist, loading, playlistItemHeight, showImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistStateImplCopyWith<_$PlaylistStateImpl> get copyWith =>
      __$$PlaylistStateImplCopyWithImpl<_$PlaylistStateImpl>(this, _$identity);
}

abstract class _PlaylistState implements PlaylistState {
  const factory _PlaylistState(
      {final double loadingProgress,
      required final Playlist playlist,
      final bool loading,
      required final double playlistItemHeight,
      final bool showImage}) = _$PlaylistStateImpl;

  @override
  double get loadingProgress;
  @override
  Playlist get playlist;
  @override
  bool get loading;
  @override
  double get playlistItemHeight;
  @override
  bool get showImage;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistStateImplCopyWith<_$PlaylistStateImpl> get copyWith => throw _privateConstructorUsedError;
}
