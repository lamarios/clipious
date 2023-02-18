import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:select_dialog/select_dialog.dart';
import '../globals.dart';
import '../models/country.dart';
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
  Country country = getCountryFromCode(db.getSettings(BROWSING_COUNTRY)?.value ?? 'US');
  PackageInfo packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');
  int onOpen = int.parse(db.getSettings(ON_OPEN)?.value ?? '0');

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

  searchCountry(BuildContext context) {
    SelectDialog.showModal<String>(
      context,
      label: "Select browsing country",
      selectedValue: country.name,
      items: countryCodes.map((e) => e.name).toList(),
      onChange: (String selected) {
        String code = countryCodes.firstWhere((element) => element.name == selected, orElse: () => country).code;
        db.saveSetting(SettingsValue(BROWSING_COUNTRY, code));
        setState(() {
          country = getCountryFromCode(code);
        });
      },
    );
  }

  selectOnOpen(BuildContext context) {
    SelectDialog.showModal<String>(
      context,
      label: "Select what to show when the app starts",
      selectedValue: onOpen.toString(),
      showSearchBox: false,
      items: CATEGORIES,
      onChange: (String selected) {
        int selectedIndex = CATEGORIES.indexOf(selected);
        db.saveSetting(SettingsValue(ON_OPEN, selectedIndex.toString()));
        setState(() {
          onOpen = selectedIndex;
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
                SettingsSection(
                  title: const Text('Browsing'),
                  tiles: [
                    SettingsTile(
                      title: const Text('Country'),
                      value: Text(country.name),
                      onPressed: (context) => searchCountry(context),
                    ),
                    SettingsTile(
                      title: const Text('When app starts, show...'),
                      value: Text(CATEGORIES[onOpen]),
                      onPressed: (context) => selectOnOpen(context),
                    )
                  ],
                ),
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
