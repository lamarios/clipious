import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/components/channel_notifications.dart';
import 'package:invidious/settings/views/screens/search_history_settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:invidious/settings/views/screens/video_filter.dart';
import 'package:invidious/utils.dart';
import 'package:locale_names/locale_names.dart';
import 'package:optimize_battery/optimize_battery.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../myRouteObserver.dart';
import '../../../utils/views/components/select_list_dialog.dart';
import '../components/app_customizer.dart';

class AppearanceSettings extends StatelessWidget {
  const AppearanceSettings({super.key});

  selectTheme(BuildContext context, SettingsState _) {
    var cubit = context.read<SettingsCubit>();
    var locals = AppLocalizations.of(context)!;
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
                          title: Text(cubit.getThemeLabel(locals, e)),
                          value: e,
                          groupValue: _.themeMode,
                          onChanged: (value) {
                            Navigator.of(ctx).pop();
                            cubit.setThemeMode(value);
                          }))
                      .toList()),
            ));
  }

  String getNavigationLabelText(BuildContext context, NavigationDestinationLabelBehavior behavior) {
    var locals = AppLocalizations.of(context)!;
    return switch (behavior) {
      NavigationDestinationLabelBehavior.alwaysHide => locals.navigationBarLabelNeverShow,
      NavigationDestinationLabelBehavior.alwaysShow => locals.navigationBarLabelAlwaysShowing,
      NavigationDestinationLabelBehavior.onlyShowSelected => locals.navigationBarLabelShowOnSelect,
    };
  }

  customizeNavigationLabel(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var settings = context.read<SettingsCubit>();
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    SelectList.show<NavigationDestinationLabelBehavior>(context,
        values: NavigationDestinationLabelBehavior.values,
        value: settings.state.navigationBarLabelBehavior,
        itemBuilder: (value, selected) => Text(
              getNavigationLabelText(context, value),
              style: textTheme.bodyLarge?.copyWith(color: selected ? colors.primary : null),
            ),
        onSelect: settings.setNavigationBarLabelBehavior,
        title: locals.navigationBarStyle);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.appearance),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(child: BlocBuilder<SettingsCubit, SettingsState>(builder: (context, _) {
        var cubit = context.read<SettingsCubit>();
        return DefaultTabController(
          length: 2,
          child: SettingsList(
            lightTheme: theme,
            darkTheme: theme,
            sections: [
              SettingsSection(
                tiles: [
                  SettingsTile.switchTile(
                    initialValue: _.useDynamicTheme,
                    onToggle: cubit.toggleDynamicTheme,
                    title: Text(locals.useDynamicTheme),
                    description: Text(locals.useDynamicThemeDescription),
                  ),
                  SettingsTile(
                    title: Text(locals.themeBrightness),
                    value: Text(cubit.getThemeLabel(locals, _.themeMode)),
                    onPressed: (ctx) => selectTheme(ctx, _),
                  ),
                  SettingsTile.switchTile(
                    initialValue: _.blackBackground,
                    onToggle: cubit.toggleBlackBackground,
                    title: Text(locals.blackBackground),
                    description: Text(locals.blackBackgroundDescription),
                  ),
                  SettingsTile(
                    title: Text(locals.navigationBarStyle),
                    value: Text(getNavigationLabelText(context, _.navigationBarLabelBehavior)),
                    onPressed: (ctx) => customizeNavigationLabel(ctx),
                  ),
                ],
              ),
            ],
          ),
        );
      })),
    );
  }
}
