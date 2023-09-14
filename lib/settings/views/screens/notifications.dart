import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/components/channel_notifications.dart';
import 'package:invidious/settings/views/components/playlist_notifications.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:invidious/utils.dart';
import 'package:optimize_battery/optimize_battery.dart';
import 'package:settings_ui/settings_ui.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  enableBackgroundService(BuildContext context, bool enable) async {
    var settings = context.read<SettingsCubit>();
    var result = await settings.setBackgroundNotifications(enable);
    if (result == EnableBackGroundNotificationResponse.needBatteryOptimization && context.mounted) {
      showBatteryOptimizationDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        title: Text(locals.notifications),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(child: BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
        var cubit = context.read<SettingsCubit>();
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SettingsList(
                lightTheme: theme,
                darkTheme: theme,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                sections: [
                  SettingsSection(
                    tiles: [
                      SettingsTile.switchTile(
                        initialValue: state.backgroundNotifications,
                        onToggle: (value) => enableBackgroundService(context, value),
                        title: Text(locals.notifications),
                        description: Text(locals.enableNotificationDescriptions),
                      ),
                      SettingsTile.switchTile(
                        enabled: state.backgroundNotifications,
                        initialValue: state.subscriptionsNotifications,
                        onToggle: cubit.setSubscriptionsNotifications,
                        title: Text(locals.subscriptionNotification),
                        description: Text(locals.subscriptionNotificationDescription),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(locals.otherNotifications),
                  TabBar(tabs: [
                    Tab(icon: const Icon(Icons.people), text: locals.channels),
                    Tab(icon: const Icon(Icons.playlist_play), text: locals.playlists)
                  ]),
                  const Expanded(
                      child: TabBarView(
                    children: [ChannelNotificationList(), PlaylistNotificationList()],
                  ))
                ]),
              )
            ],
          ),
        );
      })),
    );
  }
}
