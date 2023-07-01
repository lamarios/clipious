import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/VideoFilterChannelController.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/views/settings/videoFilterChannel.dart';
import 'package:invidious/views/settings/videoFilterSetup.dart';

import '../../controllers/VideoFilterChannelController.dart';
import '../../controllers/VideoFilterChannelController.dart';
import '../../controllers/VideoFilterChannelController.dart';
import '../../controllers/VideoFilterChannelController.dart';
import '../../controllers/VideoFilterChannelController.dart';
import '../../controllers/VideoFilterChannelController.dart';
import '../../controllers/VideoFilterChannelController.dart';
import '../../controllers/videoFilterController.dart';
import '../../main.dart';
import '../../models/db/videoFilter.dart';
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
        builder: (_) {
          Map<String, List<VideoFilter>> mappedFilters = _.filters.groupBy(
            (p0) => p0.channelId ?? allChannels,
          );
          List<String> keys = mappedFilters.keys.toList();
          print(mappedFilters[allChannels]?.length);
          return Scaffold(
              appBar: AppBar(
                title: Text(locals.videoFilters),
              ),
              floatingActionButton: FloatingActionButton(onPressed: () => createFilter(context), backgroundColor: colors.primaryContainer, child: const Icon(Icons.add)),
              body: SafeArea(
                bottom: false,
                child: ListView.builder(
                  itemCount: mappedFilters.keys.length,
                  itemBuilder: (context, index) {
                    return VideoFilterChannel(key:ValueKey('$index-${(mappedFilters[keys[index]] ?? []).length}'), filters: mappedFilters[keys[index]] ?? []);
                  },
                ),
              ));
        });
  }
}
