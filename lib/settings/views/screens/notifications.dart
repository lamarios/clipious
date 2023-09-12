
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:settings_ui/settings_ui.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.notifications),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
        var cubit = context.read<SettingsCubit>();
        return Column(
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
                      onToggle: cubit.setBackgroundNotifications,
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
            )
          ],
        );
      })),
    );
  }
}
