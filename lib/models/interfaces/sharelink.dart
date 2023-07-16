import '../db/server.dart';

abstract class ShareLinks {
  String getYoutubeLink(bool isAddTimestamp);
  String getInvidiousLink(Server server, bool isAddTimestamp);
  String getRedirectLink(bool isAddTimestamp);
}
