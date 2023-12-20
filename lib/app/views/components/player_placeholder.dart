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
        var showPlaceHolder =
            context.select((PlayerCubit value) => value.state.showMiniPlaceholder && value.state.isMini);
        return AnimatedOpacity(
          opacity: showPlaceHolder ? 1 : 0,
          duration: animationDuration,
          child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.easeInOut,
              height: showPlaceHolder ? targetHeight : 0,
              color: colors.background,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.secondaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: AnimatedOpacity(
                      duration: animationDuration * 4,
                      opacity: showPlaceHolder ? 1 : 0,
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: colors.onSecondaryContainer.withOpacity(0.3),
                      )),
                ),
              )),
        );
      },
    ));
  }
}
