import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

@CopyWith()
@JsonSerializable()
class Server {
  String url;
  String? authToken;
  String? sidCookie;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? ping;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? flag;

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
