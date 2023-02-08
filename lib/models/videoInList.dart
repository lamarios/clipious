import 'package:json_annotation/json_annotation.dart';

import 'imageObject.dart';

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
  List<ImageObject> videoThumbnails;

  VideoInList(this.title,  this.videoId, this.lengthSeconds, this.viewCount, this.author, this.authorId, this.authorUrl, this.published, this.publishedText, this.videoThumbnails);


  factory VideoInList.fromJson(Map<String, dynamic> json) => _$VideoInListFromJson(json);

  Map<String, dynamic> toJson() => _$VideoInListToJson(this);
}
