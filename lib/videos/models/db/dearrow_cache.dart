import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'dearrow_cache.g.dart';

@obox.Entity()
@collection
class DeArrowCache {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  @Index(unique: true, replace: true)
  String videoId;
  String? title;
  String? url;

  DeArrowCache(this.videoId);
}
