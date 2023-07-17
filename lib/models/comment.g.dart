// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['author'] as String,
      (json['authorThumbnails'] as List<dynamic>).map((e) => ImageObject.fromJson(e as Map<String, dynamic>)).toList(),
      json['authorId'] as String,
      json['authorUrl'] as String,
      json['isEdited'] as bool,
      json['content'] as String,
      json['publishedText'] as String,
      json['likeCount'] as int,
      json['commentId'] as String,
      json['authorIsChannelOwner'] as bool,
      json['creatorHeart'] == null ? null : CreatorHeart.fromJson(json['creatorHeart'] as Map<String, dynamic>),
      json['replies'] == null ? null : CommentReplies.fromJson(json['replies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'author': instance.author,
      'authorThumbnails': instance.authorThumbnails,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'isEdited': instance.isEdited,
      'content': instance.content,
      'publishedText': instance.publishedText,
      'likeCount': instance.likeCount,
      'commentId': instance.commentId,
      'authorIsChannelOwner': instance.authorIsChannelOwner,
      'creatorHeart': instance.creatorHeart,
      'replies': instance.replies,
    };
