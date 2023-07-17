// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoComments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoComments _$VideoCommentsFromJson(Map<String, dynamic> json) => VideoComments(
      json['commentCount'] as int?,
      json['videoId'] as String?,
      json['continuation'] as String?,
      (json['comments'] as List<dynamic>).map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$VideoCommentsToJson(VideoComments instance) => <String, dynamic>{
      'commentCount': instance.commentCount,
      'videoId': instance.videoId,
      'continuation': instance.continuation,
      'comments': instance.comments,
    };
