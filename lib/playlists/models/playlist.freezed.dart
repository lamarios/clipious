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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return _Playlist.fromJson(json);
}

/// @nodoc
mixin _$Playlist {
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get playlistId => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String? get authordId => throw _privateConstructorUsedError;
  String? get authorUrl => throw _privateConstructorUsedError;
  List<ImageObject> get authorThumbnails => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get videoCount => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  bool? get isListed => throw _privateConstructorUsedError;
  int? get updated => throw _privateConstructorUsedError;
  List<Video> get videos => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  int get removedByFilter => throw _privateConstructorUsedError;

  /// Serializes this Playlist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistCopyWith<Playlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistCopyWith<$Res> {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) then) =
      _$PlaylistCopyWithImpl<$Res, Playlist>;
  @useResult
  $Res call(
      {String type,
      String title,
      String playlistId,
      String author,
      String? authordId,
      String? authorUrl,
      List<ImageObject> authorThumbnails,
      String? description,
      int videoCount,
      int? viewCount,
      bool? isListed,
      int? updated,
      List<Video> videos,
      @JsonKey(includeToJson: false, includeFromJson: false)
      int removedByFilter});
}

/// @nodoc
class _$PlaylistCopyWithImpl<$Res, $Val extends Playlist>
    implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? playlistId = null,
    Object? author = null,
    Object? authordId = freezed,
    Object? authorUrl = freezed,
    Object? authorThumbnails = null,
    Object? description = freezed,
    Object? videoCount = null,
    Object? viewCount = freezed,
    Object? isListed = freezed,
    Object? updated = freezed,
    Object? videos = null,
    Object? removedByFilter = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playlistId: null == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authordId: freezed == authordId
          ? _value.authordId
          : authordId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _value.authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCount: null == videoCount
          ? _value.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isListed: freezed == isListed
          ? _value.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      removedByFilter: null == removedByFilter
          ? _value.removedByFilter
          : removedByFilter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistImplCopyWith<$Res>
    implements $PlaylistCopyWith<$Res> {
  factory _$$PlaylistImplCopyWith(
          _$PlaylistImpl value, $Res Function(_$PlaylistImpl) then) =
      __$$PlaylistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String title,
      String playlistId,
      String author,
      String? authordId,
      String? authorUrl,
      List<ImageObject> authorThumbnails,
      String? description,
      int videoCount,
      int? viewCount,
      bool? isListed,
      int? updated,
      List<Video> videos,
      @JsonKey(includeToJson: false, includeFromJson: false)
      int removedByFilter});
}

/// @nodoc
class __$$PlaylistImplCopyWithImpl<$Res>
    extends _$PlaylistCopyWithImpl<$Res, _$PlaylistImpl>
    implements _$$PlaylistImplCopyWith<$Res> {
  __$$PlaylistImplCopyWithImpl(
      _$PlaylistImpl _value, $Res Function(_$PlaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? playlistId = null,
    Object? author = null,
    Object? authordId = freezed,
    Object? authorUrl = freezed,
    Object? authorThumbnails = null,
    Object? description = freezed,
    Object? videoCount = null,
    Object? viewCount = freezed,
    Object? isListed = freezed,
    Object? updated = freezed,
    Object? videos = null,
    Object? removedByFilter = null,
  }) {
    return _then(_$PlaylistImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playlistId: null == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authordId: freezed == authordId
          ? _value.authordId
          : authordId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _value._authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCount: null == videoCount
          ? _value.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isListed: freezed == isListed
          ? _value.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      removedByFilter: null == removedByFilter
          ? _value.removedByFilter
          : removedByFilter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistImpl implements _Playlist {
  const _$PlaylistImpl(
      {this.type = youtubePlaylist,
      required this.title,
      required this.playlistId,
      required this.author,
      this.authordId,
      this.authorUrl,
      final List<ImageObject> authorThumbnails = const [],
      this.description,
      required this.videoCount,
      this.viewCount,
      this.isListed,
      this.updated,
      final List<Video> videos = const [],
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.removedByFilter = 0})
      : _authorThumbnails = authorThumbnails,
        _videos = videos;

  factory _$PlaylistImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  final String title;
  @override
  final String playlistId;
  @override
  final String author;
  @override
  final String? authordId;
  @override
  final String? authorUrl;
  final List<ImageObject> _authorThumbnails;
  @override
  @JsonKey()
  List<ImageObject> get authorThumbnails {
    if (_authorThumbnails is EqualUnmodifiableListView)
      return _authorThumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorThumbnails);
  }

  @override
  final String? description;
  @override
  final int videoCount;
  @override
  final int? viewCount;
  @override
  final bool? isListed;
  @override
  final int? updated;
  final List<Video> _videos;
  @override
  @JsonKey()
  List<Video> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final int removedByFilter;

  @override
  String toString() {
    return 'Playlist(type: $type, title: $title, playlistId: $playlistId, author: $author, authordId: $authordId, authorUrl: $authorUrl, authorThumbnails: $authorThumbnails, description: $description, videoCount: $videoCount, viewCount: $viewCount, isListed: $isListed, updated: $updated, videos: $videos, removedByFilter: $removedByFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authordId, authordId) ||
                other.authordId == authordId) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            const DeepCollectionEquality()
                .equals(other._authorThumbnails, _authorThumbnails) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.videoCount, videoCount) ||
                other.videoCount == videoCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isListed, isListed) ||
                other.isListed == isListed) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.removedByFilter, removedByFilter) ||
                other.removedByFilter == removedByFilter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      title,
      playlistId,
      author,
      authordId,
      authorUrl,
      const DeepCollectionEquality().hash(_authorThumbnails),
      description,
      videoCount,
      viewCount,
      isListed,
      updated,
      const DeepCollectionEquality().hash(_videos),
      removedByFilter);

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      __$$PlaylistImplCopyWithImpl<_$PlaylistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistImplToJson(
      this,
    );
  }
}

abstract class _Playlist implements Playlist {
  const factory _Playlist(
      {final String type,
      required final String title,
      required final String playlistId,
      required final String author,
      final String? authordId,
      final String? authorUrl,
      final List<ImageObject> authorThumbnails,
      final String? description,
      required final int videoCount,
      final int? viewCount,
      final bool? isListed,
      final int? updated,
      final List<Video> videos,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final int removedByFilter}) = _$PlaylistImpl;

  factory _Playlist.fromJson(Map<String, dynamic> json) =
      _$PlaylistImpl.fromJson;

  @override
  String get type;
  @override
  String get title;
  @override
  String get playlistId;
  @override
  String get author;
  @override
  String? get authordId;
  @override
  String? get authorUrl;
  @override
  List<ImageObject> get authorThumbnails;
  @override
  String? get description;
  @override
  int get videoCount;
  @override
  int? get viewCount;
  @override
  bool? get isListed;
  @override
  int? get updated;
  @override
  List<Video> get videos;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  int get removedByFilter;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
