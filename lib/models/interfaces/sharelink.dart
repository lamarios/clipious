import '../db/server.dart';

abstract class ShareLinks {
  String getYoutubeLink(int? timestamp);

  String getInvidiousLink(Server server, int? timestamp);

  String getRedirectLink(int? timestamp);
}
