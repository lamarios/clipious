import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:json_annotation/json_annotation.dart';

import 'imageObject.dart';

part 'recommendedVideo.g.dart';

@JsonSerializable()
class RecommendedVideo extends BaseVideo {
  String viewCountText;

  RecommendedVideo(String videoId, String title, List<ImageObject> videoThumbnails, String? author, int lengthSeconds, this.viewCountText)
      : super(title, videoId, lengthSeconds, author, null, null, videoThumbnails);

  factory RecommendedVideo.fromJson(Map<String, dynamic> json) => _$RecommendedVideoFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedVideoToJson(this);

  static VideoInList toVideoInList(RecommendedVideo e) {
    return VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, '', e.videoThumbnails);
  }
}
