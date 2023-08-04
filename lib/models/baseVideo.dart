import 'package:json_annotation/json_annotation.dart';

import 'db/server.dart';
import 'db/videoFilter.dart';
import 'imageObject.dart';
import 'interfaces/sharelink.dart';

abstract class IdedVideo {
  String videoId;

  IdedVideo(this.videoId);
}

abstract class BaseVideo extends IdedVideo implements ShareLinks {
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

  BaseVideo(this.title, String videoId, this.lengthSeconds, this.author, this.authorId, this.authorUrl, this.videoThumbnails) : super(videoId);

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
}
