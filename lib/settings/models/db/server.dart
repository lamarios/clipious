import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';
part 'server.g.dart';

@freezed
class Server with _$Server {
  const factory Server(
      {required String url,
      String? authToken,
      String? sidCookie,
      @JsonKey(includeFromJson: false, includeToJson: false) Duration? ping,
      @JsonKey(includeFromJson: false, includeToJson: false) String? flag,
      @JsonKey(includeFromJson: false, includeToJson: false) String? region,
      @Default({}) Map<String, String> customHeaders,
      @Default(false) bool inUse}) = _Server;

  factory Server.fromJson(Map<String, Object?> json) => _$ServerFromJson(json);
}
