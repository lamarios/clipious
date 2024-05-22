import 'package:flutter/material.dart';

class SimpleListItem extends StatelessWidget {
  final Widget child;
  final int index;

  const SimpleListItem({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: index % 2 != 0
              ? colors.secondaryContainer.withOpacity(0.5)
              : colors.surface,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
