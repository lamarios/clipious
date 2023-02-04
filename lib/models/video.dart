import 'adaptiveFormat.dart';
import 'authorThumbnail.dart';
import 'caption.dart';
import 'formatStream.dart';
import 'recommendedVideo.dart';
import 'videoThumbnail.dart';

import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  String title;
  String videoId;
  List<VideoThumbnail> videoThumbnails;

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
  String author;
  String authorUrl;

  List<AuthorThumbnail> authorThumbnails;
  String subCountText;
  int lengthSeconds;
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
      this.title,
      this.videoId,
      this.videoThumbnails,
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
      this.author,
      this.authorUrl,
      this.authorThumbnails,
      this.subCountText,
      this.lengthSeconds,
      this.allowRatings,
      this.rating,
      this.isListed,
      this.liveNow,
      this.isUpcoming,
      this.premiereTimestamp,
      this.hlsUrl,
      this.adaptiveFormats,
      this.formatStreams,
      this.captions,
      this.recommendedVideos);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  VideoThumbnail? getBestThumbnail() {
    if (videoThumbnails.isNotEmpty) {
      videoThumbnails.sort((a, b) {
        return (b.width * b.height).compareTo(a.width * a.height);
      });

      return videoThumbnails[0];
    } else {
      return null;
    }
  }

  AuthorThumbnail? getBestAuthorThumbnail() {
    if (authorThumbnails.isNotEmpty) {
      authorThumbnails.sort((a, b) {
        return (b.width * b.height).compareTo(a.width * a.height);
      });

      return authorThumbnails[0];
    } else {
      return null;
    }
  }
}
