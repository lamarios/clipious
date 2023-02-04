import 'package:json_annotation/json_annotation.dart';

part 'videoThumbnail.g.dart';

@JsonSerializable()
class VideoThumbnail {
  String quality;
  String url;
  int width;
  int height;

  VideoThumbnail(this.quality, this.url, this.width, this.height);

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => _$VideoThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$VideoThumbnailToJson(this);
}
