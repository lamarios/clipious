import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'server.g.dart';

@obox.Entity()
@CopyWith()
@JsonSerializable()
class Server {
  @JsonKey(includeFromJson: false, includeToJson: false)
  @obox.Id()
  int id = -1;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  String url;
  String? authToken;
  String? sidCookie;

  @obox.Transient()
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? ping;

  @obox.Transient()
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? flag;

  @obox.Transient()
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? region;

  bool inUse;

  Server(
      {required this.url,
      this.authToken,
      this.sidCookie,
      this.ping,
      this.flag,
      this.region,
      this.inUse = false});

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

  Map<String, dynamic> toJson() => _$ServerToJson(this);
}
