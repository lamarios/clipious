import 'package:json_annotation/json_annotation.dart';

part 'app_logs.g.dart';

@JsonSerializable()
class AppLog {
  // will be the key on sembast, we don't need to store it as data
  @JsonKey(includeFromJson: false, includeToJson: false)
  String uuid = '';

  String level;
  String logger;

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
