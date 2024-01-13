import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/router.dart';
import 'package:invidious/utils/views/components/app_icon.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../states/settings.dart';

settingsTheme(ColorScheme colorScheme) => SettingsThemeData(
    settingsSectionBackground: colorScheme.background,
    settingsListBackground: colorScheme.background,
    titleTextColor: colorScheme.primary,
    dividerColor: colorScheme.onBackground,
    tileDescriptionTextColor: colorScheme.secondary,
    leadingIconsColor: colorScheme.secondary,
    tileHighlightColor: colorScheme.secondaryContainer);

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  manageServers(BuildContext context) {
    AutoRouter.of(context).push(const ManageServersRoute());
  }

  openAppLogs(BuildContext context) {
    AutoRouter.of(context).push(const AppLogsRoute());
  }

  openNotificationSettings(BuildContext context) {
    AutoRouter.of(context).push(const NotificationSettingsRoute());
  }

  openBrowsingSettings(BuildContext context) {
    AutoRouter.of(context).push(const BrowsingSettingsRoute());
  }

  openVideoPlayerSettings(BuildContext context) {
    AutoRouter.of(context).push(const VideoPlayerSettingsRoute());
  }

  openAppearanceSettings(BuildContext context) {
    AutoRouter.of(context).push(const AppearanceSettingsRoute());
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
              title: Text(locals.settings),
            ),
            backgroundColor: colorScheme.background,
            body: SafeArea(
                child: SettingsList(
              lightTheme: theme,
              darkTheme: theme,
              sections: [
                SettingsSection(tiles: [
                  SettingsTile.navigation(
                    leading: const Icon(Icons.home_outlined),
                    title: Text(locals.browsing),
                    description: Text(
                      List.of([
                        locals.country,
                        locals.customizeAppLayout,
                        locals.distractionFreeMode,
                        locals.appLanguage,
                        "Return YouTube Dislike",
                        locals.searchHistory,
                        locals.videoFilters,
                        'DeArrow'
                      ]).join(", "),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onPressed: openBrowsingSettings,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.cloud_queue),
                    title: Text(locals.manageServers),
                    description: BlocBuilder<AppCubit, AppState>(
                        buildWhen: (previous, current) =>
                            previous.server != current.server,
                        builder: (context, app) => Text(app.server != null
                            ? locals.currentServer(app.server!.url)
                            : "")),
                    onPressed: manageServers,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.video_settings),
                    title: Text(locals.videoPlayer),
                    description: Text(
                      List.of([
                        locals.useDash,
                        locals.useProxy,
                        locals.autoplayVideoOnLoad,
                        locals.subtitles,
                        "SponsorBlock",
                        locals.lockFullScreenToLandscape,
                        locals.fillFullscreen
                      ]).join(", "),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onPressed: openVideoPlayerSettings,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.notifications_outlined),
                    title: Text('${locals.notifications} (beta)'),
                    description: Text(_.backgroundNotifications
                        ? locals.foregroundServiceNotificationContent(
                            _.backgroundNotificationFrequency.toString())
                        : locals.notificationsDescription),
                    onPressed: openNotificationSettings,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.palette_outlined),
                    title: Text(locals.appearance),
                    description: Text(
                      List.of([
                        locals.useDynamicTheme,
                        locals.themeBrightness,
                        locals.blackBackground,
                        locals.navigationBarStyle
                      ]).join(", "),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onPressed: openAppearanceSettings,
                  ),
                ]),
                SettingsSection(title: (Text(locals.about)), tiles: [
                  SettingsTile(
                      title: const Center(
                          child: SizedBox(
                              height: 150, width: 150, child: AppIcon()))),
                  SettingsTile(
                    leading: const Icon(Icons.badge_outlined),
                    title: Text('${locals.name}: ${_.packageInfo.appName}'),
                    description:
                        Text('${locals.package}: ${_.packageInfo.packageName}'),
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.numbers),
                    title: Text('${locals.version}: ${_.packageInfo.version}'),
                    description:
                        Text('${locals.build}: ${_.packageInfo.buildNumber}'),
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.toc),
                    title: Text(locals.appLogs),
                    description: Text(locals.appLogsDescription),
                    onPressed: openAppLogs,
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.settings),
                    title: Text(locals.copySettingsAsJson),
                    description: Text(locals.copySettingsAsJsonDescription),
                    onPressed: cubit.copySettingsAsJson,
                  )
                ])
              ],
            )));
      },
    );
  }
}
