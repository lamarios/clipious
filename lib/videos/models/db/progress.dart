import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'progress.g.dart';

@obox.Entity()
@collection
class Progress {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  double progress = 0;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  @Index(unique: true, replace: true)
  String videoId;

  Progress(this.progress, this.videoId);

  Progress.named({required this.progress, required this.videoId});
}
