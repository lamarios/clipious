import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/tvVideoView.dart';

import '../../globals.dart';
import '../../models/imageObject.dart';
import '../../models/videoInList.dart';
import '../components/videoThumbnail.dart';

class TvVideoItem extends StatelessWidget {
  final VideoInList video;
  final bool autoFocus;
  final Function(BuildContext context, VideoInList video)? onSelect;

  const TvVideoItem({Key? key, required this.video, required this.autoFocus, this.onSelect}) : super(key: key);

  openVideo(BuildContext context, VideoInList e, FocusNode node, KeyEvent event) {
    if (onSelect != null) {
      onSelect!(context, e);
      return KeyEventResult.handled;
    } else if (event is KeyUpEvent && (event.logicalKey == LogicalKeyboardKey.enter || event.logicalKey == LogicalKeyboardKey.select)) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TvVideoView(videoId: e.videoId)));
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTextStyle(
      style: textTheme.bodyLarge!,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Focus(
            // onFocusChange: (value) => _.focusChanged(value, index),
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
                        color: hasFocus ? colors.primaryContainer : colors.background,
                      ),
                      duration: animationDuration,
                      child: AspectRatio(
                        aspectRatio: 16 / 13,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            VideoThumbnailView(videoId: video.videoId, thumbnailUrl: ImageObject.getBestThumbnail(video.videoThumbnails)?.url ?? ''),
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
    );
  }
}
