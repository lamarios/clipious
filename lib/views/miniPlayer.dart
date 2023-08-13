import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/interfaces/playerController.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/video/audioPlayer.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/videoPlayer/fullScreenView.dart';
import 'package:invidious/views/videoPlayer/miniPlayerView.dart';

import '../controllers/playerControlController.dart';
import '../utils.dart';
import 'components/videoShareButton.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    ColorScheme colors = themeData.colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    return GetBuilder<MiniPlayerController>(
      init: MiniPlayerController(),
      builder: (_) {
        bool showPlayer = _.hasVideo;
        bool onPhone = getDeviceType() == DeviceType.phone;

        Widget videoPlayer = showPlayer
            ? AnimatedCrossFade(
                crossFadeState: _.isAudio ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: animationDuration,
                firstChild: AudioPlayer(
                  key: const ValueKey('audio-player'),
                  video: _.isAudio ? _.currentlyPlaying : null,
                  offlineVideo: _.isAudio ? _.offlineCurrentlyPlaying : null,
                  miniPlayer: false,
                ),
                secondChild: VideoPlayer(
                  key: const ValueKey('player'),
                  video: !_.isAudio ? _.currentlyPlaying : null,
                  offlineVideo: !_.isAudio ? _.offlineCurrentlyPlaying : null,
                  miniPlayer: false,
                  startAt: _.startAt,
                ))
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
          duration: _.isDragging ? Duration.zero : animationDuration,
          child: AnimatedOpacity(
            opacity: _.opacity,
            duration: animationDuration,
            child: SafeArea(
              child: Material(
                elevation: 0,
                child: showPlayer
                    ? GestureDetector(

                        child: AnimatedContainer(
                          duration: animationDuration,
                          color: _.isMini ? colors.secondaryContainer : colors.background,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _.isMini || _.isPip
                                  ? const SizedBox.shrink()
                                  : AppBar(
                                      backgroundColor: colors.background,
                                      title: Text(locals.videoPlayer),
                                      elevation: 0,
                                      leading: IconButton(
                                        icon: const Icon(Icons.expand_more),
                                        onPressed: _.showMiniPlayer,
                                      ),
                                      actions: _.isHidden || _.currentlyPlaying == null
                                          ? []
                                          : [
                                              Visibility(
                                                visible: _.isPlaying,
                                                child: VideoShareButton(
                                                  video: _.currentlyPlaying!,
                                                  showTimestampOption: true,
                                                ),
                                              ),
                                            ],
                                    ),
                              AnimatedContainer(
                                width: double.infinity,
                                constraints: BoxConstraints(maxHeight: _.isMini ? targetHeight : 500, maxWidth: tabletMaxVideoWidth),
                                duration: animationDuration,
                                child: Row(
                                  mainAxisAlignment: _.isMini ? MainAxisAlignment.start : MainAxisAlignment.center,
                                  children: [Expanded(flex: 1, child: videoPlayer), ...miniPlayerWidgets],
                                ),
                              ),
                              ...bigPlayerWidgets,
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
    );
  }
}
