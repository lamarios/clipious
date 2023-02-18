import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video.dart';
import 'package:invidious/views/video/player.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/playlist.dart';
import '../models/video.dart';

class PlaylistView extends StatefulWidget {
  final Playlist playlist;
  final bool canDeleteVideos;

  const PlaylistView({super.key, required this.playlist, required this.canDeleteVideos});

  @override
  State<PlaylistView> createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> with AfterLayoutMixin<PlaylistView> {
  final log = Logger('PlaylistView');
  bool playingVideo = false;
  Video? currentlyPlaying;
  int selectedIndex = 0;
  double progress = 0;
  double loadingProgress = 0;
  late Playlist playlist;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    playlist = widget.playlist;
  }

  @override
  void dispose() {
    super.dispose();
  }

  videoListener(BetterPlayerEvent event) {
    if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
      var progress = (event.parameters?['progress'] as Duration).inSeconds / (currentlyPlaying?.lengthSeconds ?? 1);
      setState(() {
        this.progress = progress;
      });
    }

    if (event.betterPlayerEventType == BetterPlayerEventType.finished) {
      playNextVideo();
    }
  }

  startVideo() async {
    if (playlist.videos.isNotEmpty) {
      if (selectedIndex < playlist.videos.length) {
        var vid = await service.getVideo(playlist.videos[selectedIndex].videoId);
        setState(() {
          playingVideo = true;
          progress = 0;
          currentlyPlaying = vid;
        });
      } else {
        setState(() {
          selectedIndex = 0;
        });
        startVideo();
      }
    }
  }

  playVideo(BuildContext context, VideoInList v) {
    int index = playlist.videos.indexWhere((element) => element.videoId == v.videoId);
    if (index >= 0) {
      setState(() {
        selectedIndex = index;
        startVideo();
      });
    }
  }

  playPreviousVideo() {
    int index = selectedIndex - 1;
    if (index < 0) {
      index = playlist.videos.length - 1;
    }

    setState(() {
      selectedIndex = index;
      startVideo();
    });
  }

  playNextVideo() {
    int index = selectedIndex + 1;
    if (index >= playlist.videos.length) {
      index = 0;
    }

    setState(() {
      selectedIndex = index;
      startVideo();
    });
  }

  deletePlayList(BuildContext context) {
    okCancelDialog(context, 'Delete Playlist ?', 'This action is irriversible', () {
      service.deleteUserPlaylist(playlist.playlistId).then((value) {
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      });
    });
  }

  removeVideoFromPlayList(BuildContext context, VideoInList v) async {
    bool playing = currentlyPlaying?.videoId == v.videoId;
    int videoCount = playlist.videos.length;
    int index = playlist.videos.indexWhere((element) => element.videoId == v.videoId);
    try {
      await service.deleteUserPlaylistVideo(playlist.playlistId, v.indexId ?? '');

      if (playing && videoCount >= 2) {
        // we have a fallback video
        playNextVideo();
        var playlist = this.playlist;
        playlist.videos.removeAt(index);
        playlist.videoCount--;

        setState(() {
          this.playlist = playlist;
        });
      } else if (videoCount >= 2) {
        var playlist = this.playlist;
        playlist.videos.removeAt(index);
        playlist.videoCount--;

        setState(() {
          this.playlist = playlist;
        });
      } else if (videoCount < 2) {
        // no more video next;
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      }
    } catch (err) {
      if (err is InvidiousServiceError) {
        showAlertDialog(context, 'Error', [Text(err.message)]);
      }
    }
  }

  showPlayListVideoDialog(BuildContext context, VideoInList v) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 100,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            removeVideoFromPlayList(context, v);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        const Text(
                          'Remove from playlist',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  openVideo(BuildContext context, String videoId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoView(
                  videoId: videoId,
                )));
  }

  getAllVideos(BuildContext context) async {
    if (widget.playlist.videoCount > 0 && widget.playlist.videos.length < widget.playlist.videoCount) {
      setState(() {
        loading = true;
      });
      int page = 1;
      List<VideoInList> videos = [];
      // something is not right, let's get the full playlist
      while (videos.length < widget.playlist.videoCount) {
        Playlist playlist = await service.getPublicPlaylists(widget.playlist.playlistId, page: page);
        videos.addAll(playlist.videos);
        page++;
        if (context.mounted) {
          setState(() {
            loadingProgress = videos.length / widget.playlist.videoCount;
          });
        }
      }

      if (context.mounted) {
        var pl = playlist;
        pl.videos = videos;
        setState(() {
          playlist = pl;
          loading = false;
          startVideo();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    bool onBigScreen = getScreenWidth() > PHONE_MAX;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            playlist.title,
          ),
          scrolledUnderElevation: 0,
          actions: [
            widget.canDeleteVideos ? GestureDetector(
              onTap: () => deletePlayList(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.delete,
                  color: colorScheme.secondary,
                ),
              ),
            ): const SizedBox.shrink()
          ],
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
            bottom: false,
            child: !loading && playlist.videos.isNotEmpty
                ? Center(
                    child: Container(
                      constraints: onBigScreen ? const BoxConstraints(maxWidth: 600) : null,
                      child: Column(
                        children: [
                          AnimatedSwitcher(
                              duration: animationDuration,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: currentlyPlaying != null
                                          ? VideoPlayer(
                                              video: currentlyPlaying!,
                                              listener: videoListener,
                                            )
                                          : SizedBox.shrink(),
                                    )
                                  ]))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: playPreviousVideo,
                                behavior: HitTestBehavior.translucent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(
                                    Icons.skip_previous,
                                    color: colorScheme.secondary,
                                    size: 50,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: playNextVideo,
                                behavior: HitTestBehavior.translucent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.skip_next, color: colorScheme.secondary, size: 50),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                              child: ListView(
                            children: playlist.videos
                                .map((v) => Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Visibility(
                                              visible: v.videoId == currentlyPlaying?.videoId,
                                              child: Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    color: colorScheme.secondaryContainer.withOpacity(0.5),
                                                    child: FractionallySizedBox(
                                                      heightFactor: 1,
                                                      widthFactor: progress,
                                                      child: Container(
                                                        color: colorScheme.primary.withOpacity(0.1),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                behavior: HitTestBehavior.translucent,
                                                onTap: () => playVideo(context, v),
                                                onLongPress: widget.canDeleteVideos ? () => showPlayListVideoDialog(context, v) : null,
                                                child: Row(
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
                                                            v.author??'',
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
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ))
                                .toList(),
                          ))
                        ],
                      ),
                    ),
                  )
                : loading
                    ? Center(
                        child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: loadingProgress),
                        duration: animationDuration,
                        curve: Curves.easeInOutQuad,
                        builder: (context, value, child) => CircularProgressIndicator(
                          value: value > 0 ? value : null,
                        ),
                      ))
                    : Container(alignment: Alignment.center, child: Text('No videos in this playlist.'))));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    startVideo();
    getAllVideos(context);
  }
}
