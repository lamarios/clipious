import 'package:invidious/models/commentReplies.dart';
import 'package:invidious/models/creatorHeart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'authorThumbnail.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  String author;
  List<AuthorThumbnail> authorThumbnails = [];
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

  AuthorThumbnail? getBestAuthorThumbnail() {
    if (authorThumbnails.isNotEmpty) {
      authorThumbnails.sort((a, b) {
        return (b.width * b.height).compareTo(a.width * a.height);
      });

      return authorThumbnails[0];
    } else {
      return null;
    }
  }
}
