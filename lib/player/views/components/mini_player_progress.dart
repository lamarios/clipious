import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/videos/models/video.dart';

import '../../states/player.dart';

class MiniPlayerProgress extends StatelessWidget {
  const MiniPlayerProgress({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Builder(
      builder: (context) {
        Video? currentlyPlaying =
            context.select((PlayerCubit cubit) => cubit.state.currentlyPlaying);
        Duration duration =
            context.select((PlayerCubit cubit) => cubit.duration);
        Duration position =
            context.select((PlayerCubit cubit) => cubit.state.position);

        return !(currentlyPlaying?.liveNow ?? false)
            ? Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedFractionallySizedBox(
                    widthFactor:
                        position.inMilliseconds / duration.inMilliseconds,
                    heightFactor: 1,
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.easeInOutQuad,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )))
            : const SizedBox.shrink();
      },
    );
  }
}
