import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:clipious/videos/models/video_in_list.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../settings/models/db/server.dart';
import '../../settings/models/db/video_filter.dart';
import '../../utils/models/image_object.dart';
import '../../utils/models/sharelink.dart';

part 'base_video.g.dart';

abstract class IdedVideo {
  String videoId;

  IdedVideo(this.videoId);
}

@CopyWith(constructor: '_')
class BaseVideo extends IdedVideo implements ShareLinks {
  String title;
  int lengthSeconds;
  String? author;
  String? authorId;
  String? authorUrl;
  List<ImageObject> videoThumbnails;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool filtered = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<VideoFilter> matchedFilters = [];

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool filterHide = false;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool deArrowed = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? deArrowThumbnailUrl;

  BaseVideo(this.title, String videoId, this.lengthSeconds, this.author,
      this.authorId, this.authorUrl, this.videoThumbnails)
      : super(videoId);

  BaseVideo._(
      super.videoId,
      this.title,
      this.lengthSeconds,
      this.author,
      this.authorId,
      this.authorUrl,
      this.videoThumbnails,
      this.filtered,
      this.matchedFilters,
      this.filterHide,
      this.deArrowed,
      this.deArrowThumbnailUrl);

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

  VideoInList toVideoInList() {
    return VideoInList(title, videoId, lengthSeconds, 0, author, authorId,
        authorUrl, null, null, videoThumbnails)
      ..filtered = filtered;
  }
}
