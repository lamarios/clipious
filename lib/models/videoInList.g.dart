// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoInList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInList _$VideoInListFromJson(Map<String, dynamic> json) => VideoInList(
      json['title'] as String,
      json['videoId'] as String,
      json['lengthSeconds'] as int,
      json['viewCount'] as int?,
      json['author'] as String,
      json['authorId'] as String,
      json['authorUrl'] as String,
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
      'title': instance.title,
      'videoId': instance.videoId,
      'lengthSeconds': instance.lengthSeconds,
      'viewCount': instance.viewCount,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'published': instance.published,
      'index': instance.index,
      'indexId': instance.indexId,
      'publishedText': instance.publishedText,
      'videoThumbnails': instance.videoThumbnails,
    };
