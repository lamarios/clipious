import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'dearrow_cache.g.dart';

@obox.Entity()
@JsonSerializable()
class DeArrowCache {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  String videoId;
  String? title;
  String? url;

  DeArrowCache(this.videoId);

  factory DeArrowCache.fromJson(Map<String, dynamic> json) =>
      _$DeArrowCacheFromJson(json);

  Map<String, dynamic> toJson() => _$DeArrowCacheToJson(this);
}
