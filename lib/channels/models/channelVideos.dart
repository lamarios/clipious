import 'package:invidious/videos/models/video_in_list.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/models/item_with_continuation.dart';

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
