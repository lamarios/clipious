import '../db/server.dart';

abstract class ShareLinks{
  String getYoutubeLink();
  String getInvidiousLink(Server server);
  String getRedirectLink();
}