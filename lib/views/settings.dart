import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:locale_names/locale_names.dart';
import 'package:invidious/views/settings/sponsorBlockSettings.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/settingsController.dart';
import '../globals.dart';
import '../main.dart';
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
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_SETTINGS_MANAGE_SERVERS, builder: (context) => const ManageServers()));
  }

  openSponsorBlockSettings(BuildContext context) {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_SETTINGS_SPONSOR_BLOCK, builder: (context) => const SponsorBlockSettings()));
  }

  searchCountry(BuildContext context, SettingsController controller) {
    var locals = AppLocalizations.of(context);
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

  selectOnOpen(BuildContext context, SettingsController controller) {
    var categories = getCategories(context);
    var locals = AppLocalizations.of(context)!;
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

  showSelectLanguage(BuildContext context, SettingsController controller) {
    var localsList = AppLocalizations.supportedLocales;
    var localsStrings = localsList.map((e) => e.nativeDisplayLanguageScript ?? '').toList();
    var locals = AppLocalizations.of(context)!;

    List<String>? localeString = controller.locale?.split('_');
    Locale? selected = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

    SelectDialog.showModal<String>(
      context,
      label: locals.appLanguage,
      selectedValue: selected?.nativeDisplayLanguageScript ?? locals.followSystem,
      showSearchBox: false,
      items: [locals.followSystem, ...localsStrings],
      onChange: (String selected) {
        if (selected == locals.followSystem) {
          controller.setLocale(localsList, localsStrings, null);
        } else {
          controller.setLocale(localsList, localsStrings, selected);
        }
      },
    );
  }

  List<String> getCategories(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return [locals.popular, locals.trending, locals.subscriptions, locals.playlists];
  }

  selectTheme(BuildContext context, SettingsController _) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    showDialog(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        builder: (ctx) => SizedBox(
              height: 200,
              child: SimpleDialog(
                  title: Text(locals.themeBrightness),
                  children: ThemeMode.values
                      .map((e) => RadioListTile(
                          title: Text(_.getThemeLabel(locals, e)),
                          value: e,
                          groupValue: _.themeMode,
                          onChanged: (value) {
                            Navigator.of(ctx).pop();
                            _.setThemeMode(value);
                          }))
                      .toList()),
            ));
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
            backgroundColor: colorScheme.background,
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
                    onPressed: (context) => searchCountry(context, _),
                  ),
                  SettingsTile(
                    title: Text(locals.whenAppStartsShow),
                    value: Text(getCategories(context)[_.onOpen]),
                    onPressed: (context) => selectOnOpen(context, _),
                  ),
                  SettingsTile(
                    title: Text(locals.appLanguage),
                    value: Text('${_.getLocaleDisplayName() ?? locals.followSystem}. ${locals.requiresRestart}'),
                    onPressed: (context) => showSelectLanguage(context, _),
                  )
                ],
              ),
              SettingsSection(title: Text(locals.servers), tiles: [
                SettingsTile.navigation(
                  title: Text(locals.manageServers),
                  description: Text(locals.currentServer(db.getCurrentlySelectedServer().url)),
                  onPressed: manageServers,
                ),
                SettingsTile.switchTile(
                  title: Text(locals.skipSslVerification),
                  description: Text(locals.skipSslVerificationDescription),
                  initialValue: _.skipSslVerification,
                  onToggle: _.toggleSslVerification,
                )
              ]),
              SettingsSection(title: Text(locals.videoPlayer), tiles: [
                SettingsTile.switchTile(
                  initialValue: _.useDash,
                  onToggle: _.toggleDash,
                  title: Text(locals.useDash),
                  description: Text(locals.useDashDescription),
                ),
                SettingsTile.switchTile(
                  initialValue: _.useProxy,
                  onToggle: _.toggleProxy,
                  title: Text(locals.useProxy),
                  description: Text(locals.useProxyDescription),
                ),
                SettingsTile(
                  title: Text(locals.subtitleFontSize),
                  description: Text(locals.subtitleFontSizeDescription),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () => _.changeSubtitleSize(increase: false), icon: const Icon(Icons.remove)),
                      Text(_.subtitleSize.floor().toString()),
                      IconButton(onPressed: () => _.changeSubtitleSize(increase: true), icon: const Icon(Icons.add)),
                    ],
                  ),
                ),
                SettingsTile.navigation(
                  title: Text('SponsorBlock'),
                  description: Text(locals.sponsorBlockDescription),
                  onPressed: openSponsorBlockSettings,
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
                  SettingsTile(
                    title: Text(locals.themeBrightness),
                    value: Text('${_.getThemeLabel(locals, _.themeMode)}. ${locals.requiresRestart}'),
                    onPressed: (context) => selectTheme(context, _),
                  ),
                  SettingsTile.switchTile(
                    initialValue: _.blackBackground,
                    onToggle: _.toggleBlackBackground,
                    title: Text(locals.blackBackground),
                    description: Text(locals.blackBackgroundDescription),
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
