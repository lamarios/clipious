import 'package:objectbox/objectbox.dart';

@Entity()
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

  bool inUse = false;

  Server(this.url);
}
