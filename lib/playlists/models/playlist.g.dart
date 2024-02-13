// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlaylistCWProxy {
  Playlist type(String type);

  Playlist title(String title);

  Playlist playlistId(String playlistId);

  Playlist author(String author);

  Playlist authordId(String? authordId);

  Playlist authorUrl(String? authorUrl);

  Playlist authorThumbnails(List<ImageObject>? authorThumbnails);

  Playlist description(String? description);

  Playlist videoCount(int videoCount);

  Playlist viewCount(int? viewCount);

  Playlist isListed(bool? isListed);

  Playlist updated(int? updated);

  Playlist videos(List<VideoInList> videos);

  Playlist removedByFilter(int removedByFilter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Playlist(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Playlist(...).copyWith(id: 12, name: "My name")
  /// ````
  Playlist call({
    String? type,
    String? title,
    String? playlistId,
    String? author,
    String? authordId,
    String? authorUrl,
    List<ImageObject>? authorThumbnails,
    String? description,
    int? videoCount,
    int? viewCount,
    bool? isListed,
    int? updated,
    List<VideoInList>? videos,
    int? removedByFilter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlaylist.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlaylist.copyWith.fieldName(...)`
class _$PlaylistCWProxyImpl implements _$PlaylistCWProxy {
  const _$PlaylistCWProxyImpl(this._value);

  final Playlist _value;

  @override
  Playlist type(String type) => this(type: type);

  @override
  Playlist title(String title) => this(title: title);

  @override
  Playlist playlistId(String playlistId) => this(playlistId: playlistId);

  @override
  Playlist author(String author) => this(author: author);

  @override
  Playlist authordId(String? authordId) => this(authordId: authordId);

  @override
  Playlist authorUrl(String? authorUrl) => this(authorUrl: authorUrl);

  @override
  Playlist authorThumbnails(List<ImageObject>? authorThumbnails) =>
      this(authorThumbnails: authorThumbnails);

  @override
  Playlist description(String? description) => this(description: description);

  @override
  Playlist videoCount(int videoCount) => this(videoCount: videoCount);

  @override
  Playlist viewCount(int? viewCount) => this(viewCount: viewCount);

  @override
  Playlist isListed(bool? isListed) => this(isListed: isListed);

  @override
  Playlist updated(int? updated) => this(updated: updated);

  @override
  Playlist videos(List<VideoInList> videos) => this(videos: videos);

  @override
  Playlist removedByFilter(int removedByFilter) =>
      this(removedByFilter: removedByFilter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Playlist(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Playlist(...).copyWith(id: 12, name: "My name")
  /// ````
  Playlist call({
    Object? type = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? playlistId = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
    Object? authordId = const $CopyWithPlaceholder(),
    Object? authorUrl = const $CopyWithPlaceholder(),
    Object? authorThumbnails = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? videoCount = const $CopyWithPlaceholder(),
    Object? viewCount = const $CopyWithPlaceholder(),
    Object? isListed = const $CopyWithPlaceholder(),
    Object? updated = const $CopyWithPlaceholder(),
    Object? videos = const $CopyWithPlaceholder(),
    Object? removedByFilter = const $CopyWithPlaceholder(),
  }) {
    return Playlist._(
      type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      playlistId == const $CopyWithPlaceholder() || playlistId == null
          ? _value.playlistId
          // ignore: cast_nullable_to_non_nullable
          : playlistId as String,
      author == const $CopyWithPlaceholder() || author == null
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as String,
      authordId == const $CopyWithPlaceholder()
          ? _value.authordId
          // ignore: cast_nullable_to_non_nullable
          : authordId as String?,
      authorUrl == const $CopyWithPlaceholder()
          ? _value.authorUrl
          // ignore: cast_nullable_to_non_nullable
          : authorUrl as String?,
      authorThumbnails == const $CopyWithPlaceholder()
          ? _value.authorThumbnails
          // ignore: cast_nullable_to_non_nullable
          : authorThumbnails as List<ImageObject>?,
      description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      videoCount == const $CopyWithPlaceholder() || videoCount == null
          ? _value.videoCount
          // ignore: cast_nullable_to_non_nullable
          : videoCount as int,
      viewCount == const $CopyWithPlaceholder()
          ? _value.viewCount
          // ignore: cast_nullable_to_non_nullable
          : viewCount as int?,
      isListed == const $CopyWithPlaceholder()
          ? _value.isListed
          // ignore: cast_nullable_to_non_nullable
          : isListed as bool?,
      updated == const $CopyWithPlaceholder()
          ? _value.updated
          // ignore: cast_nullable_to_non_nullable
          : updated as int?,
      videos == const $CopyWithPlaceholder() || videos == null
          ? _value.videos
          // ignore: cast_nullable_to_non_nullable
          : videos as List<VideoInList>,
      removedByFilter == const $CopyWithPlaceholder() || removedByFilter == null
          ? _value.removedByFilter
          // ignore: cast_nullable_to_non_nullable
          : removedByFilter as int,
    );
  }
}

extension $PlaylistCopyWith on Playlist {
  /// Returns a callable class that can be used as follows: `instanceOfPlaylist.copyWith(...)` or like so:`instanceOfPlaylist.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlaylistCWProxy get copyWith => _$PlaylistCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      json['type'] as String,
      json['title'] as String,
      json['playlistId'] as String,
      json['author'] as String,
      json['authordId'] as String?,
      json['authorUrl'] as String?,
      json['description'] as String?,
      json['videoCount'] as int,
    )
      ..authorThumbnails = (json['authorThumbnails'] as List<dynamic>?)
          ?.map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList()
      ..viewCount = json['viewCount'] as int?
      ..isListed = json['isListed'] as bool?
      ..updated = json['updated'] as int?
      ..videos = (json['videos'] as List<dynamic>)
          .map((e) => VideoInList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'playlistId': instance.playlistId,
      'author': instance.author,
      'authordId': instance.authordId,
      'authorUrl': instance.authorUrl,
      'authorThumbnails': instance.authorThumbnails,
      'description': instance.description,
      'videoCount': instance.videoCount,
      'viewCount': instance.viewCount,
      'isListed': instance.isListed,
      'updated': instance.updated,
      'videos': instance.videos,
    };
