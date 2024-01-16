import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'settings.g.dart';

@obox.Entity()
@collection
@JsonSerializable()
class SettingsValue {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  @Index(unique: true, replace: true)
  String name;

  String value;

  SettingsValue(this.name, this.value);

  factory SettingsValue.fromJson(Map<String, dynamic> json) =>
      _$SettingsValueFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsValueToJson(this);
}
