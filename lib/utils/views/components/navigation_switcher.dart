import 'package:flutter/material.dart';

import '../../../globals.dart';

class NavigationSwitcher extends StatelessWidget {
  final Widget child;
  const NavigationSwitcher({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOutQuad,
      switchOutCurve: Curves.easeInOutQuad,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1).animate(animation),
          child: FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1).animate(animation),
              child: child),
        );
      },
      duration: animationDuration,
      child: child,
    );
  }
}
