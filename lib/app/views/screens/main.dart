import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invidious/app/views/components/player_placeholder.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/views/components/player.dart';

import '../../../player/views/components/mini_player_aware.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: Theme.of(context).colorScheme.background,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: MiniPlayerAware(
                child: AutoRouter(),
              ),
            ),
            const Positioned(
                left: 0, bottom: 0, right: 0, child: PlayerPlaceHolder()),
            Player(constraints.maxHeight),
          ],
        ),
      );
    });
  }
}
