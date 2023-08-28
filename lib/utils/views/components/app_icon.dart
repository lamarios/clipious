import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final double? height;
  final double? width;

  const AppIcon({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icon.svg",
      width: width,
      height: height,
    );
  }
}
