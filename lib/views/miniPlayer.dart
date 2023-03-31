import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/videoPlayer/fullScreenView.dart';
import 'package:invidious/views/videoPlayer/miniPlayerView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MiniPlayer extends StatelessWidget {
  GlobalKey playerKey = GlobalKey();

  MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    ColorScheme colors = themeData.colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    return GetBuilder<MiniPlayerController>(
      init: MiniPlayerController(),
      builder: (_) {
        bool showPlayer = _.videos.length > _.currentIndex;

        Widget videoPlayer = showPlayer
            ? GestureDetector(
                key: const ValueKey('player'),
                onVerticalDragEnd: _.videoDraggedDownEnd,
                onVerticalDragUpdate: _.videoDraggedDown,
                child: Padding(
                  padding: _.isMini || _.isPip ? EdgeInsets.zero : const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: VideoPlayer(
                    video: _.videos[_.currentIndex],
                    miniPlayer: false,
                  ),
                ),
              )
            : const SizedBox.shrink();

        List<Widget> miniPlayerWidgets = [];

        List<Widget> bigPlayerWidgets = [];

        if (showPlayer) {
          miniPlayerWidgets.addAll(MiniPlayerView.build(context, _));
          bigPlayerWidgets.addAll(VideoPlayerFullScreenView.build(context, _));
        }

        return AnimatedPositioned(
          left: 0,
          top: _.top,
          bottom: _.getBottom,
          right: 0,
          duration: _.isDragging ? Duration.zero : animationDuration ~/ 2,
          child: Material(
            elevation: 5,
            child: showPlayer
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _.isMini || _.isPip
                          ? const SizedBox.shrink()
                          : AppBar(
                              title: Text(locals.videoPlayer),
                              elevation: 1,
                              leading: IconButton(
                                icon: const Icon(Icons.arrow_downward),
                                onPressed: _.showMiniPlayer,
                              ),
                            ),
                      AnimatedContainer(
                        width: double.infinity,
                        color: _.isMini ? colors.secondaryContainer : colors.background,
                        constraints: BoxConstraints(maxHeight: _.isMini ? targetHeight : 500),
                        duration: animationDuration ~/ 2,
                        child: Row(
                          mainAxisAlignment: _.isMini ? MainAxisAlignment.start : MainAxisAlignment.center,
                          children: [Expanded(flex: 1, child: videoPlayer ?? const SizedBox.shrink()), ...miniPlayerWidgets],
                        ),
                      ),
                      ...bigPlayerWidgets,
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
