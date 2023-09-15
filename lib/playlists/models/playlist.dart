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

import 'package:invidious/videos/models/video_in_list.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/models/image_object.dart';

part 'playlist.g.dart';

const YOUTUBE_PLAYLIST = "youtubePlayList";
const INVIDIOUS_PLAYLIST = "invidiousPlaylist";

@JsonSerializable()
class Playlist {
  String type = YOUTUBE_PLAYLIST;
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

  @JsonKey(includeToJson: false, includeFromJson: false)
  int removedByFilter = 0;

  Playlist(this.type, this.title, this.playlistId, this.author, this.authordId, this.authorUrl, this.description,
      this.videoCount);

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
