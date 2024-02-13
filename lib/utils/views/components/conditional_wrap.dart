import 'package:flutter/material.dart';

class ConditionalWrap extends StatelessWidget {
  final Widget Function(Widget child) wrapper;
  final bool wrapIf;
  final Widget child;
  const ConditionalWrap(
      {super.key,
      required this.wrapper,
      required this.wrapIf,
      required this.child});

  @override
  Widget build(BuildContext context) {
    if (wrapIf) {
      return wrapper(child);
    } else {
      return child;
    }
  }
}
