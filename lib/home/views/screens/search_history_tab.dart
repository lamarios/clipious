import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invidious/home/models/db/home_layout.dart';

@RoutePage()
class SearchHistoryTab extends StatelessWidget {
  const SearchHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDataSource.searchHistory.build(context, false);
  }
}
