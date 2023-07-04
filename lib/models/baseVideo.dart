import 'db/server.dart';
import 'imageObject.dart';
import 'interfaces/sharelink.dart';

abstract class BaseVideo implements ShareLinks {
  String title;
  String videoId;
  int lengthSeconds;
  String? author;
  String? authorId;
  String? authorUrl;
  List<ImageObject> videoThumbnails;

  BaseVideo(this.title, this.videoId, this.lengthSeconds, this.author, this.authorId, this.authorUrl, this.videoThumbnails);

  @override
  String getInvidiousLink(Server server) {
    return '${server.url}/watch?v=$videoId';
  }

  @override
  String getRedirectLink() {
    return 'https://redirect.invidious.io/watch?v=$videoId';
  }

  @override
  String getYoutubeLink() {
    return 'https://www.youtube.com/watch?v=$videoId';
  }
}