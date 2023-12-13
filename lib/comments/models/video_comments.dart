import 'package:json_annotation/json_annotation.dart';

import 'comment.dart';

part 'video_comments.g.dart';

@JsonSerializable()
class VideoComments {
  int? commentCount;
  String? videoId;
  String? continuation;
  List<Comment> comments = [];

  VideoComments(this.commentCount, this.videoId, this.continuation, this.comments);

  factory VideoComments.fromJson(Map<String, dynamic> json) => _$VideoCommentsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCommentsToJson(this);
}
