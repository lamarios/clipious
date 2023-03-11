import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/playlistView.dart';

class PlaylistItem extends StatefulWidget {
  final Playlist playlist;
  final bool canDeleteVideos;

  const PlaylistItem({super.key, required this.playlist, required this.canDeleteVideos});

  @override
  State<PlaylistItem> createState() => _PlaylistItemState();
}

class _PlaylistItemState extends State<PlaylistItem> with AfterLayoutMixin<PlaylistItem> {
  List<VideoInList> videos = [];

  openPlayList(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: ROUTE_PLAYLIST,
            builder: (context) => PlaylistView(
                  playlist: widget.playlist,
                  canDeleteVideos: widget.canDeleteVideos,
                )));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    List<Widget> thumbs = [];
    List<VideoInList> videosToUse = videos.isNotEmpty ? videos : widget.playlist.videos;

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
              child: videosToUse.length > i
                  ? VideoThumbnailView(
                      cacheKey: 'v-worst/${videosToUse[i].videoId}',
                      videoId: videosToUse[i].videoId,
                      thumbnailUrl: ImageObject.getWorstThumbnail(videosToUse[i].videoThumbnails)?.url ?? '',
                    )
                  : Container(
                      decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                    ),
            ),
          ),
        ),
      ));
    }

    thumbs = thumbs.reversed.toList();

    return InkWell(
      onTap: () => openPlayList(context),
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
                Expanded(
                    child: Text(
                  widget.playlist.title,
                  style: TextStyle(color: colors.primary),
                )),
                Text(locals.nVideos(widget.playlist.videoCount)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getThumbnailsFromYoutube(BuildContext context) async {
    if (widget.playlist.videoCount > 0 && widget.playlist.videos.length < widget.playlist.videoCount) {
      // something is not right, let's get the full playlist
      Playlist playlist = await service.getPublicPlaylists(widget.playlist.playlistId);
      if (context.mounted) {
        setState(() {
          videos = playlist.videos;
        });
      }
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    getThumbnailsFromYoutube(context);
  }
}
