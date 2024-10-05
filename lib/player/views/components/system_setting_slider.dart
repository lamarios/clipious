import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum SystemSliderType {
  volume,
  brightness;

  IconData getIcon(double value) {
    switch (this) {
      case brightness:
        if (value <= 0.3) {
          return Icons.brightness_low;
        } else if (value <= 0.7) {
          return Icons.brightness_medium;
        } else {
          return Icons.brightness_high;
        }
      case volume:
        if (value == 0) {
          return Icons.volume_off;
        } else if (value <= 0.7) {
          return Icons.volume_down;
        } else {
          return Icons.volume_up;
        }
    }
  }
}

class SystemSettingsSlider extends StatelessWidget {
  final SystemSliderType type;
  final double value;

  const SystemSettingsSlider(
      {super.key, required this.value, required this.type});

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
              type.getIcon(value),
              color: colors.primary,
              size: 12,
            )
          ],
        ),
      ),
    );
  }
}
