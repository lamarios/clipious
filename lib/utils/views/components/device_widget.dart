import 'package:flutter/material.dart';
import 'package:invidious/utils.dart';

class DeviceWidget extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final bool portraitTabletAsPhone;
  // used to force orientation, can be useful in some cases
  final Orientation? orientation;

  const DeviceWidget(
      {super.key,
      required this.phone,
      required this.tablet,
      this.portraitTabletAsPhone = false,
      this.orientation});

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = orientation ?? getOrientation();
    return switch (getDeviceType()) {
      (DeviceType.phone) => phone,
      (DeviceType.tablet) =>
        deviceOrientation == Orientation.portrait && portraitTabletAsPhone
            ? phone
            : tablet,
      (_) => const SizedBox.shrink()
    };
  }
}
