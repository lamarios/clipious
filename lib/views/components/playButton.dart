import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final Function() onPressed;

  const PlayButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => colorScheme.secondaryContainer.withOpacity(0.7))),
      icon: const Icon(
        Icons.play_arrow,
        size: 75,
      ),
      color: colorScheme.primary,
    );
  }
}
