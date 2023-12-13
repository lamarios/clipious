import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/objectbox.g.dart';

enum MultiValueSwitchPosition {
  left,
  right;
}

class MultiValueSwitch extends StatelessWidget {
  final IconData left, right;
  final MultiValueSwitchPosition position;
  final Function(MultiValueSwitchPosition selected) onChange;

  const MultiValueSwitch(
      {super.key,
      required this.left,
      required this.right,
      required this.position,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 13;
    const double width = 50;

    var colors = Theme.of(context).colorScheme;
    final isLeft = position == MultiValueSwitchPosition.left;
    final isRight = position == MultiValueSwitchPosition.right;
    return GestureDetector(
      onTap: () => onChange(isLeft
          ? MultiValueSwitchPosition.right
          : MultiValueSwitchPosition.left),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        decoration: BoxDecoration(
            color: colors.secondaryContainer,
            borderRadius: BorderRadius.circular(15)),
        width: width,
        height: 25,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              top: 0,
              bottom: 0,
              left: isLeft ? 0 : width / 2,
              right: isRight ? 0 : width / 2,
              duration: animationDuration,
              curve: Curves.easeInOutQuad,
              child: Container(
                decoration: BoxDecoration(
                    color: colors.primary, shape: BoxShape.circle),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        left,
                        size: iconSize,
                        color: isLeft ? colors.onPrimary : colors.secondary,
                      ),
                      Icon(
                        right,
                        size: iconSize,
                        color: isRight ? colors.onPrimary : colors.secondary,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
