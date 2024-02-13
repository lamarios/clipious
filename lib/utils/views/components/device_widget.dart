import 'package:flutter/material.dart';
import 'package:invidious/utils.dart';

class DeviceWidget extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final bool portraitTabletAsPhone;
  final DeviceType? forcedTyped;
  // used to force orientation, can be useful in some cases
  final Orientation? orientation;

  const DeviceWidget(
      {super.key,
      required this.phone,
      required this.tablet,
      this.portraitTabletAsPhone = false,
      this.forcedTyped,
      this.orientation});

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = orientation ?? getOrientation();
    var deviceType = forcedTyped ?? getDeviceType();
    return switch (deviceType) {
      (DeviceType.phone) => phone,
      (DeviceType.tablet) =>
        deviceOrientation == Orientation.portrait && portraitTabletAsPhone
            ? phone
            : tablet,
      (_) => const SizedBox.shrink()
    };
  }
}
