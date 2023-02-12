import 'package:invidious/models/invidiousServerStats.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invidiousPublicServer.g.dart';

@JsonSerializable()
class InvidiousPublicServer {
  InvidiousServerStats stats;

  InvidiousPublicServer(this.stats);


  factory InvidiousPublicServer.fromJson(Map<String, dynamic> json) => _$InvidiousPublicServerFromJson(json);

  Map<String, dynamic> toJson() => _$InvidiousPublicServerToJson(this);
}