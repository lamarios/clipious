import 'package:json_annotation/json_annotation.dart';

part 'caption.g.dart';

@JsonSerializable()
class Caption {
  String label;
  String? languageCode;
  String url;

  Caption(this.label, this.languageCode, this.url);

  factory Caption.fromJson(Map<String, dynamic> json) => _$CaptionFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionToJson(this);
}
