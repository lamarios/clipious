import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saf/saf.dart';

import '../../states/settings.dart';

@RoutePage()
class DownloadedVideoSettingsScreen extends StatelessWidget {
  const DownloadedVideoSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colors);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.downloadedVideos),
      ),
      body: SafeArea(child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, _) {
        var cubit = context.read<SettingsCubit>();
        var shouldSelectFolder =
            _.customDownloadedVideoLocation && _.videoDownloadLocation == null;
        return DefaultTabController(
          length: 2,
          child: SettingsList(
            lightTheme: theme,
            darkTheme: theme,
            sections: [
              SettingsSection(
                tiles: [
                  SettingsTile.switchTile(
                    title: Text(locals.customDownloadLocation),
                    description: Text(locals.customDownloadLocationDescription),
                    initialValue: _.customDownloadedVideoLocation,
                    onToggle: (value) {
                      return cubit.enableCustomDownloadLocation(value);
                    },
                  ),
                  SettingsTile(
                    enabled: _.customDownloadedVideoLocation,
                    leading: shouldSelectFolder
                        ? const Icon(Icons.warning_amber)
                        : null,
                    title: Text(locals.customDownloadLocation),
                    description: Text(_.videoDownloadLocation ??
                        locals.noDownloadVideoLocationSelected),
                    onPressed: (context) async {
                      // await FilePicker.platform.clearTemporaryFiles();
                      Saf saf = Saf('~/Download');
                      bool? isGranted =
                          await saf.getDirectoryPermission(isDynamic: true);
                      print('$saf - granted ? $isGranted');
                      // cubit.setCustomDownloadLocation(selectedDirectory);
                    },
                  )
                ],
              ),
            ],
          ),
        );
      })),
    );
  }
}
