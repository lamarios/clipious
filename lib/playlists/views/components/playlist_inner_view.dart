import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:clipious/playlists/views/components/playlist_thumbnail.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/videos/views/components/compact_video.dart';

import '../../../globals.dart';
import '../../../videos/views/components/add_to_queue_button.dart';
import '../../../videos/views/components/play_button.dart';
import '../../states/playlist.dart';

class PlaylistInnerView extends StatelessWidget {
  final bool canDeleteVideos;
  final Function(BuildContext context, Video video) removeVideoFromPlaylist;
  final Function(BuildContext context, String videoId) openVideo;
  const PlaylistInnerView(
      {super.key,
      required this.canDeleteVideos,
      required this.removeVideoFromPlaylist,
      required this.openVideo});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Builder(builder: (context) {
      final cubit = context.watch<PlaylistCubit>();
      final playlistState = cubit.state;
      return Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                          child: PlaylistThumbnails(
                            videos: playlistState.playlist.videos,
                            bestThumbnails: true,
                            children: playlistState.loading
                                ? [
                                    Center(
                                        child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color:
                                              colors.surface.withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      child: TweenAnimationBuilder(
                                        tween: Tween<double>(
                                            begin: 0,
                                            end: playlistState.loadingProgress),
                                        duration: animationDuration,
                                        curve: Curves.easeInOutQuad,
                                        builder: (context, value, child) =>
                                            CircularProgressIndicator(
                                          value: value > 0 && value < 1
                                              ? value
                                              : null,
                                        ),
                                      ),
                                    ))
                                  ]
                                : [
                                    PlayButton(
                                      onPressed: (isAudio) =>
                                          cubit.play(isAudio),
                                    ),
                                    Builder(builder: (context) {
                                      return Positioned(
                                          right: 5,
                                          bottom: 3,
                                          child: AddToQueueButton(
                                            videos:
                                                playlistState.playlist.videos,
                                          ));
                                    })
                                  ],
                          ),
                        )
                      ])),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: innerHorizontalPadding),
                child: ListView(
                  controller: cubit.scrollController,
                  children: [
                    ...playlistState.playlist.videos
                        .where((element) => !element.filterHide)
                        .map((v) => SwipeActionCell(
                            key: ValueKey('swipe-${v.videoId}'),
                            trailingActions: canDeleteVideos
                                ? [
                                    SwipeAction(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.white),
                                      performsFirstActionWithFullSwipe: true,
                                      onTap: (handler) async {
                                        await handler(true);
                                        if (context.mounted) {
                                          removeVideoFromPlaylist(context, v);
                                        }
                                      },
                                    )
                                  ]
                                : null,
                            child: CompactVideo(
                              video: v,
                              onTap: () => openVideo(context, v.videoId),
                              key: ValueKey(v.videoId),
                            ))),
                    if (playlistState.loading)
                      ...repeatWidget(() => const CompactVideoPlaceHolder(),
                          count: 5)
                  ],
                ),
              ))
            ],
          ),
        ),
      );
    });
  }
}
