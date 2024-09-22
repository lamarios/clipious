import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:clipious/home/models/db/home_layout.dart';

@RoutePage()
class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDataSource.history.build(context, false);
  }
}
