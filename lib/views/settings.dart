import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:select_dialog/select_dialog.dart';
import '../globals.dart';
import '../models/db/server.dart';
import 'settings/manageServers.dart';

settingsTheme(ColorScheme colorScheme) => SettingsThemeData(
    settingsSectionBackground: colorScheme.background,
    settingsListBackground: colorScheme.background,
    titleTextColor: colorScheme.primary,
    dividerColor: colorScheme.onBackground,
    tileDescriptionTextColor: colorScheme.secondary,
    leadingIconsColor: colorScheme.secondary,
    tileHighlightColor: colorScheme.secondaryContainer);

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> with AfterLayoutMixin {
  List<Server> dbServers = db.getServers();
  Server currentServer = db.getCurrentlySelectedServer();
  bool sponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
  PackageInfo packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');

  @override
  initState() {
    super.initState();
    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      setState(() {
        currentServer = db.getCurrentlySelectedServer();
      });
    });
  }

  toggleSponsorBlock(bool value) {
    db.saveSetting(SettingsValue(USE_SPONSORBLOCK, value.toString()));
    setState(() {
      sponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';
    });
  }

  manageServers(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ManageServers()));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
            bottom: false,
            child: SettingsList(
              lightTheme: theme,
              darkTheme: theme,
              sections: [
                SettingsSection(title: const Text('Servers'), tiles: [
                  SettingsTile.navigation(
                    title: const Text('Manage servers'),
                    description: Text('Currently using: ${db.getCurrentlySelectedServer().url}'),
                    onPressed: manageServers,
                  ),
                ]),
                SettingsSection(title: const Text('SponsorBlock'), tiles: [
                  SettingsTile.switchTile(
                    initialValue: sponsorBlock,
                    onToggle: toggleSponsorBlock,
                    title: const Text('Use SponsorBlock'),
                    description: const Text('Skip sponsor segments submitted by the community'),
                  )
                ]),
                SettingsSection(title: (const Text('About')), tiles: [
                  SettingsTile(
                    title: Text('Name: ${packageInfo.appName}'),
                    description: Text('Package: ${packageInfo.packageName}'),
                  ),
                  SettingsTile(
                    title: Text('Version: ${packageInfo.version}'),
                    description: Text('Build: ${packageInfo.buildNumber}'),
                  )
                ])
              ],
            )));
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      this.packageInfo = packageInfo;
    });
  }
}
