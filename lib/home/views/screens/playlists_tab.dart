import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:clipious/home/models/db/home_layout.dart';

@RoutePage()
class PlaylistsTab extends StatelessWidget {
  const PlaylistsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDataSource.playlist.build(context, false);
  }
}
