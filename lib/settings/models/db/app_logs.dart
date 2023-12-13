import 'package:objectbox/objectbox.dart';

@Entity()
class AppLog {
  @Id()
  int id = 0;

  String level;
  String logger;

  @Property(type: PropertyType.date)
  DateTime time;

  String? stacktrace;
  String? message;

  AppLog(
      {required this.level,
      required this.logger,
      required this.time,
      this.message,
      this.stacktrace});
}
