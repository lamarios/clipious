import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/playlists/views/components/playlist_thumbnail.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/models/paginated_list.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/components/video_list.dart';

import '../../../globals.dart';
import '../../../videos/views/components/add_to_queue_button.dart';
import '../../../videos/views/components/play_button.dart';
import '../../states/playlist.dart';

class TabletPlaylistInnerView extends StatelessWidget {
  final bool canDeleteVideos;
  final Function(BuildContext context, VideoInList video)
      removeVideoFromPlaylist;
  final Function(BuildContext context, String videoId) openVideo;

  const TabletPlaylistInnerView(
      {super.key,
      required this.canDeleteVideos,
      required this.removeVideoFromPlaylist,
      required this.openVideo});

  void showVideoModalSheet(BuildContext parentContext, VideoInList video) {
    showModalBottomSheet<void>(
        context: parentContext,
        showDragHandle: true,
        builder: (BuildContext context) {
          var locals = AppLocalizations.of(context)!;
          return FractionallySizedBox(
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton.filledTonal(
                            onPressed: () async {
                              await removeVideoFromPlaylist(
                                  parentContext, video);
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            },
                            icon: const Icon(Icons.delete)),
                        Text(locals.removeFromPlayList)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return OrientationBuilder(builder: (context, widgetOrientation) {
      final deviceOrientation = getOrientation();
      return BlocBuilder<PlaylistCubit, PlaylistState>(
          builder: (context, playlistState) {
        final cubit = context.read<PlaylistCubit>();
        final videos = playlistState.playlist.videos
            .where((element) => !element.filterHide)
            .toList();

        return Row(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: deviceOrientation == Orientation.landscape
                            ? 375
                            : 275,
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
                                            colors.background.withOpacity(0.5),
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
                                    onPressed: (isAudio) => cubit.play(isAudio),
                                  ),
                                  Builder(builder: (context) {
                                    return Positioned(
                                        right: 5,
                                        bottom: 3,
                                        child: AddToQueueButton(
                                          videos: playlistState.playlist.videos,
                                        ));
                                  })
                                ],
                        ),
                      )
                    ])),
            if (playlistState.loading)
              Expanded(
                  child: VideoGridPlaceHolder(
                      scrollController: cubit.scrollController)),
            if (!playlistState.loading)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: innerHorizontalPadding),
                  child: VideoList(
                    paginatedVideoList: FixedItemList(videos),
                    showMetrics: false,
                    showVideoModalSheet: showVideoModalSheet,
                    allowModalSheet: canDeleteVideos,
                    openVideoOverride: (context, video) =>
                        openVideo(context, video.videoId),
                  ),
                ),
              )
          ],
        );
      });
    });
  }
}
