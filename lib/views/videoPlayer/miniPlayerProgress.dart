import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPlayerProgressController.dart';

class MiniPlayerProgress extends StatelessWidget {
  const MiniPlayerProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return GetBuilder<MiniPlayerProgressController>(
      init: MiniPlayerProgressController(),
      builder: (_) => Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            color: colors.secondaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: AnimatedFractionallySizedBox(
              widthFactor: _.progress,
              heightFactor: 1,
              duration: const Duration(milliseconds: 750),
              curve: Curves.easeInOutQuad,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ))),
    );
  }
}
