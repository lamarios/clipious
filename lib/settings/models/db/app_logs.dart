import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'app_logs.g.dart';

@obox.Entity()
@collection
class AppLog {
  @ignore
  @obox.Id()
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

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
}
