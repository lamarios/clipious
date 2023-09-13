import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/settings/views/components/app_customizer.dart';
import 'package:invidious/settings/views/screens/app_logs.dart';
import 'package:invidious/settings/views/screens/search_history_settings.dart';
import 'package:invidious/settings/views/screens/sponsor_block_settings.dart';
import 'package:invidious/settings/views/screens/video_filter.dart';
import 'package:invidious/utils/views/components/app_icon.dart';
import 'package:invidious/utils/views/components/select_list_dialog.dart';
import 'package:locale_names/locale_names.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../globals.dart';
import '../../states/settings.dart';
import 'manage_servers.dart';

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
    Navigator.of(context)
        .push(MaterialPageRoute(settings: ROUTE_SETTINGS_MANAGE_SERVERS, builder: (context) => const ManageServers()));
  }

  openAppLogs(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(settings: ROUTE_SETTINGS_SEARCH_HISTORY, builder: (context) => const AppLogs()));
  }

  openNotificationSettings(BuildContext context) {
    Navigator.of(context).pushNamed(PATH_SETTINGS_NOTIFICATIONS);
  }

  openBrowsingSettings(BuildContext context) {
    Navigator.of(context).pushNamed(pathSettingsBrowsing);
  }

  openVideoPlayerSettings(BuildContext context) {
    Navigator.of(context).pushNamed(pathSettingsVideoPlayer);
  }

  openAppearanceSettings(BuildContext context) {
    Navigator.of(context).pushNamed(pathSettingsAppearance);
  }

/*
  selectOnOpen(BuildContext context, SettingsState controller) {
    var categories = getCategories(context);
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();

    SelectDialog.showModal<String>(
      context,
      label: locals.showOnStart,
      selectedValue: categories[controller.onOpen],
      showSearchBox: false,
      items: categories,
      onChange: (String selected) {
        cubit.selectOnOpen(selected, categories);
      },
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (ctx, _) {
        var cubit = ctx.read<SettingsCubit>();
        return Scaffold(
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
                SettingsSection( tiles: [
                  SettingsTile.navigation(
                    leading: const Icon(Icons.home),
                    title: Text(locals.browsing),
                    description: Text(List.of([
                      locals.country,
                      locals.customizeAppLayout,
                      locals.distractionFreeMode,
                      locals.appLanguage,
                      "Return YouTube Dislike",
                      locals.searchHistory,
                      locals.videoFilters
                    ]).join(", ")),
                    onPressed: openBrowsingSettings,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.cloud_queue),
                    title: Text(locals.manageServers),
                    description: BlocBuilder<AppCubit, AppState>(
                        buildWhen: (previous, current) => previous.server != current.server,
                        builder: (context, app) =>
                            Text(app.server != null ? locals.currentServer(app.server!.url) : "")),
                    onPressed: manageServers,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.video_settings),
                    title: Text(locals.videoPlayer),
                    description: Text(List.of([
                      locals.useDash,
                      locals.useProxy,
                      locals.autoplayVideoOnLoad,
                      locals.subtitleFontSize,
                      locals.rememberSubtitleLanguage,
                      locals.rememberPlaybackSpeed,
                      "SponsorBlock",
                      locals.lockFullScreenToLandscape,
                      locals.fillFullscreen
                    ]).join(", ")),
                    onPressed: openVideoPlayerSettings,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.notifications),
                    title: Text('${locals.notifications} (beta)'),
                    description: Text(locals.notificationsDescription),
                    onPressed: openNotificationSettings,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.palette),
                    title: Text(locals.appearance),
                    description: Text(
                      List.of([
                        locals.useDynamicTheme,
                        locals.themeBrightness,
                        locals.blackBackground,
                        locals.navigationBarStyle
                      ]).join(", "),
                    ),
                    onPressed: openAppearanceSettings,
                  ),
                ]),
                SettingsSection(title: (Text(locals.about)), tiles: [
                  SettingsTile(title: const Center(child: SizedBox(height: 150, width: 150, child: AppIcon()))),
                  SettingsTile(
                    title: Text('${locals.name}: ${_.packageInfo.appName}'),
                    description: Text('${locals.package}: ${_.packageInfo.packageName}'),
                  ),
                  SettingsTile(
                    title: Text('${locals.version}: ${_.packageInfo.version}'),
                    description: Text('${locals.build}: ${_.packageInfo.buildNumber}'),
                  ),
                  SettingsTile(
                    title: Text(locals.appLogs),
                    description: Text(locals.appLogsDescription),
                    onPressed: openAppLogs,
                  )
                ])
              ],
            )));
      },
    );
  }
}
