import 'package:clipious/videos/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/models/item_with_continuation.dart';

part 'channel_videos.g.dart';

@JsonSerializable()
class VideosWithContinuation extends ItemtWithContinuation<Video> {
  List<Video> videos;

  VideosWithContinuation(this.videos, String? continuation)
      : super(continuation);

  factory VideosWithContinuation.fromJson(Map<String, dynamic> json) =>
      _$VideosWithContinuationFromJson(json);

  Map<String, dynamic> toJson() => _$VideosWithContinuationToJson(this);

  @override
  List<Video> getItems() {
    return videos;
  }
}
