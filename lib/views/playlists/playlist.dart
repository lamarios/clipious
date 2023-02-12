import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/playlistView.dart';

class PlaylistItem extends StatelessWidget {
  final Playlist playlist;

  const PlaylistItem({super.key, required this.playlist});

  openPlayList(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistView(playlist: playlist,)));
  }


  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme
        .of(context)
        .colorScheme;

    List<Widget> thumbs = [];

    for (int i = 0; i < 3; i++) {
      // for (VideoInList video in playlist.videos) {
      thumbs.add(Positioned(
        top: (10 * i).toDouble(),
        left: (15 * i).toDouble(),
        child: SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Opacity(
              opacity: 1 - (0.3 * i),
              child: playlist.videos.length > i ? VideoThumbnailView(
                videoId: playlist.videos[i].videoId,
                thumbnailUrl: ImageObject
                    .getBestThumbnail(playlist.videos[i].videoThumbnails)
                    ?.url ?? '',
              ): Container(decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),),
            ),
          ),
        ),
      ));
    }

    thumbs = thumbs.reversed.toList();


    return GestureDetector(
      onTap: () => openPlayList(context),
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 200,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: thumbs,
                      ),
                    )),
                Expanded(child: Text(playlist.title, style: TextStyle(color: colors.primary),)),
                Text('${playlist.videoCount} videos'),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
