import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/controllers/miniPlayerAwareController.dart';

class MiniPlayerAware extends StatelessWidget {
  final Widget child;

  const MiniPlayerAware({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MiniPlayerAwareController>(
      init: MiniPlayerAwareController(),
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: _.applyPadding ? targetHeight : 0),
        child: child,
      ),
    );
  }
}
