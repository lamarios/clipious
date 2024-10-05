import 'package:clipious/videos/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_feed.g.dart';

@JsonSerializable()
class UserFeed {
  List<Video>? notifications = [];
  List<Video>? videos = [];

  UserFeed(this.notifications, this.videos);

  factory UserFeed.fromJson(Map<String, dynamic> json) =>
      _$UserFeedFromJson(json);

  Map<String, dynamic> toJson() => _$UserFeedToJson(this);
}
