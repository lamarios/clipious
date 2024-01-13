import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:invidious/utils.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class DeArrowSettingsScreen extends StatelessWidget {
  const DeArrowSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.browsing),
      ),
      body: SafeArea(child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, _) {
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
                    title: const Text("DeArrow"),
                    description: Text(locals.deArrowSettingDescription),
                    initialValue: _.dearrow,
                    onToggle: (value) {
                      if (value) {
                        okCancelDialog(
                            context,
                            "DeArrow",
                            locals.deArrowWarning,
                            () => cubit.setDearrow(value));
                      } else {
                        return cubit.setDearrow(value);
                      }
                    },
                  ),
                  SettingsTile.switchTile(
                    title: Text(locals.deArrowReplaceThumbnails),
                    description:
                        Text(locals.deArrowReplaceThumbnailsDescription),
                    initialValue: _.dearrowThumbnails,
                    onToggle: cubit.setDearrowThumbnail,
                    enabled: _.dearrow,
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
