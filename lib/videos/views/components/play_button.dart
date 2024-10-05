import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final bool hasAudio;
  final Function(bool isAudio) onPressed;
  final IconData? icon;

  const PlayButton(
      {super.key, required this.onPressed, this.icon, this.hasAudio = true});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (hasAudio)
          Padding(
            padding: const EdgeInsets.only(left: 100.0, top: 60),
            child: IconButton(
              onPressed: () {
                onPressed(true);
                AutoRouter.of(context).maybePop();
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith(
                      (states) => colorScheme.primary.withOpacity(1))),
              icon: const Icon(
                Icons.music_note,
                size: 35,
              ),
              color: colorScheme.primaryContainer,
            ),
          ),
        IconButton(
          onPressed: () {
            onPressed(false);
            AutoRouter.of(context).maybePop();
          },
          style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith(
                  (states) => colorScheme.primaryContainer.withOpacity(1))),
          icon: Icon(
            icon ?? Icons.play_arrow,
            size: 75,
          ),
          color: colorScheme.primary,
        ),
      ],
    );
  }
}
