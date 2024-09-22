import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'server.freezed.dart';

part 'server.g.dart';

final _log = Logger('Server');

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

  const Server._();

  Map<String, String>? headersForUrl(String url) {
    var useHeaders = url.startsWith(this.url);
    _log.fine('need header for $url ? $useHeaders');
    return useHeaders ? customHeaders : null;
  }

  factory Server.fromJson(Map<String, Object?> json) => _$ServerFromJson(json);
}
