import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final Function(bool isAudio) onPressed;

  const PlayButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100.0, top: 60),
          child: IconButton(
            onPressed: () => onPressed(true),
            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => colorScheme.primary.withOpacity(1))),
            icon: const Icon(
              Icons.music_note,
              size: 35,
            ),
            color: colorScheme.primaryContainer,
          ),
        ),
        IconButton(
          onPressed: () => onPressed(false),
          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => colorScheme.primaryContainer.withOpacity(1))),
          icon: const Icon(
            Icons.play_arrow,
            size: 75,
          ),
          color: colorScheme.primary,
        ),
      ],
    );
  }
}
