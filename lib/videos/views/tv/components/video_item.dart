import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/router.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/videos/states/video_in_list.dart';

import '../../../../globals.dart';
import '../../../../utils/models/image_object.dart';
import '../../../models/video_in_list.dart';
import '../../components/video_thumbnail.dart';

class TvVideoItem extends StatelessWidget {
  final VideoInList video;
  final bool autoFocus;
  final void Function(bool focus)? onFocusChange;
  final Function(BuildContext context, VideoInList video)? onSelect;

  const TvVideoItem(
      {super.key,
      required this.video,
      required this.autoFocus,
      this.onSelect,
      this.onFocusChange});

  openVideo(
      BuildContext context, VideoInList e, FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent &&
        isOk(event.logicalKey, physicalKeyboardKey: event.physicalKey)) {
      if (e.filtered) {
        var cubit = context.read<VideoInListCubit>();
        cubit.showVideoDetails();
        return KeyEventResult.handled;
      }
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
    var locals = AppLocalizations.of(context)!;
    TextStyle filterStyle = (textTheme.bodySmall ?? const TextStyle())
        .copyWith(color: colors.secondary.withOpacity(0.7));

    return BlocProvider(
      create: (context) =>
          VideoInListCubit(VideoInListState(video: video, offlineVideo: null)),
      child: BlocBuilder<VideoInListCubit, VideoInListState>(
        builder: (context, state) => DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Focus(
                onFocusChange: onFocusChange,
                onKeyEvent: (node, event) => openVideo(
                    context, state.video!.toVideoInList(), node, event),
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
                            color: colors.primaryContainer
                                .withOpacity(hasFocus ? 1 : 0),
                          ),
                          duration: animationDuration,
                          child: AspectRatio(
                            aspectRatio: 16 / 13,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                (state.video?.filtered ?? false)
                                    ? AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colors.secondaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                locals.videoFiltered,
                                                style: filterStyle,
                                              ),
                                              ...video.matchedFilters
                                                  .map((e) => Text(
                                                        e.localizedLabel(
                                                            locals, context),
                                                        style: filterStyle,
                                                      )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16.0),
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
                                        thumbnailUrl:
                                            video.deArrowThumbnailUrl ??
                                                ImageObject.getBestThumbnail(
                                                        video.videoThumbnails)
                                                    ?.url ??
                                                '',
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.bottomRight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (state.progress > 0.05 &&
                                                    state.progress < 1)
                                                  Expanded(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      height: 5,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: colors
                                                            .secondaryContainer,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child:
                                                          FractionallySizedBox(
                                                        widthFactor:
                                                            state.progress,
                                                        heightFactor: 1,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: state.progress ==
                                                                    1
                                                                ? colors
                                                                    .primaryContainer
                                                                : colors
                                                                    .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (state.progress == 1)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: colors
                                                            .primaryContainer,
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      Icons.check,
                                                      size: 15,
                                                      color: colors.primary,
                                                    ),
                                                  ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Text(
                                                      prettyDuration(Duration(
                                                          seconds: video
                                                              .lengthSeconds)),
                                                      style: textTheme.bodySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white),
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
                                    (state.video?.filtered ?? false)
                                        ? '**********'
                                        : video.title,
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
