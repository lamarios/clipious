import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/player/views/components/player.dart';

import '../../../player/views/components/mini_player_aware.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        MiniPlayerAware(
          child: AutoRouter(),
        ),
        Player()
      ],
    );
  }
}
