import 'package:flutter/material.dart';
import 'package:invidious/views/settings/manageServerInner.dart';

class ManageServers extends StatefulWidget {
  const ManageServers({super.key});

  @override
  ManageServerState createState() => ManageServerState();
}

class ManageServerState extends State<ManageServers> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text('Manage servers'),
        ),
        backgroundColor: colorScheme.background,
        body: const SafeArea(bottom: false, child: ManagerServersView()));
  }
}
