import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invidious/home/models/db/home_layout.dart';

@RoutePage()
class PopularTab extends StatelessWidget {
  const PopularTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDataSource.popular.build(context, false);
  }
}
