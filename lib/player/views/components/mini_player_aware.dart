import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/player/states/player.dart';

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
          child: SafeArea(bottom: !isHidden && isMini, child: child),
        );
      },
    );
  }
}
