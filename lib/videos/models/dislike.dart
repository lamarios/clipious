import 'package:json_annotation/json_annotation.dart';

part 'dislike.g.dart';

@JsonSerializable()
class Dislike {
  int dislikes;

  Dislike(this.dislikes);

  factory Dislike.fromJson(Map<String, dynamic> json) =>
      _$DislikeFromJson(json);

  Map<String, dynamic> toJson() => _$DislikeToJson(this);
}
