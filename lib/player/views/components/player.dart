import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/player/views/components/audio_player.dart';
import 'package:invidious/player/views/components/expanded_player.dart';
import 'package:invidious/player/views/components/mini_player.dart';
import 'package:invidious/player/views/components/video_player.dart';
import 'package:invidious/player/views/tablet/expanded_player.dart';
import 'package:invidious/player/views/tablet/expanded_side_bar.dart';
import 'package:invidious/utils/views/components/conditional_wrap.dart';
import 'package:invidious/utils/views/components/device_widget.dart';

import '../../../utils.dart';
import '../../../videos/models/video.dart';
import '../../../videos/views/components/video_share_button.dart';

class Player extends StatelessWidget {
  final double maxHeight;

  const Player(this.maxHeight, {super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    ColorScheme colors = themeData.colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    return Builder(
      builder: (context) {
        var cubit = context.read<PlayerCubit>();

        final bool showPlayer =
            context.select((PlayerCubit value) => value.state.hasVideo);
        final double? top =
            context.select((PlayerCubit value) => value.state.top);
        final bool isMini =
            context.select((PlayerCubit value) => value.state.isMini);
        final bool isPip =
            context.select((PlayerCubit value) => value.state.isPip);
        final bool isHidden =
            context.select((PlayerCubit value) => value.state.isHidden);
        final bool isDragging =
            context.select((PlayerCubit value) => value.state.isDragging);
        final bool isClosing =
            context.select((PlayerCubit value) => value.state.isClosing);
        final Video? currentlyPlaying =
            context.select((PlayerCubit value) => value.state.currentlyPlaying);
        final FullScreenState fullScreen =
            context.select((PlayerCubit value) => value.state.fullScreenState);
        final bool isFullScreen = fullScreen == FullScreenState.fullScreen;
        final double aspectRatio =
            context.select((PlayerCubit value) => value.state.aspectRatio);
        final deviceType = getDeviceType();
        final orientation =
            context.select((PlayerCubit value) => value.state.orientation);

        Widget videoPlayer = showPlayer
            ? BlocBuilder<PlayerCubit, PlayerState>(
                buildWhen: (previous, current) =>
                    previous.isAudio != current.isAudio ||
                    previous.currentlyPlaying != current.currentlyPlaying ||
                    previous.offlineCurrentlyPlaying !=
                        current.offlineCurrentlyPlaying,
                builder: (context, _) {
                  return AspectRatio(
                    aspectRatio: isFullScreen ? aspectRatio : 16 / 9,
                    child: _.isAudio
                        ? AudioPlayer(
                            key: const ValueKey('audio-player'),
                            video: _.isAudio ? _.currentlyPlaying : null,
                            offlineVideo:
                                _.isAudio ? _.offlineCurrentlyPlaying : null,
                            miniPlayer: false,
                          )
                        : VideoPlayer(
                            key: const ValueKey('player'),
                            video: !_.isAudio ? _.currentlyPlaying : null,
                            offlineVideo:
                                !_.isAudio ? _.offlineCurrentlyPlaying : null,
                            miniPlayer: false,
                            startAt: _.startAt,
                          ),
                  );
                })
            : const SizedBox.shrink();

        return AnimatedPositioned(
          left: 0,
          top: top,
          bottom: isClosing
              ? -targetHeight
              : isFullScreen
                  ? 0
                  : isMini && isDragging && top != null
                      ? maxHeight - top - targetHeight
                      : cubit.getBottom,
          right: 0,
          duration: isDragging ? Duration.zero : animationDuration,
          curve: Curves.easeInOutQuad,
          child: AnimatedOpacity(
            duration: animationDuration,
            opacity: isClosing ? 0 : 1,
            child: AnimatedScale(
              scale: (isMini && isDragging) ? 0.8 : 1,
              duration: animationDuration,
              curve: Curves.easeInOutQuad,
              child: Material(
                elevation: 0,
                child: showPlayer
                    ? GestureDetector(
                        child: AnimatedContainer(
                          duration: animationDuration,
                          color: colors.background,
                          padding: EdgeInsets.symmetric(
                              horizontal: isMini && !isDragging ? 7 : 0),
                          child: ClipRRect(
                            borderRadius: isMini
                                ? BorderRadius.circular(10)
                                : BorderRadius.circular(0),
                            child: AnimatedContainer(
                              duration: animationDuration,
                              decoration: BoxDecoration(
                                color: isFullScreen
                                    ? Colors.black
                                    : isMini
                                        ? colors.secondaryContainer
                                        : colors.background,
                              ),
                              child: Column(
                                mainAxisSize: isMini
                                    ? MainAxisSize.min
                                    : MainAxisSize.max,
                                children: [
                                  isMini || isPip || isFullScreen
                                      ? const SizedBox.shrink()
                                      : AppBar(
                                          title: Text(locals.videoPlayer),
                                          leading: IconButton(
                                            icon: const Icon(Icons.expand_more),
                                            onPressed: cubit.showMiniPlayer,
                                          ),
                                          actions: isHidden ||
                                                  currentlyPlaying == null
                                              ? []
                                              : [
                                                  VideoShareButton(
                                                    video: currentlyPlaying,
                                                    showTimestampOption: true,
                                                  ),
                                                ],
                                        ),
                                  Flexible(
                                    fit: isMini ? FlexFit.loose : FlexFit.tight,
                                    child: AnimatedContainer(
                                      // this is just to animate the transition to mini player
                                      constraints: BoxConstraints(
                                        maxHeight: isFullScreen
                                            ? MediaQuery.of(context).size.height
                                            : isMini
                                                ? targetHeight
                                                : 500,
                                      ),
                                      duration: animationDuration,
                                      child: Row(
                                        mainAxisAlignment: isMini
                                            ? deviceType == DeviceType.tablet
                                                ? MainAxisAlignment.center
                                                : MainAxisAlignment.start
                                            : MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                              fit: isMini
                                                  ? FlexFit.loose
                                                  : FlexFit.tight,
                                              flex: deviceType ==
                                                      DeviceType.tablet
                                                  ? 2
                                                  : 1,
                                              child: Column(
                                                mainAxisSize: isMini
                                                    ? MainAxisSize.min
                                                    : MainAxisSize.max,
                                                mainAxisAlignment: isFullScreen
                                                    ? MainAxisAlignment.center
                                                    : MainAxisAlignment.start,
                                                crossAxisAlignment: isMini
                                                    ? CrossAxisAlignment.start
                                                    : CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      constraints: BoxConstraints(
                                                          maxHeight: isMini
                                                              ? targetHeight
                                                              : MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .height),
                                                      child: AnimatedScale(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          curve: Curves
                                                              .easeInOutQuad,
                                                          scale:
                                                              isMini ? 1.2 : 1,
                                                          duration:
                                                              animationDuration,
                                                          child: videoPlayer)),
                                                  if (!isFullScreen)
                                                    ConditionalWrap(
                                                        wrapIf: !isMini,
                                                        wrapper: (child) =>
                                                            Expanded(
                                                                child: child),
                                                        child: DeviceWidget(
                                                            orientation:
                                                                orientation,
                                                            portraitTabletAsPhone:
                                                                true,
                                                            tablet:
                                                                const TabletExpandedPlayer(),
                                                            phone:
                                                                const ExpandedPlayer()))
                                                ],
                                              )),
                                          if (!isFullScreen && !isMini)
                                            DeviceWidget(
                                                orientation: orientation,
                                                portraitTabletAsPhone: true,
                                                phone: const SizedBox.shrink(),
                                                tablet: const Expanded(
                                                    flex: 1,
                                                    child: ExpandedSideBar())),
                                          ConditionalWrap(
                                              wrapper: (child) => Expanded(
                                                  flex: 3, child: child),
                                              wrapIf: isMini,
                                              child: const MiniPlayer())
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
