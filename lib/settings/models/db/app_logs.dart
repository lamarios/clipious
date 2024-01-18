import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'app_logs.g.dart';

@obox.Entity()
@JsonSerializable()
class AppLog {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  String level;
  String logger;

  @obox.Property(type: obox.PropertyType.date)
  DateTime time;

  String? stacktrace;
  String? message;

  AppLog(
      {required this.level,
      required this.logger,
      required this.time,
      this.message,
      this.stacktrace});

  factory AppLog.fromJson(Map<String, dynamic> json) => _$AppLogFromJson(json);

  Map<String, dynamic> toJson() => _$AppLogToJson(this);
}
