import 'package:objectbox/objectbox.dart';

@Entity()
class SearchHistoryItem {
  @Id()
  int id = 0;
  @Unique(onConflict: ConflictStrategy.replace)
  String search;
  int time;

  SearchHistoryItem(this.search, this.time);
}
