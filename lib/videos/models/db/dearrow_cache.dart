import 'package:json_annotation/json_annotation.dart';

part 'dearrow_cache.g.dart';

@JsonSerializable()
class DeArrowCache {
  String videoId;
  String? title;
  String? url;

  DeArrowCache(this.videoId);

  factory DeArrowCache.fromJson(Map<String, dynamic> json) =>
      _$DeArrowCacheFromJson(json);

  Map<String, dynamic> toJson() => _$DeArrowCacheToJson(this);
}
