import 'package:invidious/settings/models/invidious_server_software.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invidious_server_stats.g.dart';

@JsonSerializable()
class InvidiousServerStats {
  InvidiousServerSoftware software;
  bool? openRegistrations;

  InvidiousServerStats(this.software, this.openRegistrations);

  factory InvidiousServerStats.fromJson(Map<String, dynamic> json) => _$InvidiousServerStatsFromJson(json);

  Map<String, dynamic> toJson() => _$InvidiousServerStatsToJson(this);
}
