/*
{
    "title": String,
    "playlistId": String,

    "author": String,
    "authorId": String,
    "authorThumbnails": [
        {
            "url": String,
            "width": String,
            "height": String
        }
    ],
    "description": String,
    "descriptionHtml": String,

    "videoCount": Int32,
    "viewCount": Int64,
    "updated": Int64,

    "videos": [
        {
          "title": String,
          "videoId": String,
          "author": String,
          "authorId": String,
          "authorUrl": String,

          "videoThumbnails": [
              {
                  "quality": String,
                  "url": String,
                  "width": Int32,
                  "height": Int32
              }
          ],
          "index": Int32,
          "lengthSeconds": Int32
        }
    ]
}

{
        "type": "invidiousPlaylist",
        "title": String,
        "playlistId": String,
        "author": String,
        "authorId": null,
        "authorUrl": null,
        "authorThumbnails": [],
        "description": String,
        "descriptionHtml": String,
        "videoCount": Int32,
        "viewCount": 0,
        "updated": Int64,
        "isListed": Boolean,
        "videos": [
            {
                "title": String,
                "videoId": String,
                "author": String,
                "authorId": String,
                "authorUrl": String,
                "videoThumbnails": [
                    {
                        "quality": String,
                        "url": String,
                        "width": Int32,
                        "height": Int32
                    }
                ],
                "index": Int32,
                "indexId": String,
                "lengthSeconds": Int32
            }
        ]
    }
 */

import 'package:clipious/videos/models/video.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/models/image_object.dart';

part 'playlist.freezed.dart';

part 'playlist.g.dart';

const youtubePlaylist = "youtubePlayList";
const invidiousPlaylist = "invidiousPlaylist";

@freezed
sealed class Playlist with _$Playlist {
  const factory Playlist(
      {@Default(youtubePlaylist) String type,
      required String title,
      required String playlistId,
      required String author,
      String? authordId,
      String? authorUrl,
      @Default([]) List<ImageObject> authorThumbnails,
      String? description,
      required int videoCount,
      int? viewCount,
      bool? isListed,
      int? updated,
      @Default([]) List<Video> videos,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @Default(0)
      int removedByFilter}) = _Playlist;

  factory Playlist.fromJson(Map<String, Object?> json) =>
      _$PlaylistFromJson(json);
}

/*
@JsonSerializable()
@CopyWith(constructor: "_")
class Playlist {
  String type = youtubePlaylist;
  String title;
  String playlistId;
  String author;
  String? authordId;
  String? authorUrl;
  List<ImageObject>? authorThumbnails;
  String? description;
  int videoCount;
  int? viewCount;
  bool? isListed;
  int? updated;
  List<VideoInList> videos = [];

  Playlist(this.type, this.title, this.playlistId, this.author, this.authordId,
      this.authorUrl, this.description, this.videoCount);

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  Playlist._(
      this.type,
      this.title,
      this.playlistId,
      this.author,
      this.authordId,
      this.authorUrl,
      this.authorThumbnails,
      this.description,
      this.videoCount,
      this.viewCount,
      this.isListed,
      this.updated,
      this.videos,
      this.removedByFilter);
}
*/
