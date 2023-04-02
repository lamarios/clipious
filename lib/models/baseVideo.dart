import 'imageObject.dart';

abstract class BaseVideo{
  String title;
  String videoId;
  int lengthSeconds;
  String? author;
  String? authorId;
  String? authorUrl;
  List<ImageObject> videoThumbnails;

  BaseVideo(this.title, this.videoId, this.lengthSeconds, this.author, this.authorId, this.authorUrl, this.videoThumbnails);
}