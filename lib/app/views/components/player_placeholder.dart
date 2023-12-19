import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/player.dart';

class PlayerPlaceHolder extends StatelessWidget {
  const PlayerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Material(child: Builder(
      builder: (context) {
        var showMiniPlaceholder = context
            .select((PlayerCubit value) => value.state.showMiniPlaceholder);
        var isMini = context.select((PlayerCubit value) => value.state.isMini);
        return AnimatedOpacity(
          opacity: showMiniPlaceholder && isMini ? 1 : 0,
          duration: animationDuration,
          child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.easeInOut,
              height: isMini && showMiniPlaceholder ? targetHeight : 0,
              color: colors.background,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.secondaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
        );
      },
    ));
  }
}
