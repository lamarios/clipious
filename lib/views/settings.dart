import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:select_dialog/select_dialog.dart';
import '../globals.dart';
import '../models/db/server.dart';
import 'settings/manageServers.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  List<Server> dbServers = db.getServers();
  Server currentServer = db.getCurrentlySelectedServer();

  manageServers(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ManageServers()));
  }

  selectServer(BuildContext context) {
    List<String> servers = List.of(PUBLIC_SERVERS, growable: true);
    servers.addAll(db.getServers().where((s) => PUBLIC_SERVERS.lastIndexWhere((s2) => s2 == s.url) == 0).map((e) => e.url).toList());

    SelectDialog.showModal<String>(
      context,
      label: "Select server to user",
      selectedValue: currentServer.url,
      items: servers,
      onChange: (String selected) {
        db.saveSetting(SettingsValue(SELECTED_SERVER, selected));
        setState(() {
          currentServer = db.getCurrentlySelectedServer();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
            bottom: false,
            child: SettingsList(
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
                ])
              ],
            )));
  }
}
