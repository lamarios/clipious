import 'package:flutter/material.dart';
import 'package:invidious/settings/views/tv/components/manage_server_inner.dart';
import 'package:invidious/views/tv/tvOverScan.dart';

class TvSettingsManageServers extends StatelessWidget {
  const TvSettingsManageServers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TvOverscan(child: TvManageServersInner()),
    );
  }
}
