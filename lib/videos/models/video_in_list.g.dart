// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_in_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoInListCWProxy {
  VideoInList videoId(String videoId);

  VideoInList title(String title);

  VideoInList lengthSeconds(int lengthSeconds);

  VideoInList author(String? author);

  VideoInList authorId(String? authorId);

  VideoInList authorUrl(String? authorUrl);

  VideoInList videoThumbnails(List<ImageObject> videoThumbnails);

  VideoInList viewCount(int? viewCount);

  VideoInList published(int? published);

  VideoInList index(int? index);

  VideoInList indexId(String? indexId);

  VideoInList publishedText(String? publishedText);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoInList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoInList(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoInList call({
    String? videoId,
    String? title,
    int? lengthSeconds,
    String? author,
    String? authorId,
    String? authorUrl,
    List<ImageObject>? videoThumbnails,
    int? viewCount,
    int? published,
    int? index,
    String? indexId,
    String? publishedText,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoInList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoInList.copyWith.fieldName(...)`
class _$VideoInListCWProxyImpl implements _$VideoInListCWProxy {
  const _$VideoInListCWProxyImpl(this._value);

  final VideoInList _value;

  @override
  VideoInList videoId(String videoId) => this(videoId: videoId);

  @override
  VideoInList title(String title) => this(title: title);

  @override
  VideoInList lengthSeconds(int lengthSeconds) =>
      this(lengthSeconds: lengthSeconds);

  @override
  VideoInList author(String? author) => this(author: author);

  @override
  VideoInList authorId(String? authorId) => this(authorId: authorId);

  @override
  VideoInList authorUrl(String? authorUrl) => this(authorUrl: authorUrl);

  @override
  VideoInList videoThumbnails(List<ImageObject> videoThumbnails) =>
      this(videoThumbnails: videoThumbnails);

  @override
  VideoInList viewCount(int? viewCount) => this(viewCount: viewCount);

  @override
  VideoInList published(int? published) => this(published: published);

  @override
  VideoInList index(int? index) => this(index: index);

  @override
  VideoInList indexId(String? indexId) => this(indexId: indexId);

  @override
  VideoInList publishedText(String? publishedText) =>
      this(publishedText: publishedText);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoInList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoInList(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoInList call({
    Object? videoId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? lengthSeconds = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
    Object? authorId = const $CopyWithPlaceholder(),
    Object? authorUrl = const $CopyWithPlaceholder(),
    Object? videoThumbnails = const $CopyWithPlaceholder(),
    Object? viewCount = const $CopyWithPlaceholder(),
    Object? published = const $CopyWithPlaceholder(),
    Object? index = const $CopyWithPlaceholder(),
    Object? indexId = const $CopyWithPlaceholder(),
    Object? publishedText = const $CopyWithPlaceholder(),
  }) {
    return VideoInList._(
      videoId == const $CopyWithPlaceholder() || videoId == null
          ? _value.videoId
          // ignore: cast_nullable_to_non_nullable
          : videoId as String,
      title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      lengthSeconds == const $CopyWithPlaceholder() || lengthSeconds == null
          ? _value.lengthSeconds
          // ignore: cast_nullable_to_non_nullable
          : lengthSeconds as int,
      author == const $CopyWithPlaceholder()
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as String?,
      authorId == const $CopyWithPlaceholder()
          ? _value.authorId
          // ignore: cast_nullable_to_non_nullable
          : authorId as String?,
      authorUrl == const $CopyWithPlaceholder()
          ? _value.authorUrl
          // ignore: cast_nullable_to_non_nullable
          : authorUrl as String?,
      videoThumbnails == const $CopyWithPlaceholder() || videoThumbnails == null
          ? _value.videoThumbnails
          // ignore: cast_nullable_to_non_nullable
          : videoThumbnails as List<ImageObject>,
      viewCount == const $CopyWithPlaceholder()
          ? _value.viewCount
          // ignore: cast_nullable_to_non_nullable
          : viewCount as int?,
      published == const $CopyWithPlaceholder()
          ? _value.published
          // ignore: cast_nullable_to_non_nullable
          : published as int?,
      index == const $CopyWithPlaceholder()
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int?,
      indexId == const $CopyWithPlaceholder()
          ? _value.indexId
          // ignore: cast_nullable_to_non_nullable
          : indexId as String?,
      publishedText == const $CopyWithPlaceholder()
          ? _value.publishedText
          // ignore: cast_nullable_to_non_nullable
          : publishedText as String?,
    );
  }
}

extension $VideoInListCopyWith on VideoInList {
  /// Returns a callable class that can be used as follows: `instanceOfVideoInList.copyWith(...)` or like so:`instanceOfVideoInList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoInListCWProxy get copyWith => _$VideoInListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInList _$VideoInListFromJson(Map<String, dynamic> json) => VideoInList(
      json['title'] as String,
      json['videoId'] as String,
      json['lengthSeconds'] as int,
      json['viewCount'] as int?,
      json['author'] as String?,
      json['authorId'] as String?,
      json['authorUrl'] as String?,
      json['published'] as int?,
      json['publishedText'] as String?,
      (json['videoThumbnails'] as List<dynamic>)
          .map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..index = json['index'] as int?
      ..indexId = json['indexId'] as String?;

Map<String, dynamic> _$VideoInListToJson(VideoInList instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'title': instance.title,
      'lengthSeconds': instance.lengthSeconds,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'videoThumbnails': instance.videoThumbnails,
      'viewCount': instance.viewCount,
      'published': instance.published,
      'index': instance.index,
      'indexId': instance.indexId,
      'publishedText': instance.publishedText,
    };
