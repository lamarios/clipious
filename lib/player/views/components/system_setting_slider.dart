import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SystemSettingsSlider extends StatelessWidget {
  final IconData icon;
  final double value;

  const SystemSettingsSlider(
      {super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors.secondaryContainer),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.primary.withOpacity(0.1)),
                  child: FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: value,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colors.primary),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Icon(
              icon,
              color: colors.primary,
              size: 12,
            )
          ],
        ),
      ),
    );
  }
}
