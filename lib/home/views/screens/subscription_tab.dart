import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:clipious/home/models/db/home_layout.dart';

@RoutePage()
class SubscriptionTab extends StatelessWidget {
  const SubscriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDataSource.subscription.build(context, false);
  }
}
