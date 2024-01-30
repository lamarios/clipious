import 'package:json_annotation/json_annotation.dart';

part 'progress.g.dart';

@JsonSerializable()
class Progress {
  double progress = 0;

  String videoId;

  Progress(this.progress, this.videoId);

  Progress.named({required this.progress, required this.videoId});

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressToJson(this);
}
