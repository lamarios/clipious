import 'package:invidious/models/videoInList.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../models/itemWithContinuation.dart';

part 'channelVideos.g.dart';

@JsonSerializable()
class VideosWithContinuation extends ItemtWithContinuation<VideoInList> {
  List<VideoInList> videos;

  VideosWithContinuation(this.videos, String? continuation) : super(continuation);

  factory VideosWithContinuation.fromJson(Map<String, dynamic> json) => _$VideosWithContinuationFromJson(json);

  Map<String, dynamic> toJson() => _$VideosWithContinuationToJson(this);

  @override
  List<VideoInList> getItems() {
    return videos;
  }
}
