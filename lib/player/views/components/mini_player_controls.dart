import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/utils.dart';

import '../../../settings/states/settings.dart';
import '../../states/player.dart';
import '../../states/player_controls.dart';

const ButtonStyle buttonStyle = ButtonStyle(visualDensity: VisualDensity.compact);

class MiniPlayerControls extends StatelessWidget {
  final String videoId;

  const MiniPlayerControls({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    var player = context.read<PlayerCubit>();
    return BlocProvider(
      create: (context) => PlayerControlsCubit(PlayerControlsState(), player),
      child: Builder(builder: (context) {
        bool isMini = context.select((PlayerCubit value) => value.state.isMini);
        bool hasQueue = context.select((PlayerCubit value) => value.state.hasQueue);
        bool isPlaying = context.select((PlayerCubit value)=> value.state.isPlaying);

        return Padding(
          padding: isMini ? EdgeInsets.zero : const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: isMini ? colors.secondaryContainer : colors.background),
            constraints: BoxConstraints(
              maxWidth: tabletMaxVideoWidth,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Positioned(left: 0, child: VideoLikeButton(videoId: videoId, style: buttonStyle)),
                if (isMini)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: hasQueue,
                        child: IconButton(
                            style: buttonStyle,
                            onPressed: player.playPrevious,
                            icon: const Icon(
                              Icons.skip_previous,
                            )),
                      ),
                      IconButton(
                          onPressed: player.rewind,
                          style: buttonStyle,
                          icon: const Icon(
                            Icons.fast_rewind,
                          )),
                      IconButton(
                          onPressed: player.togglePlay,
                          style: buttonStyle,
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                          )),
                      IconButton(
                          onPressed: player.fastForward,
                          style: buttonStyle,
                          icon: const Icon(
                            Icons.fast_forward,
                          )),
                      Visibility(
                        visible: hasQueue,
                        child: IconButton(
                            onPressed: player.playNext,
                            style: buttonStyle,
                            icon: const Icon(
                              Icons.skip_next,
                            )),
                      )
                    ],
                  ),
                if (!isMini)
                  Builder(
                      builder: (context) {
                        var playerRepeatMode = context.select((SettingsCubit s) => s.state.playerRepeatMode);
                        var shuffleMode = context.select((SettingsCubit s) => s.state.playerShuffleMode);
                    var cubit = context.read<SettingsCubit>();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            style: buttonStyle,
                            onPressed: cubit.setNextRepeatMode,
                            color: playerRepeatMode == PlayerRepeat.noRepeat ? null : colors.primary,
                            icon: Icon(
                              playerRepeatMode == PlayerRepeat.repeatOne ? Icons.repeat_one : Icons.repeat,
                            )),
                        if (hasQueue)
                          IconButton(
                            onPressed: cubit.toggleShuffle,
                            style: buttonStyle,
                            icon: const Icon(Icons.shuffle),
                            color: shuffleMode ? colors.primary : null,
                          ),
                      ],
                    );
                  })
              ],
            ),
          ),
        );
      }),
    );
  }
}
