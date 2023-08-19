import 'package:json_annotation/json_annotation.dart';

part 'commentReplies.g.dart';

@JsonSerializable()
class CommentReplies {
  int replyCount;
  String continuation;

  CommentReplies(this.replyCount, this.continuation);

  factory CommentReplies.fromJson(Map<String, dynamic> json) => _$CommentRepliesFromJson(json);

  Map<String, dynamic> toJson() => _$CommentRepliesToJson(this);
}
