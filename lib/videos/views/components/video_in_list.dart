import 'package:animate_to/animate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/videos/states/video_in_list.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/components/video_thumbnail.dart';
import 'package:invidious/videos/views/components/video_modal_sheet.dart';
import 'package:logging/logging.dart';

import '../../../downloads/states/download_manager.dart';
import '../../../utils/models/image_object.dart';
import '../../../utils.dart';
import '../../models/base_video.dart';
import '../screens/video.dart';
import 'video_metrics.dart';

class VideoListItem extends StatelessWidget {
  final VideoInList video;
  final bool animateDownload;

  VideoListItem({super.key, required this.video, this.animateDownload = false});

  final log = Logger('VideoInList');

  openVideo(BuildContext context) {
    var cubit = context.read<VideoInListCubit>();
    if (cubit.state.video.filtered) {
      cubit.showVideoDetails();
    } else {
      navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_VIDEO, builder: (context) => VideoView(videoId: video.videoId)));
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    var textTheme = Theme.of(context).textTheme;

    TextStyle filterStyle = (textTheme.bodySmall ?? const TextStyle()).copyWith(color: colorScheme.secondary.withOpacity(0.7));
    var downloadManager = context.read<DownloadManagerCubit>();

    var widget = BlocProvider(
      create: (context) => VideoInListCubit(VideoInListState(video)),
      child: BlocBuilder<VideoInListCubit, VideoInListState>(
        builder: (context, _) => BlocListener<PlayerCubit, PlayerState>(
          listenWhen: (previous, current) => current.currentlyPlaying?.videoId == video.videoId && previous.position != current.position,
          listener: (context, state) => context.read<VideoInListCubit>().updateProgress(),
          child: InkWell(
            onTap: () => openVideo(context),
            onLongPress: _.video.filtered ? null : () => VideoModalSheet.showVideoModalSheet(context, video, animateDownload: animateDownload),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _.video.filtered
                    ? AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                locals.videoFiltered,
                                style: filterStyle,
                              ),
                              ...video.matchedFilters
                                  .map((e) => Text(
                                        e.localizedLabel(locals),
                                        style: filterStyle,
                                      ))
                                  .toList(growable: false),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  locals.videoFilterTapToReveal,
                                  style: filterStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : VideoThumbnailView(
                        videoId: video.videoId,
                        thumbnailUrl: ImageObject.getBestThumbnail(video.videoThumbnails)?.url ?? '',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                                      child: AnimatedOpacity(
                                        duration: animationDuration,
                                        opacity: _.progress > 0.1 ? 1 : 0,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          width: double.infinity,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: colorScheme.secondaryContainer,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: AnimatedFractionallySizedBox(
                                              widthFactor: _.progress > 0 ? _.progress : 0,
                                              heightFactor: 1,
                                              duration: const Duration(milliseconds: 750),
                                              curve: Curves.easeInOutQuad,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: colorScheme.primary,
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: video.lengthSeconds > 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.75), borderRadius: BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            prettyDuration(Duration(seconds: video.lengthSeconds)),
                                            style: textTheme.bodySmall?.copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _.video.filtered ? '**********' : video.title,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.normal),
                          ),
                          Visibility(
                            child: InkWell(
                              onTap: () {
                                log.fine('Opening channel ${video.authorId}');
                                navigatorKey.currentState?.pushNamed(PATH_CHANNEL, arguments: video.authorId);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    video.author ?? '',
                                    style: TextStyle(color: colorScheme.secondary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VideoMetrics(
                            viewCount: video.viewCount,
                            publishedText: video.publishedText,
                            style: textTheme.bodySmall,
                            iconSize: 13,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: _.video.filtered ? null : () => VideoModalSheet.showVideoModalSheet(context, video, animateDownload: animateDownload),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.more_vert),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return animateDownload
        ? AnimateFrom<BaseVideo>(
            value: video,
            builder: (context, child, animation) {
              /// You can build your animation inside this builder
              ///
              /// By default I'm using a TweenSequanceto scale up then
              /// Start scaling down at the middle of the animation
              return ScaleTransition(
                scale: TweenSequence<double>([
                  TweenSequenceItem<double>(
                    tween: Tween(begin: 1, end: 1.1),
                    weight: 50,
                  ),
                  TweenSequenceItem<double>(
                    tween: Tween(begin: 1.1, end: .2),
                    weight: 50,
                  ),
                ]).animate(animation),
                child: child,
              );
            },
            key: downloadManager.state.animateToController.tag('video-animate-to-${video.videoId}') ?? GlobalKey(),
            child: widget,
          )
        : widget;
  }
}
