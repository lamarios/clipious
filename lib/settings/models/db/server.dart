import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:objectbox/objectbox.dart';

part 'server.g.dart';

@Entity()
@CopyWith()
class Server {
  @Id()
  int id = -1;
  @Unique(onConflict: ConflictStrategy.replace)
  String url;
  String? authToken;
  String? sidCookie;

  @Transient()
  Duration? ping;

  @Transient()
  String? flag;
  @Transient()
  String? region;

  bool inUse;

  Server({required this.url, this.authToken, this.sidCookie, this.ping, this.flag, this.region, this.inUse = false});
}
