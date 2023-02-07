import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/models/db/settings.dart';
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

class SettingsState extends State<Settings> {
  List<Server> dbServers = db.getServers();
  Server currentServer = db.getCurrentlySelectedServer();
  bool sponsorBlock = db.getSettings(USE_SPONSORBLOCK)?.value == 'true';

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

  selectServer(BuildContext context) {
    List<String> servers = List.of(PUBLIC_SERVERS, growable: true);
    servers.addAll(db.getServers().where((s) => PUBLIC_SERVERS.lastIndexWhere((s2) => s2 == s.url) == -1).map((e) => e.url).toList());

    SelectDialog.showModal<String>(
      context,
      label: "Select server to user",
      selectedValue: currentServer.url,
      items: servers,
      onChange: (String selected) {
        db.saveSetting(SettingsValue(SELECTED_SERVER, selected));
        FBroadcast.instance().broadcast(BROADCAST_SERVER_CHANGED);
        Server newServer = db.getCurrentlySelectedServer();

        setState(() {
          currentServer = newServer;
        });
      },
    );
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
                SettingsSection(title: Text('Servers'), tiles: [
                  SettingsTile.navigation(
                    title: Text('Manage servers'),
                    description: Text('Manage the invidious servers you want to interract with'),
                    onPressed: manageServers,
                  ),
                  SettingsTile(
                    title: Text('Selected server'),
                    value: Text(currentServer.url),
                    onPressed: (context) => selectServer(context),
                  )
                ]),
                SettingsSection(title: Text('SponsorBlock'), tiles: [
                  SettingsTile.switchTile(
                    initialValue: sponsorBlock,
                    onToggle: toggleSponsorBlock,
                    title: Text('Use SponsorBlock'),
                    description: Text('Skip sponsor segments submitted by the community'),
                  )
                ])
              ],
            )));
  }
}
