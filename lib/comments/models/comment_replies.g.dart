// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_replies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentReplies _$CommentRepliesFromJson(Map<String, dynamic> json) =>
    CommentReplies(
      json['replyCount'] as int,
      json['continuation'] as String,
    );

Map<String, dynamic> _$CommentRepliesToJson(CommentReplies instance) =>
    <String, dynamic>{
      'replyCount': instance.replyCount,
      'continuation': instance.continuation,
    };
