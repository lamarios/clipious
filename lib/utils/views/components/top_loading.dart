import 'package:flutter/material.dart';

class TopListLoading extends StatelessWidget {
  final double height;

  const TopListLoading({super.key, this.height = 2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            minHeight: height,
          ),
        ));
  }
}
