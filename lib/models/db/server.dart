import 'package:objectbox/objectbox.dart';

@Entity()
class Server {
  @Id()
  int id = 0;
  @Unique(onConflict: ConflictStrategy.replace)
  String url;
  String? authToken;

  Server(this.url);
}
