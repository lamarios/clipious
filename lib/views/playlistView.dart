import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video.dart';

import '../globals.dart';
import '../models/playlist.dart';
import '../models/video.dart';

class PlaylistView extends StatefulWidget {
  final Playlist playlist;

  const PlaylistView({super.key, required this.playlist});

  @override
  State<PlaylistView> createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  bool playingVideo = false;
  bool loadingStream = false;
  BetterPlayerController? videoController;
  List<BetterPlayerDataSource> videoSources = [];

  Future<List<BetterPlayerDataSource>> createDataSet() async {
    List<BetterPlayerDataSource> dataSourceList = [];
    String baseUrl = db.getCurrentlySelectedServer().url;
    for (VideoInList video in widget.playlist.videos) {
      Video v = await service.getVideo(video.videoId);
      dataSourceList.add(BetterPlayerDataSource(BetterPlayerDataSourceType.network, v.dashUrl,
          videoFormat: BetterPlayerVideoFormat.dash,
          subtitles: v.captions.map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['${baseUrl}${s.url}'], name: s.label)).toList(),
          notificationConfiguration:
              BetterPlayerNotificationConfiguration(showNotification: true, activityName: 'MainActivity', title: v.title, author: v.author, imageUrl: v.getBestThumbnail()?.url ?? '')));
    }

    return dataSourceList;
  }

  playVideo(BuildContext context) async {
    setState(() {
      loadingStream = true;
    });
    List<BetterPlayerDataSource> videos = await createDataSet();
    setState(() {
      videoSources = videos;
    });

    setState(() {
      playingVideo = true;
      loadingStream = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    VideoInList? firstVideo = widget.playlist.videos.isNotEmpty ? widget.playlist.videos[0] : null;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.playlist.title,
          ),
          scrolledUnderElevation: 0,
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
            bottom: false,
            child: widget.playlist.videos.isNotEmpty
                ? Column(
                    children: [
                      AnimatedSwitcher(
                          duration: animationDuration,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                VideoThumbnailView(
                                  videoId: firstVideo!.videoId,
                                  thumbnailUrl: ImageObject.getBestThumbnail(firstVideo.videoThumbnails)?.url ?? '',
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: AnimatedSwitcher(
                                        duration: animationDuration,
                                        child: !playingVideo
                                            ? loadingStream
                                                ? const CircularProgressIndicator()
                                                : GestureDetector(
                                                    key: const ValueKey('nt-playing'),
                                                    onTap: () => playVideo(context),
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      color: colorScheme.primary,
                                                      size: 100,
                                                    ),
                                                  )
                                            : BetterPlayerPlaylist(
                                                betterPlayerDataSourceList: videoSources,
                                                betterPlayerConfiguration: const BetterPlayerConfiguration(aspectRatio: 16 / 9, fit: BoxFit.contain, autoPlay: true),
                                                betterPlayerPlaylistConfiguration: const BetterPlayerPlaylistConfiguration(loopVideos: true, nextVideoDelay: Duration(seconds: 1)),
                                              )),
                                  ),
                                )
                              ]))),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: widget.playlist.videos
                              .map((v) => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SizedBox(
                                              width: 100,
                                              child: VideoThumbnailView(
                                                videoId: v.videoId,
                                                thumbnailUrl: ImageObject.getBestThumbnail(v.videoThumbnails)?.url ?? '',
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  v.title,
                                                  style: TextStyle(color: colorScheme.primary),
                                                ),
                                                Text(
                                                  v.author,
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            behavior: HitTestBehavior.translucent,
                                            onTap: () => openVideo(context, v.videoId),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.exit_to_app,
                                                color: colorScheme.primary,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  ))
                              .toList(),
                        ),
                      ))
                    ],
                  )
                : Container(alignment: Alignment.center,child: Text('No videos in this playlist.'))));
  }

  openVideo(BuildContext context, String videoId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoView(
                  videoId: videoId,
                )));
  }
}
