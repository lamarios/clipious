import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/controllers/miniPayerController.dart';

class MiniPlayerAware extends StatelessWidget {
  final Widget child;

  const MiniPlayerAware({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiniPlayerCubit, MiniPlayerController>(
      buildWhen: (previous, current) => previous.isMini != current.isMini || previous.isHidden != current.isHidden,
      builder: (context, _) => Padding(
        padding: EdgeInsets.only(bottom: !_.isHidden && _.isMini ? targetHeight : 0),
        child: child,
      ),
    );
  }
}
