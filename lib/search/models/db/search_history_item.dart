import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'search_history_item.g.dart';

@obox.Entity()
@collection
class SearchHistoryItem {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  @Index(unique: true, replace: true)
  String search;

  @Index()
  int time;

  SearchHistoryItem(this.search, this.time);
}
