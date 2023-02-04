import 'package:json_annotation/json_annotation.dart';

part 'authorThumbnail.g.dart';

@JsonSerializable()
class AuthorThumbnail {
  String url;
  int width;
  int height;

  AuthorThumbnail(this.url, this.width, this.height);


  factory AuthorThumbnail.fromJson(Map<String, dynamic> json) => _$AuthorThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorThumbnailToJson(this);
}
