import 'package:objectbox/objectbox.dart';

@Entity()
class Progress {
  @Id()
  int id = 0;

  double progress = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String videoId;

  Progress(this.id, this.progress, this.videoId);

  Progress.named({required this.progress, required this.videoId});
}
