import 'package:auto_route/auto_route.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/app/states/app.dart';
import 'package:clipious/router.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/utils/models/imgur_error.dart';
import 'package:clipious/utils/views/components/app_icon.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../states/settings.dart';

settingsTheme(ColorScheme colorScheme) => SettingsThemeData(
    settingsSectionBackground: colorScheme.surface,
    settingsListBackground: colorScheme.surface,
    titleTextColor: colorScheme.primary,
    dividerColor: colorScheme.onSurface,
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
      builder: (ctx, state) {
        var cubit = ctx.read<SettingsCubit>();
        return Scaffold(
            extendBody: true,
            bottomNavigationBar: const SizedBox.shrink(),
            appBar: AppBar(
              title: Text(locals.settings),
            ),
            backgroundColor: colorScheme.surface,
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
                    title: Text(locals.notifications),
                    description: Text(state.backgroundNotifications
                        ? locals.foregroundServiceNotificationContent(
                            state.backgroundNotificationFrequency.toString())
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
                    title: Text('${locals.name}: ${state.packageInfo.appName}'),
                    description: Text(
                        '${locals.package}: ${state.packageInfo.packageName}'),
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.numbers),
                    title:
                        Text('${locals.version}: ${state.packageInfo.version}'),
                    description: Text(
                        '${locals.build}: ${state.packageInfo.buildNumber}'),
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
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.feedback_outlined),
                    title: Text(locals.submitFeedback),
                    description: Text(locals.submitFeedbackDescription),
                    onPressed: (context) {
                      okCancelDialog(
                          context,
                          locals.submitFeedback,
                          locals.feedbackDisclaimer,
                          () => BetterFeedback.of(context).show((feedback) {
                                try {
                                  cubit.sendFeedBack(feedback);
                                } catch (err) {
                                  showAlertDialog(context, locals.error, [
                                    Text(locals.feedbackScreenshotError),
                                    if (err is ImgurError) Text(err.error)
                                  ]);
                                }
                              }));
                    },
                  )
                ])
              ],
            )));
      },
    );
  }
}
