import 'package:objectbox/objectbox.dart';

@Entity()
class SettingsValue {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String name;

  String value;

  SettingsValue(this.name, this.value);
}
