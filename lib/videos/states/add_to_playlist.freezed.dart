// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddToPlaylistController {
  String get videoId => throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;
  int get playListCount => throw _privateConstructorUsedError;
  bool get isVideoLiked => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToPlaylistControllerCopyWith<AddToPlaylistController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToPlaylistControllerCopyWith<$Res> {
  factory $AddToPlaylistControllerCopyWith(AddToPlaylistController value,
          $Res Function(AddToPlaylistController) then) =
      _$AddToPlaylistControllerCopyWithImpl<$Res, AddToPlaylistController>;
  @useResult
  $Res call(
      {String videoId,
      List<Playlist> playlists,
      int playListCount,
      bool isVideoLiked,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class _$AddToPlaylistControllerCopyWithImpl<$Res,
        $Val extends AddToPlaylistController>
    implements $AddToPlaylistControllerCopyWith<$Res> {
  _$AddToPlaylistControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? playlists = null,
    Object? playListCount = null,
    Object? isVideoLiked = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_value.copyWith(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      playListCount: null == playListCount
          ? _value.playListCount
          : playListCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVideoLiked: null == isVideoLiked
          ? _value.isVideoLiked
          : isVideoLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddToPlaylistControllerImplCopyWith<$Res>
    implements $AddToPlaylistControllerCopyWith<$Res> {
  factory _$$AddToPlaylistControllerImplCopyWith(
          _$AddToPlaylistControllerImpl value,
          $Res Function(_$AddToPlaylistControllerImpl) then) =
      __$$AddToPlaylistControllerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String videoId,
      List<Playlist> playlists,
      int playListCount,
      bool isVideoLiked,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class __$$AddToPlaylistControllerImplCopyWithImpl<$Res>
    extends _$AddToPlaylistControllerCopyWithImpl<$Res,
        _$AddToPlaylistControllerImpl>
    implements _$$AddToPlaylistControllerImplCopyWith<$Res> {
  __$$AddToPlaylistControllerImplCopyWithImpl(
      _$AddToPlaylistControllerImpl _value,
      $Res Function(_$AddToPlaylistControllerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? playlists = null,
    Object? playListCount = null,
    Object? isVideoLiked = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_$AddToPlaylistControllerImpl(
      null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      playListCount: null == playListCount
          ? _value.playListCount
          : playListCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVideoLiked: null == isVideoLiked
          ? _value.isVideoLiked
          : isVideoLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddToPlaylistControllerImpl implements _AddToPlaylistController {
  const _$AddToPlaylistControllerImpl(this.videoId,
      {final List<Playlist> playlists = const [],
      this.playListCount = 0,
      this.isVideoLiked = false,
      this.loading = true,
      this.isLoggedIn = false})
      : _playlists = playlists;

  @override
  final String videoId;
  final List<Playlist> _playlists;
  @override
  @JsonKey()
  List<Playlist> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  @JsonKey()
  final int playListCount;
  @override
  @JsonKey()
  final bool isVideoLiked;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isLoggedIn;

  @override
  String toString() {
    return 'AddToPlaylistController(videoId: $videoId, playlists: $playlists, playListCount: $playListCount, isVideoLiked: $isVideoLiked, loading: $loading, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToPlaylistControllerImpl &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            (identical(other.playListCount, playListCount) ||
                other.playListCount == playListCount) &&
            (identical(other.isVideoLiked, isVideoLiked) ||
                other.isVideoLiked == isVideoLiked) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoId,
      const DeepCollectionEquality().hash(_playlists),
      playListCount,
      isVideoLiked,
      loading,
      isLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToPlaylistControllerImplCopyWith<_$AddToPlaylistControllerImpl>
      get copyWith => __$$AddToPlaylistControllerImplCopyWithImpl<
          _$AddToPlaylistControllerImpl>(this, _$identity);
}

abstract class _AddToPlaylistController implements AddToPlaylistController {
  const factory _AddToPlaylistController(final String videoId,
      {final List<Playlist> playlists,
      final int playListCount,
      final bool isVideoLiked,
      final bool loading,
      final bool isLoggedIn}) = _$AddToPlaylistControllerImpl;

  @override
  String get videoId;
  @override
  List<Playlist> get playlists;
  @override
  int get playListCount;
  @override
  bool get isVideoLiked;
  @override
  bool get loading;
  @override
  bool get isLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$AddToPlaylistControllerImplCopyWith<_$AddToPlaylistControllerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
