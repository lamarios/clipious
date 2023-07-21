import 'package:objectbox/objectbox.dart';

@Entity()
class DownloadedVideo {
  @Id()
  int id = 0;

  String videoId;

  String title;
  String author;
  String authorUrl;
  bool downloadComplete;

  DownloadedVideo({this.id = 0, required this.videoId, required this.title, required this.author, required this.authorUrl, this.downloadComplete = false});
}
