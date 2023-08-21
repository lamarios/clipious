import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/player/states/player.dart';

class MiniPlayerAware extends StatelessWidget {
  final Widget child;

  const MiniPlayerAware({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (
        context,
      ) {
        bool isHidden = context.select((PlayerCubit cubit) => cubit.state.isHidden);
        bool isMini = context.select((PlayerCubit cubit) => cubit.state.isMini);
        return Padding(
          padding: EdgeInsets.only(bottom: !isHidden && isMini ? targetHeight : 0),
          child: child,
        );
      },
    );
  }
}
