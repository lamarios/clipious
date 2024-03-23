import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                      var mediaLibrary = Permission.accessMediaLocation;
                      var storageStatus = await mediaLibrary.status;
                      print(storageStatus.isGranted);
                      if (!storageStatus.isGranted) {
                        final request = await mediaLibrary.request();
                        print(request);
                      }
                      var defaultPath =
                          (await getDownloadsDirectory())?.absolute.path;

                      print(defaultPath);
                      await FilePicker.platform.clearTemporaryFiles();
                      String? selectedDirectory = await FilePicker.platform
                          .getDirectoryPath(initialDirectory: defaultPath);

                      if (selectedDirectory != null) {
                        cubit.setCustomDownloadLocation(defaultPath!);
                      }
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
