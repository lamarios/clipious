import 'package:invidious/videos/models/base_video.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/models/image_object.dart';
import 'adaptive_format.dart';
import 'caption.dart';
import 'format_stream.dart';
import 'recommended_video.dart';

part 'video.g.dart';

@JsonSerializable()
class Video extends BaseVideo {
  String dashUrl;

  String description;
  String descriptionHtml;
  int published;
  String publishedText;
  List<String> keywords;
  int viewCount;
  int likeCount;
  int dislikeCount;
  bool paid;
  bool premium;
  bool isFamilyFriendly;
  List<String> allowedRegions;
  String genre;
  String genreUrl;

  List<ImageObject> authorThumbnails;
  String subCountText;
  bool allowRatings;
  double rating;
  bool isListed;
  bool liveNow;
  bool isUpcoming;
  int? premiereTimestamp;
  String? hlsUrl;
  List<AdaptiveFormat> adaptiveFormats;
  List<FormatStream> formatStreams;
  List<Caption> captions;
  List<RecommendedVideo> recommendedVideos;

  Video(
      String title,
      String videoId,
      List<ImageObject> videoThumbnails,
      this.description,
      this.descriptionHtml,
      this.published,
      this.publishedText,
      this.keywords,
      this.viewCount,
      this.likeCount,
      this.dislikeCount,
      this.paid,
      this.premium,
      this.isFamilyFriendly,
      this.allowedRegions,
      this.genre,
      this.genreUrl,
      this.dashUrl,
      String? author,
      String? authorUrl,
      this.authorThumbnails,
      this.subCountText,
      int lengthSeconds,
      this.allowRatings,
      this.rating,
      this.isListed,
      this.liveNow,
      this.isUpcoming,
      this.premiereTimestamp,
      this.hlsUrl,
      this.adaptiveFormats,
      this.formatStreams,
      String? authorId,
      this.captions,
      this.recommendedVideos)
      : super(title, videoId, lengthSeconds, author, authorId, authorUrl, videoThumbnails);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  ImageObject? getBestThumbnail() {
    if (videoThumbnails.isNotEmpty) {
      return videoThumbnails.firstWhere((element) => element.quality == 'maxres');
    } else {
      return null;
    }
  }

  @override
  VideoInList toVideoInList() {
    return VideoInList(title, videoId, lengthSeconds, viewCount, author, authorId, authorUrl, published, publishedText,
        videoThumbnails);
  }
}
