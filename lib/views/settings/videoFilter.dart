import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/views/settings/videoFilterSetup.dart';

import '../../controllers/videoFilterController.dart';
import '../../main.dart';
import '../../myRouteObserver.dart';

class VideoFilterSettings extends StatelessWidget {
  const VideoFilterSettings({Key? key}) : super(key: key);

  createFilter(BuildContext context, {String? channelId}) {
    navigatorKey.currentState?.push(MaterialPageRoute(
        settings: ROUTE_SETTINGS_VIDEO_FILTERS,
        builder: (context) => VideoFilterSetup(
              channelId: channelId,
            )));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    return GetBuilder<VideoFilterController>(
        init: VideoFilterController(),
        global: false,
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: Text(locals.videoFilters),
              ),
              floatingActionButton: FloatingActionButton(onPressed: () => createFilter(context), backgroundColor: colors.primaryContainer, child: const Icon(Icons.add)),
              body: SafeArea(
                bottom: false,
                child: ListView.builder(
                  itemCount: _.filters.length,
                  itemBuilder: (context, index) {
                    return Text('yo');
                  },
                ),
              ));
        });
  }
}
