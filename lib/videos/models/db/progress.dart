import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'progress.g.dart';

@obox.Entity()
@JsonSerializable()
class Progress {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  double progress = 0;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  String videoId;

  Progress(this.progress, this.videoId);

  Progress.named({required this.progress, required this.videoId});

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressToJson(this);
}
