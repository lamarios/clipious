import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/app/views/components/player_placeholder.dart';
import 'package:clipious/player/views/components/player.dart';

import '../../../player/states/player.dart';
import '../../../player/views/components/mini_player_aware.dart';
import '../../../utils.dart';
import '../../states/app.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final deviceType = getDeviceType();
      final orientation =
          context.select((PlayerCubit value) => value.state.orientation);

      final bool globalLoading =
          context.select((AppCubit value) => value.state.globalLoading);
      final playerHorizontalPosition = orientation == Orientation.landscape &&
              deviceType == DeviceType.tablet
          ? getFractionOfAvailableSpace(context, tabletMiniPlayerFraction)
          : const Size(0, 0);
      var colors = Theme.of(context).colorScheme;
      return Container(
        color: colors.surface,
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
            Positioned(
                left: playerHorizontalPosition.width,
                bottom: 0,
                right: playerHorizontalPosition.width,
                child: const PlayerPlaceHolder()),
            Player(constraints.maxHeight),
            if (globalLoading)
              Positioned(
                  child: Container(
                      color: colors.surface.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      )))
          ],
        ),
      );
    });
  }
}
