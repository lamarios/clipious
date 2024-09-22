import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:clipious/home/models/db/home_layout.dart';

@RoutePage()
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDataSource.home.build(context, false);
  }
}
