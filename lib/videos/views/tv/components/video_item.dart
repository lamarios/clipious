import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/objectbox.g.dart';
import 'package:invidious/router.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/videos/states/video_in_list.dart';
import 'package:invidious/videos/views/tv/screens/video.dart';

import '../../../../globals.dart';
import '../../../../utils/models/image_object.dart';
import '../../../models/video_in_list.dart';
import '../../components/video_thumbnail.dart';

class TvVideoItem extends StatelessWidget {
  final VideoInList video;
  final bool autoFocus;
  final void Function(bool focus)? onFocusChange;
  final Function(BuildContext context, VideoInList video)? onSelect;

  const TvVideoItem({Key? key, required this.video, required this.autoFocus, this.onSelect, this.onFocusChange}) : super(key: key);

  openVideo(BuildContext context, VideoInList e, FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent && isOk(event.logicalKey)) {
      if (onSelect != null) {
        onSelect!(context, e);
      } else {
        AutoRouter.of(context).push(TvVideoRoute(videoId: e.videoId));
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => VideoInListCubit(VideoInListState(video: video, offlineVideo: null)),
      child: BlocBuilder<VideoInListCubit, VideoInListState>(
        builder: (context, _) => DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Focus(
                onFocusChange: onFocusChange,
                onKeyEvent: (node, event) => openVideo(context, video, node, event),
                autofocus: autoFocus,
                child: Builder(builder: (ctx) {
                  final FocusNode focusNode = Focus.of(ctx);
                  final bool hasFocus = focusNode.hasFocus;
                  return GestureDetector(
                    child: AnimatedScale(
                      curve: Curves.easeInOutQuad,
                      duration: animationDuration ~/ 2,
                      scale: hasFocus ? 1 : 0.9,
                      child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: colors.primaryContainer.withOpacity(hasFocus ? 1 : 0),
                          ),
                          duration: animationDuration,
                          child: AspectRatio(
                            aspectRatio: 16 / 13,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                VideoThumbnailView(
                                    videoId: video.videoId,
                                    thumbnailUrl: video.deArrowThumbnailUrl ?? ImageObject.getBestThumbnail(video.videoThumbnails)?.url ?? '',
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            if (_.progress > 0.05 && _.progress < 1)
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets.only(right: 8),
                                                  alignment: Alignment.centerLeft,
                                                  height: 5,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: colors.secondaryContainer,
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: FractionallySizedBox(
                                                    widthFactor: _.progress,
                                                    heightFactor: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: _.progress == 1 ? colors.primaryContainer : colors.primary,
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_.progress == 1)
                                              Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(color: colors.primaryContainer, shape: BoxShape.circle),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 15,
                                                  color: colors.primary,
                                                ),
                                              ),
                                            Container(
                                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Text(
                                                  prettyDuration(Duration(seconds: video.lengthSeconds)),
                                                  style: textTheme.bodySmall?.copyWith(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    video.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: colors.primary),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    video.author ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: colors.secondary),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                })),
          ),
        ),
      ),
    );
  }
}
