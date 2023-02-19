import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/database.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:invidious/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:settings_ui/settings_ui.dart';

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
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageServers()));
  }

  searchCountry(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    SelectDialog.showModal<String>(
      context,
      label: locals.selectBrowsingCountry,
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
    var categories = getCategories(context);
    var locals = AppLocalizations.of(context)!;
    SelectDialog.showModal<String>(
      context,
      label: locals.showOnStart,
      selectedValue: onOpen.toString(),
      showSearchBox: false,
      items: categories,
      onChange: (String selected) {
        int selectedIndex = categories.indexOf(selected);
        db.saveSetting(SettingsValue(ON_OPEN, selectedIndex.toString()));
        setState(() {
          onOpen = selectedIndex;
        });
      },
    );
  }

  List<String> getCategories(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return [locals.popular, locals.trending, locals.subscriptions, locals.playlists];
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
        extendBody: true,
        bottomNavigationBar: const SizedBox.shrink(),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(locals.settings),
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
            child: SettingsList(
          lightTheme: theme,
          darkTheme: theme,
          sections: [
            SettingsSection(
              title: Text(locals.browsing),
              tiles: [
                SettingsTile(
                  title: Text(locals.country),
                  value: Text(country.name),
                  onPressed: (context) => searchCountry(context),
                ),
                SettingsTile(
                  title: Text(locals.whenAppStartsShow),
                  value: Text(getCategories(context)[onOpen]),
                  onPressed: (context) => selectOnOpen(context),
                )
              ],
            ),
            SettingsSection(title: Text(locals.servers), tiles: [
              SettingsTile.navigation(
                title: Text(locals.manageServers),
                description: Text(locals.currentServer(db.getCurrentlySelectedServer().url)),
                onPressed: manageServers,
              ),
            ]),
            SettingsSection(title: const Text('SponsorBlock'), tiles: [
              SettingsTile.switchTile(
                initialValue: sponsorBlock,
                onToggle: toggleSponsorBlock,
                title: Text(locals.useSponsorBlock),
                description: Text(locals.sponsorBlockDescription),
              )
            ]),
            SettingsSection(title: (Text(locals.about)), tiles: [
              SettingsTile(
                title: Text('${locals.name}: ${packageInfo.appName}'),
                description: Text('${locals.package}: ${packageInfo.packageName}'),
              ),
              SettingsTile(
                title: Text('${locals.version}: ${packageInfo.version}'),
                description: Text('${locals.build}: ${packageInfo.buildNumber}'),
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
