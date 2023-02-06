import 'package:json_annotation/json_annotation.dart';

import 'videoThumbnail.dart';

part 'videoInList.g.dart';

@JsonSerializable()
class VideoInList {
  String title;
  String videoId;
  int lengthSeconds;
  int viewCount;
  String author;
  String authorId;
  String authorUrl;

  int published;
  String publishedText;
  List<VideoThumbnail> videoThumbnails;

  VideoInList(this.title,  this.videoId, this.lengthSeconds, this.viewCount, this.author, this.authorId, this.authorUrl, this.published, this.publishedText, this.videoThumbnails);

  VideoThumbnail? getBestThumbnail() {
    if (videoThumbnails != null && videoThumbnails.length > 0) {
      videoThumbnails.sort((a, b) {
        return (b.width * b.height).compareTo(a.width * a.height);
      });

      return videoThumbnails[0];
    } else {
      return null;
    }
  }

  factory VideoInList.fromJson(Map<String, dynamic> json) => _$VideoInListFromJson(json);

  Map<String, dynamic> toJson() => _$VideoInListToJson(this);
}
