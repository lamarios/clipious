import '../../settings/models/db/server.dart';

abstract class ShareLinks {
  Uri getYoutubeLink(int? timestamp);

  Uri getInvidiousLink(Server server, int? timestamp);

  Uri getRedirectLink(int? timestamp);
}
