import 'package:json_annotation/json_annotation.dart';

part 'imageObject.g.dart';

@JsonSerializable()
class ImageObject {
  String? quality;
  String url;
  int width;
  int height;

  ImageObject(this.quality, this.url, this.width, this.height);

  factory ImageObject.fromJson(Map<String, dynamic> json) => _$ImageObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ImageObjectToJson(this);


  static ImageObject? getBestThumbnail(List<ImageObject>? images) {
    if (images != null && images.isNotEmpty) {
      images.sort((a, b) {
        return (b.width * b.height).compareTo(a.width * a.height);
      });

      return images[0];
    } else {
      return null;
    }
  }
}
