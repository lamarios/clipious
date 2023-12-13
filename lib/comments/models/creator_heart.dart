import 'package:json_annotation/json_annotation.dart';

part 'creator_heart.g.dart';

@JsonSerializable()
class CreatorHeart {
  String creatorThumbnail;
  String creatorName;

  CreatorHeart(this.creatorThumbnail, this.creatorName);

  factory CreatorHeart.fromJson(Map<String, dynamic> json) =>
      _$CreatorHeartFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorHeartToJson(this);
}
