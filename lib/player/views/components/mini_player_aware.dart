import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/player.dart';

class MiniPlayerAware extends StatelessWidget {
  final Widget child;

  const MiniPlayerAware({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (
        context,
      ) {
        bool isHidden =
            context.select((PlayerCubit cubit) => cubit.state.isHidden);
        bool isClosing =
            context.select((PlayerCubit cubit) => cubit.state.isClosing);
        bool isMini = context.select((PlayerCubit cubit) => cubit.state.isMini);

        return AnimatedContainer(
          padding: EdgeInsets.only(
              bottom: !isHidden && isMini && !isClosing ? targetHeight : 0),
          duration: animationDuration,
          curve: Curves.easeInOutQuad,
          child: child,
        );
      },
    );
  }
}
