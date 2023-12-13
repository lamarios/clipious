import 'package:invidious/settings/models/invidious_server_stats.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invidious_public_server.g.dart';

@JsonSerializable()
class InvidiousPublicServer {
  InvidiousServerStats? stats;
  bool? api;
  String uri;
  String flag;
  String region;

  InvidiousPublicServer(this.stats, this.api, this.uri, this.flag, this.region);

  factory InvidiousPublicServer.fromJson(Map<String, dynamic> json) =>
      _$InvidiousPublicServerFromJson(json);

  Map<String, dynamic> toJson() => _$InvidiousPublicServerToJson(this);
}
