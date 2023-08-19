import 'package:json_annotation/json_annotation.dart';

part 'image_object.g.dart';

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

  static ImageObject? getWorstThumbnail(List<ImageObject>? images) {
    if (images != null && images.isNotEmpty) {
      images.sort((a, b) {
        return (a.width * a.height).compareTo(b.width * b.height);
      });

      return images[0];
    } else {
      return null;
    }
  }
}
