import 'package:objectbox/objectbox.dart';

@Entity()
class Server {
  @Id()
  int id = -1;
  @Unique(onConflict: ConflictStrategy.replace)
  String url;
  String? authToken;

  @Transient()
  Duration? ping;

  bool inUse = false;

  Server(this.url);
}
