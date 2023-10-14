import 'package:objectbox/objectbox.dart';

@Entity()
class DeArrowCache {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String videoId;
  String? title;
  String? url;

  DeArrowCache(this.videoId);
}
