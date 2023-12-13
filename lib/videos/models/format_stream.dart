import 'package:json_annotation/json_annotation.dart';

part 'format_stream.g.dart';

@JsonSerializable()
class FormatStream {
  String url;
  String itag;
  String type;
  String quality;
  String container;
  String encoding;
  String qualityLabel;
  String resolution;
  String size;

  FormatStream(this.url, this.itag, this.type, this.quality, this.container,
      this.encoding, this.qualityLabel, this.resolution, this.size);

  factory FormatStream.fromJson(Map<String, dynamic> json) =>
      _$FormatStreamFromJson(json);

  Map<String, dynamic> toJson() => _$FormatStreamToJson(this);
}
