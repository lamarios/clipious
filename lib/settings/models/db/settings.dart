import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'settings.g.dart';

@Entity()
@JsonSerializable()
class SettingsValue {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String name;

  String value;

  SettingsValue(this.name, this.value);

  factory SettingsValue.fromJson(Map<String, dynamic> json) => _$SettingsValueFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsValueToJson(this);
}
