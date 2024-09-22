import 'package:clipious/videos/models/sponsor_segment_types.dart';
import 'package:json_annotation/json_annotation.dart';

/*

 {
    "category": "sponsor",
    "actionType": "skip",
    "segment": [
      51.565,
      72.411
    ],
    "UUID": "9750e9c93dd7271f1b52b3d0d75754e6424c873805a1d62d6779a857e40f2cee7",
    "videoDuration": 877.801,
    "locked": 1,
    "votes": 9,
    "description": ""
  },
 */
part 'sponsor_segment.g.dart';

@JsonSerializable()
class SponsorSegment {
  String actionType;
  List<double> segment;
  SponsorSegmentType category;

  SponsorSegment(this.actionType, this.segment, this.category);

  factory SponsorSegment.fromJson(Map<String, dynamic> json) =>
      _$SponsorSegmentFromJson(json);

  Map<String, dynamic> toJson() => _$SponsorSegmentToJson(this);
}
