import 'package:invidious/videos/models/base_video.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/models/image_object.dart';

part 'recommended_video.g.dart';

@JsonSerializable()
class RecommendedVideo extends BaseVideo {
  String viewCountText;

  RecommendedVideo(
      String videoId,
      String title,
      List<ImageObject> videoThumbnails,
      String? author,
      int lengthSeconds,
      this.viewCountText)
      : super(
            title, videoId, lengthSeconds, author, null, null, videoThumbnails);

  factory RecommendedVideo.fromJson(Map<String, dynamic> json) =>
      _$RecommendedVideoFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedVideoToJson(this);
}
