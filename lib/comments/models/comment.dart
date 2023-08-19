import 'package:invidious/comments/models/commentReplies.dart';
import 'package:invidious/comments/models/creator_heart.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/models/image_object.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  String author;
  List<ImageObject> authorThumbnails = [];
  String authorId;
  String authorUrl;
  bool isEdited;
  String content;
  String publishedText;
  int likeCount;
  String commentId;
  bool authorIsChannelOwner = false;
  CreatorHeart? creatorHeart;
  CommentReplies? replies;

  Comment(this.author, this.authorThumbnails, this.authorId, this.authorUrl, this.isEdited, this.content, this.publishedText, this.likeCount, this.commentId, this.authorIsChannelOwner,
      this.creatorHeart, this.replies);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
