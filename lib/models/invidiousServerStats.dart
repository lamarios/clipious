import 'package:invidious/models/invidiousServerSoftware.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invidiousServerStats.g.dart';

@JsonSerializable()
class InvidiousServerStats {
  InvidiousServerSoftware software;

  InvidiousServerStats(this.software);

  factory InvidiousServerStats.fromJson(Map<String, dynamic> json) => _$InvidiousServerStatsFromJson(json);

  Map<String, dynamic> toJson() => _$InvidiousServerStatsToJson(this);
}
