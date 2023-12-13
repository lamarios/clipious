import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/components/channel_notifications.dart';
import 'package:invidious/settings/views/components/playlist_notifications.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  enableBackgroundService(BuildContext context, bool enable) async {
    var settings = context.read<SettingsCubit>();
    await settings.setBackgroundNotifications(enable);
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
      body: SafeArea(child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
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
                        onToggle: (value) =>
                            enableBackgroundService(context, value),
                        title: Text(locals.notifications),
                        description:
                            Text(locals.enableNotificationDescriptions),
                      ),
                      CustomSettingsTile(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 24,
                            end: 24,
                            bottom: 19,
                            top: 19,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(locals.notificationFrequencySettingsTitle,
                                  style: TextStyle(
                                    color: theme.settingsTileTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Text(
                                  locals
                                      .notificationFrequencySettingsDescription,
                                  style: TextStyle(
                                      color: theme.tileDescriptionTextColor)),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Slider(
                                      value: state
                                          .backgroundNotificationFrequency
                                          .toDouble(),
                                      min: 1,
                                      max: 24,
                                      divisions: 23,
                                      label: locals
                                          .notificationFrequencySliderLabel(state
                                              .backgroundNotificationFrequency
                                              .toString()),
                                      onChanged: state.backgroundNotifications
                                          ? (value) =>
                                              cubit.setBackgroundCheckFrequency(
                                                  value.toInt())
                                          : null,
                                      onChangeEnd: state.backgroundNotifications
                                          ? (value) =>
                                              cubit.setBackgroundCheckFrequency(
                                                  value.toInt())
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Text(
                                      locals.notificationFrequencySliderLabel(
                                          state.backgroundNotificationFrequency
                                              .toString()),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SettingsTile.switchTile(
                        enabled: state.backgroundNotifications,
                        initialValue: state.subscriptionsNotifications,
                        onToggle: cubit.setSubscriptionsNotifications,
                        title: Text(locals.subscriptionNotification),
                        description:
                            Text(locals.subscriptionNotificationDescription),
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
                    Tab(
                        icon: const Icon(Icons.playlist_play),
                        text: locals.playlists)
                  ]),
                  const Expanded(
                      child: TabBarView(
                    children: [
                      ChannelNotificationList(),
                      PlaylistNotificationList()
                    ],
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
