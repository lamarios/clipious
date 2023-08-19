import 'package:flutter/material.dart';

class TvOverscan extends StatelessWidget {
  static const double vertical = 27;
  static const double horizontal = 48;
  final Widget child;

  const TvOverscan({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TvOverscan.vertical, horizontal: TvOverscan.horizontal),
      child: child,
    );
  }
}
