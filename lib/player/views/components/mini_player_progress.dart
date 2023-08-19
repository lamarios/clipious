import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../states/player.dart';

class MiniPlayerProgress extends StatelessWidget {
  const MiniPlayerProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return BlocBuilder<PlayerCubit, PlayerState>(
      buildWhen: (previous, current) => previous.position != current.position,
      builder: (context, _) {
        var player = context.read<PlayerCubit>();
        return !(player.state.currentlyPlaying?.liveNow ?? false)
            ? Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedFractionallySizedBox(
                    widthFactor: _.position.inMilliseconds / player.duration.inMilliseconds,
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
