import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'server.g.dart';

@obox.Entity()
@CopyWith()
@collection
class Server {
  @ignore
  @obox.Id()
  int id = -1;

  @obox.Transient()
  Id isarId;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  @Index(unique: true, replace: true)
  String url;
  String? authToken;
  String? sidCookie;

  @obox.Transient()
  @ignore
  Duration? ping;

  @obox.Transient()
  @ignore
  String? flag;

  @obox.Transient()
  @ignore
  String? region;

  bool inUse;

  Server(
      {required this.url,
      this.authToken,
      this.sidCookie,
      this.ping,
      this.flag,
      this.region,
      this.isarId = Isar.autoIncrement,
      this.inUse = false});
}
