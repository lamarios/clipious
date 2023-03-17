import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/settingsController.dart';
import '../globals.dart';
import 'settings/manageServers.dart';

settingsTheme(ColorScheme colorScheme) => SettingsThemeData(
    settingsSectionBackground: colorScheme.background,
    settingsListBackground: colorScheme.background,
    titleTextColor: colorScheme.primary,
    dividerColor: colorScheme.onBackground,
    tileDescriptionTextColor: colorScheme.secondary,
    leadingIconsColor: colorScheme.secondary,
    tileHighlightColor: colorScheme.secondaryContainer);

class Settings extends StatelessWidget {
  const Settings({super.key});

  manageServers(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(settings: ROUTE_SETTINGS_MANAGE_SERVERS, builder: (context) => const ManageServers()));
  }

  searchCountry(BuildContext context) {
    var locals = AppLocalizations.of(context);
    var controller = Get.find<SettingsController>();
    SelectDialog.showModal<String>(
      context,
      label: locals?.selectBrowsingCountry,
      selectedValue: controller.country.name,
      items: countryCodes.map((e) => e.name).toList(),
      onChange: (String selected) {
        controller.selectCountry(selected);
      },
    );
  }

  selectOnOpen(BuildContext context) {
    var categories = getCategories(context);
    var locals = AppLocalizations.of(context)!;
    var controller = Get.find<SettingsController>();
    SelectDialog.showModal<String>(
      context,
      label: locals.showOnStart,
      selectedValue: categories[controller.onOpen],
      showSearchBox: false,
      items: categories,
      onChange: (String selected) {
        controller.selectOnOpen(selected, categories);
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

    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (_) => Scaffold(
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
                    value: Text(_.country.name),
                    onPressed: (context) => searchCountry(context),
                  ),
                  SettingsTile(
                    title: Text(locals.whenAppStartsShow),
                    value: Text(getCategories(context)[_.onOpen]),
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
              SettingsSection(title: Text(locals.videoPlayer), tiles: [
                SettingsTile.switchTile(
                  initialValue: _.useDash,
                  onToggle: _.toggleDash,
                  title: Text(locals.useDash),
                  description: Text(locals.useDashDescription),
                )
              ]),
              SettingsSection(title: const Text('SponsorBlock'), tiles: [
                SettingsTile.switchTile(
                  initialValue: _.sponsorBlock,
                  onToggle: _.toggleSponsorBlock,
                  title: Text(locals.useSponsorBlock),
                  description: Text(locals.sponsorBlockDescription),
                )
              ]),
              SettingsSection(
                title: Text(locals.appearance),
                tiles: [
                  SettingsTile.switchTile(
                    initialValue: _.useDynamicTheme,
                    onToggle: _.toggleDynamicTheme,
                    title: Text(locals.useDynamicTheme),
                    description: Text(locals.useDynamicThemeDescription),
                  ),
                ],
              ),
              SettingsSection(title: (Text(locals.about)), tiles: [
                SettingsTile(title: const Center(child: SizedBox(height: 150, width: 150, child: AppIconImage()))),
                SettingsTile(
                  title: Text('${locals.name}: ${_.packageInfo.appName}'),
                  description: Text('${locals.package}: ${_.packageInfo.packageName}'),
                ),
                SettingsTile(
                  title: Text('${locals.version}: ${_.packageInfo.version}'),
                  description: Text('${locals.build}: ${_.packageInfo.buildNumber}'),
                )
              ])
            ],
          ))),
    );
  }

}
