import 'package:clipious/settings/models/db/server.dart';
import 'package:clipious/settings/models/db/video_filter.dart';
import 'package:clipious/utils/models/sharelink.dart';
import 'package:clipious/videos/models/ided_video.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/models/image_object.dart';
import 'adaptive_format.dart';
import 'caption.dart';
import 'format_stream.dart';

part 'video.g.dart';

part 'video.freezed.dart';

@freezed
class Video with _$Video implements ShareLinks, IdedVideo {
  @Implements<ShareLinks>()
  @Implements<IdedVideo>()
  const factory Video(
      {required String videoId,
      int? viewCount,
      int? published,
      int? index,
      String? indexId,
      String? publishedText,
      bool? isUpcoming,
      int? premiereTimestamp,
      String? dashUrl,
      String? description,
      String? descriptionHtml,
      @Default([]) List<String> keywords,
      int? likeCount,
      int? dislikeCount,
      bool? paid,
      bool? premium,
      bool? isFamilyFriendly,
      @Default([]) List<String> allowedRegions,
      String? genre,
      String? genreUrl,
      @Default([]) List<ImageObject> authorThumbnails,
      String? subCountText,
      @Default(false) bool allowRatings,
      double? rating,
      bool? isListed,
      bool? liveNow,
      String? hlsUrl,
      List<AdaptiveFormat>? adaptiveFormats,
      List<FormatStream>? formatStreams,
      @Default([]) List<Caption> captions,
      @Default([]) List<Video> recommendedVideos,
      String? title,
      int? lengthSeconds,
      String? author,
      String? authorId,
      String? authorUrl,
      @Default([]) List<ImageObject> videoThumbnails,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @Default(false)
      bool filtered,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @Default([])
      List<VideoFilter> matchedFilters,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @Default(false)
      bool filterHide,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @Default(false)
      bool deArrowed,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? deArrowThumbnailUrl,
      String? viewCountText}) = _Video;

  const Video._();

  factory Video.fromJson(Map<String, Object?> json) => _$VideoFromJson(json);

  @override
  String getInvidiousLink(Server server, int? timestamp) {
    String link = '${server.url}/watch?v=$videoId';

    if (timestamp != null) link += '&t=$timestamp';

    return link;
  }

  @override
  String getRedirectLink(int? timestamp) {
    String link = 'https://redirect.invidious.io/watch?v=$videoId';

    if (timestamp != null) link += '&t=$timestamp';

    return link;
  }

  @override
  String getYoutubeLink(int? timestamp) {
    String link = 'https://youtu.be/$videoId';

    if (timestamp != null) link += '?t=$timestamp';

    return link;
  }

  ImageObject? getBestThumbnail() {
    if (videoThumbnails.isNotEmpty) {
      return videoThumbnails
          .firstWhere((element) => element.quality == 'maxres');
    } else {
      return null;
    }
  }
}

/*
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
  String? genreUrl;

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
      : super(title, videoId, lengthSeconds, author, authorId, authorUrl,
            videoThumbnails);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  @override
  VideoInList toVideoInList() {
    return VideoInList(title, videoId, lengthSeconds, viewCount, author,
        authorId, authorUrl, published, publishedText, videoThumbnails);
  }
}
*/
