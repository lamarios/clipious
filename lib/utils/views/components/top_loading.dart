import 'package:flutter/material.dart';

class TopListLoading extends StatelessWidget {
  final double height;

  const TopListLoading({super.key, this.height = 2});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: height,
      child: Stack(children: [
        SizedBox(
            height: height,
            child: LinearProgressIndicator(
              minHeight: height,
            )),
        Container(
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            colorScheme.background,
            colorScheme.background.withOpacity(0),
            colorScheme.background
          ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
        ),
      ]),
    );
  }
}
