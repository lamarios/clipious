import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/player/views/components/audio_player.dart';
import 'package:invidious/player/views/components/expanded_player.dart';
import 'package:invidious/player/views/components/mini_player.dart';
import 'package:invidious/player/views/components/video_player.dart';

import '../../../utils.dart';
import '../../../videos/models/video.dart';
import '../../../videos/views/components/video_share_button.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    ColorScheme colors = themeData.colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    return Builder(
      builder: (context) {
        var cubit = context.read<PlayerCubit>();

        bool showPlayer = context.select((PlayerCubit value) => value.state.hasVideo);
        double? top = context.select((PlayerCubit value) => value.state.top);
        bool isMini = context.select((PlayerCubit value) => value.state.isMini);
        bool isPip = context.select((PlayerCubit value) => value.state.isPip);
        bool isHidden = context.select((PlayerCubit value) => value.state.isHidden);
        bool isDragging = context.select((PlayerCubit value) => value.state.isDragging);
        double opacity = context.select((PlayerCubit value) => value.state.opacity);
        Video? currentlyPlaying = context.select((PlayerCubit value) => value.state.currentlyPlaying);
        bool onPhone = getDeviceType() == DeviceType.phone;

        Widget videoPlayer = showPlayer
            ? BlocBuilder<PlayerCubit, PlayerState>(
                buildWhen: (previous, current) =>
                    previous.isAudio != current.isAudio || previous.currentlyPlaying != current.currentlyPlaying || previous.offlineCurrentlyPlaying != current.offlineCurrentlyPlaying,
                builder: (context, _) {
                  return _.isAudio
                      ? AudioPlayer(
                          key: const ValueKey('audio-player'),
                          video: _.isAudio ? _.currentlyPlaying : null,
                          offlineVideo: _.isAudio ? _.offlineCurrentlyPlaying : null,
                          miniPlayer: false,
                        )
                      : VideoPlayer(
                          key: const ValueKey('player'),
                          video: !_.isAudio ? _.currentlyPlaying : null,
                          offlineVideo: !_.isAudio ? _.offlineCurrentlyPlaying : null,
                          miniPlayer: false,
                          startAt: _.startAt,
                        );
                })
            : const SizedBox.shrink();

        List<Widget> miniPlayerWidgets = [];

        List<Widget> bigPlayerWidgets = [];

        if (showPlayer) {
          miniPlayerWidgets.addAll(MiniPlayer.build(context));
          bigPlayerWidgets.addAll(ExpandedPlayer.build(context));
        }

        return AnimatedPositioned(
          left: 0,
          top: top,
          bottom: cubit.getBottom,
          right: 0,
          duration: isDragging ? Duration.zero : animationDuration,
          child: AnimatedOpacity(
            opacity: opacity,
            duration: animationDuration,
            child: SafeArea(
              child: Material(
                elevation: 0,
                child: showPlayer
                    ? GestureDetector(
                        child: AnimatedContainer(
                          duration: animationDuration,
                          color: isMini ? colors.secondaryContainer : colors.background,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              isMini || isPip
                                  ? const SizedBox.shrink()
                                  : AppBar(
                                      backgroundColor: colors.background,
                                      title: Text(locals.videoPlayer),
                                      elevation: 0,
                                      leading: IconButton(
                                        icon: const Icon(Icons.expand_more),
                                        onPressed: cubit.showMiniPlayer,
                                      ),
                                      actions: isHidden || currentlyPlaying == null
                                          ? []
                                          : [
                                              Visibility(
                                                visible: currentlyPlaying != null,
                                                child: VideoShareButton(
                                                  video: currentlyPlaying!,
                                                  showTimestampOption: true,
                                                ),
                                              ),
                                            ],
                                    ),
                              AnimatedContainer(
                                width: double.infinity,
                                constraints: BoxConstraints(maxHeight: isMini ? targetHeight : 500, maxWidth: tabletMaxVideoWidth),
                                duration: animationDuration,
                                child: Row(
                                  mainAxisAlignment: isMini ? MainAxisAlignment.start : MainAxisAlignment.center,
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
